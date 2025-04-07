`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MaxDYi
// 
// Create Date: 2024/11/07 20:27:45
// Design Name: 
// Module Name: dds_taylor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dds_taylor (
    input  wire        clk,
    input  wire        rstn,
    input  wire [63:0] phase_step,
    output wire [15:0] dds_out
);

    localparam phase_init = 64'h0;
    /*
    localparam PI_2_VALUE = 32'd411774;  // 2PI
    localparam PI_3_2_VALUE = 32'd308831;  // 3*PI/2
    localparam PI_1_VALUE = 32'd205887;  // PI
    localparam PI_1_2_VALUE = 32'd102943;  // PI/2
    localparam PI_1_4_VALUE = 32'd51471;  // PI/4
    localparam SIN_COS_MID = 32'd51471;  // PI/4作为sin与cos的分界线
    
    localparam PI_2_VALUE = 64'd1_768_559_438_007_110;  // 2PI
    localparam PI_3_2_VALUE = 64'd1_326_419_578_505_332;  // 3*PI/2
    localparam PI_1_VALUE = 64'd884_279_719_003_555;  // PI
    localparam PI_1_2_VALUE = 64'd442_139_859_501_777;  // PI/2
    localparam PI_1_4_VALUE = 64'd221_069_929_750_888;  // PI/4
    localparam SIN_COS_MID = PI_1_4_VALUE;  // PI/4作为sin与cos的分界线
    */


    reg  [63:0] phase_accum;  // 相位累加值
    reg         dout_symbol;  // 输出结果符号
    reg  [63:0] phase_tdata;  // 输入相位值0 ~ pi/2
    wire [63:0] phase_accum_next;  // 下一个相位累加值
    wire [31:0] sin_phase;  // sin相位值
    wire [31:0] cos_phase;  // cos相位值
    wire [16:0] sin_out;  // sin输出值
    wire [16:0] cos_out;  // cos输出值
    wire [16:0] dds_sin_out;  // dds sin输出值
    wire [16:0] dds_cos_out;  // dds cos输出值
    wire        sin_cos_flag;  // sin/cos标志

    // 延后信号匹配流水线延迟
    wire        dout_symbol_delay;  // 输出结果符号延迟
    //wire        sin_cos_flag_delay;  // sin/cos标志延迟

    assign sin_phase = phase_tdata >> 32;
    assign cos_phase = (PI_1_2_VALUE - phase_tdata) >> 32;  // 偏移90度
    assign sin_cos_flag = (phase_tdata > SIN_COS_MID) ? 1'b1 : 1'b0;  // 0: sin, 1: cos
    //assign sin_cos_flag = (sin_out > cos_out) ? 1'b1 : 1'b0;  // 0: sin, 1: cos
    assign dds_out = (sin_cos_flag_delay == 1'b0) ? dds_sin_out : dds_cos_out;
    assign dds_sin_out=(dout_symbol_delay==0)?(16'h8000+(sin_out>>1)):(16'h7fff-(sin_out>>1));   // 输出值整理
    assign dds_cos_out=(dout_symbol_delay==0)?(16'h8000+(cos_out>>1)):(16'h7fff-(cos_out>>1));   // 输出值整理
    assign phase_accum_next = (phase_accum + phase_step >= PI_2_VALUE) ? (phase_accum + phase_step - PI_2_VALUE) : (phase_accum + phase_step);

    reg [63:0] PI_2_VALUE;
    reg [63:0] PI_3_2_VALUE;
    reg [63:0] PI_1_VALUE;
    reg [63:0] PI_1_2_VALUE;
    reg [63:0] PI_1_4_VALUE;
    reg [63:0] SIN_COS_MID;
    initial begin
        PI_2_VALUE   = 64'd1_768_559_438_007_110;  // 2PI 的值
        PI_3_2_VALUE = 64'd1_326_419_578_505_332;  // 3*PI/2 的值
        PI_1_VALUE   = 64'd884_279_719_003_555;  // PI 的值
        PI_1_2_VALUE = 64'd442_139_859_501_777;  // PI/2 的值
        PI_1_4_VALUE = 64'd221_069_929_750_888;  // PI/4 的值
        SIN_COS_MID  = 64'd252_699_789_841_525;  // sin与cos的分界线
    end


    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            phase_accum <= phase_init;
            phase_tdata <= phase_init;
            dout_symbol <= 1'b0;
        end else begin
            phase_accum <= phase_accum_next;
            if (phase_accum_next < PI_1_2_VALUE) begin
                phase_tdata <= phase_accum_next;
                dout_symbol <= 1'b0;
            end else if (phase_accum_next < PI_1_VALUE) begin
                phase_tdata <= PI_1_VALUE - phase_accum_next;
                dout_symbol <= 1'b0;
            end else if (phase_accum_next < PI_3_2_VALUE) begin
                phase_tdata <= phase_accum_next - PI_1_VALUE;
                dout_symbol <= 1'b1;
            end else begin
                phase_tdata <= PI_2_VALUE - phase_accum_next;
                dout_symbol <= 1'b1;
            end
        end
    end


    sin_cos_taylor_pipeline sin_cos_taylor_pipeline_1_inst (
        .clk    (clk),
        .rstn   (rstn),
        .phase  (sin_phase),
        .sin_out(sin_out),
        .cos_out()
    );

    sin_cos_taylor_pipeline sin_cos_taylor_pipeline_2_inst (
        .clk    (clk),
        .rstn   (rstn),
        .phase  (cos_phase),
        .sin_out(),
        .cos_out(cos_out)
    );

    delay_signal #(
        .N(7)
    ) dout_symbol_delay_inst (
        .clk       (clk),
        .rstn      (rstn),
        .in_signal (dout_symbol),
        .out_signal(dout_symbol_delay)
    );

    delay_signal #(
        .N(7)
    ) sin_cos_flag_delay_delay_inst (
        .clk       (clk),
        .rstn      (rstn),
        .in_signal (sin_cos_flag),
        .out_signal(sin_cos_flag_delay)
    );



endmodule
