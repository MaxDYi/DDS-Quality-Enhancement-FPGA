`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MaxDYi
// 
// Create Date: 2024/11/07 20:27:44
// Design Name: 
// Module Name: dds_cordic
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


module dds_cordic (
    input  wire        clk,
    input  wire        rstn,
    input  wire [63:0] phase_step,
    output wire [15:0] dds_sin_out
);

    localparam PHASE_START = 66'h3_8000_0000_0000_0000;
    localparam PHASE_END = 66'h8000_0000_0000_0000;

    wire [15:0] dout_sin;  // cordic输出的正弦值
    wire        sin_symbol;  // cordic输出的正弦值符号
    wire [65:0] phase_accum_next;  // 下一个相位累加值
    wire        dout_symbol_last;
    reg  [65:0] phase_accum;  // 当前相位累加值
    reg  [17:0] phase_input;
    reg         phase_tvalid;  // 相位有效
    reg         dout_symbol;

    assign phase_accum_next = phase_accum + phase_step;  // 下一个相位累加值
    assign dds_sin_out = (dout_symbol_last == 1) ? (dout_sin - 16'h8000) : (dout_sin + 16'h7fff);

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            phase_accum  <= PHASE_START;
            phase_tvalid <= 1'b0;
            phase_input  <= 18'h0;
        end else begin
            phase_tvalid <= 1'b1;
            if ((phase_accum_next > PHASE_END) && (phase_accum_next < PHASE_START)) begin
                phase_accum <= phase_accum_next - PHASE_END + PHASE_START;
                dout_symbol <= 1'b0;
                phase_input <= phase_accum[65:48];
            end else begin
                phase_accum <= phase_accum_next;
                if (phase_accum_next >= 66'h3_C000_0000_0000_0000) begin
                    dout_symbol <= 1'b0;
                    phase_input <= phase_accum[65:48];
                end else if (phase_accum_next < 66'h0_4000_0000_0000_0000) begin
                    phase_input <= 18'h0_3fff - phase_accum[65:48] + 18'h3_C000;
                    dout_symbol <= 1'b0;
                end else if (phase_accum_next>=66'h0_4000_0000_0000_0000 && phase_accum_next<66'h0_8000_0000_0000_0000) begin
                    phase_input <= phase_accum[65:48] + 18'h3_8000;
                    dout_symbol <= 1'b1;
                end else begin
                    phase_input <= 18'h0_3bff - phase_accum[65:48] + 18'h3_C000;
                    dout_symbol <= 1'b1;
                end
            end
        end
    end



    // cordic计算正弦余弦值
    sine_cordic sine_cordic_inst (
        .clk            (clk),
        .rstn           (rstn),
        .phase_tvalid   (phase_tvalid),
        .phase_tdata    (phase_input),
        .dout_sin       (dout_sin),
        .dout_cos       (),
        .dout_sin_symbol(sin_symbol),
        .dout_cos_symbol(),
        .dout_tvalid    ()
    );


    delay_signal #(
        .N(21)
    ) sin_cos_flag_delay_delay_inst (
        .clk       (clk),
        .rstn      (rstn),
        .in_signal (dout_symbol),
        .out_signal(dout_symbol_last)
    );


endmodule
