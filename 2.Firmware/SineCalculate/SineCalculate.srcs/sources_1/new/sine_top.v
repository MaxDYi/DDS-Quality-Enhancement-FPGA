`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MaxDYi
// 
// Create Date: 2024/11/05 18:48:16
// Design Name: 
// Module Name: sine_top
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


module sine_top (
    input  wire        sysclk_p,
    input  wire        sysclk_n,
    input  wire        sw_rst,
    input  wire        sw_s,
    output wire [ 3:0] led,
    //output wire        dac0_clk_p,
    //output wire        dac0_clk_n,
    //output wire        dac1_clk_p,
    //output wire        dac1_clk_n,
    output wire        dac_clk1,
    output wire        dac_clk2,
    output wire        dac_wrt1,
    output wire        dac_wrt2,
    output wire [13:0] dac_ch0,
    output wire [13:0] dac_ch1
    //output wire [13:0] dac_ch2,
    //output wire [13:0] dac_ch3
);

    wire        rstn;
    wire        clk;
    wire        pll_locked;
    wire        clk_100;
    wire        clk_20;
    wire        clk_10;
    wire        clk_50;
    wire        dac_clk_p;
    wire        dac_clk_n;
    wire [15:0] dds_taylor;
    wire [15:0] dds_cordic;
    wire [15:0] dds_lut;
    wire [15:0] dds_lut_1_4;
    wire [15:0] dac_taylor;
    wire [15:0] dac_cordic;
    wire [15:0] dac_lut;
    wire [15:0] dac_lut_1_4;
    reg  [15:0] dds;
    reg  [ 1:0] mode;
    reg         sw_s_last;
    reg  [63:0] dds_taylor_step;
    reg  [63:0] dds_cordic_step;
    reg  [63:0] dds_lut_step;

    initial begin
        /*
        // 100MHz时钟输出100kHz信号
        dds_taylor_step = 64'd1_768_559_438_007;
        dds_cordic_step = 64'd18_014_398_509_481_984;
        dds_lut_step = 64'd18_446_744_073_709_552;
        */
        /*
        // 100MHz时钟输出50kHz信号
        dds_taylor_step = 64'd1_768_559_438_007 >> 1;
        //dds_cordic_step = 64'd18_014_398_509_481_984>>1;
        dds_cordic_step = 64'd18_457_375_522_010_229 >> 1;
        dds_lut_step = 64'd18_446_744_073_709_552 >> 1;
        */
        /*
        // 100MHz时钟输出10kHz信号
        dds_taylor_step = 64'd176_855_943_800;                 
        dds_cordic_step = 64'd1_801_439_850_948_198;
        dds_lut_step = 64'd1_844_674_407_370_955;
        */
        ///*
        // 100MHz时钟输出1kHz信号
        dds_taylor_step = 64'd17_685_594_380;
        //dds_cordic_step = 64'd180_143_985_094_819;
        dds_cordic_step = 64'd184_573_755_220_102;  //修正频偏1/0.976
        dds_lut_step = 64'd184_467_440_737_095;
        //*/
        /*
        // 100MHz时钟输出1Hz信号
        dds_taylor_step = 64'd17_685_594;
        dds_cordic_step = 64'd180_143_985_094;
        dds_lut_step = 64'd184_467_440_737;
        */
    end

    /*
    assign dac_ch0 = dds;
    assign dac_ch1 = dac_lut_1_4;
    assign dac_ch2 = dac_cordic;
    assign dac_ch3 = dac_taylor;
    */
    /*
    assign dac_ch0 = dac_lut;
    assign dac_ch1 = dac_lut;
    assign dac_ch2 = dac_lut;
    assign dac_ch3 = dac_lut;
    */
    /*
    assign dac_ch0 = dac_lut_1_4;
    assign dac_ch1 = dac_lut_1_4;
    assign dac_ch2 = dac_lut_1_4;
    assign dac_ch3 = dac_lut_1_4;
    */
    /*
    assign dac_ch0 = dac_taylor;
    assign dac_ch1 = dac_taylor;
    assign dac_ch2 = dac_taylor;
    assign dac_ch3 = dac_taylor;
    */
    /*
    assign dac_ch0 = dac_cordic;
    assign dac_ch1 = dac_cordic;
    assign dac_ch2 = dac_cordic;
    assign dac_ch3 = dac_cordic;
    */

    assign dac_clk1 = clk_100;
    assign dac_clk2 = clk_100;
    assign dac_wrt1 = clk_100;
    assign dac_wrt2 = clk_100;
    //assign dac_ch0 = dds_lut_1_4 >> 2;
    //assign dac_ch1 = dds_lut_1_4 >> 2;
    //assign dac_ch0 = dds_taylor >> 2;
    //assign dac_ch1 = dds_taylor >> 2;
    assign dac_ch0 = dds_cordic >> 2;
    assign dac_ch1 = dds_cordic >> 2;

    assign clk = clk_100;
    assign rstn = ~sw_rst;
    assign dac_taylor = {~dds_taylor[15], dds_taylor[14:0]};
    assign dac_cordic = {~dds_cordic[15], dds_cordic[14:0]};
    assign dac_lut = {~dds_lut[15], dds_lut[14:0]};
    assign dac_lut_1_4 = {~dds_lut_1_4[15], dds_lut_1_4[14:0]};
    /*
    assign dac0_clk_p = dac_clk_p;
    assign dac0_clk_n = dac_clk_n;
    assign dac1_clk_p = dac_clk_p;
    assign dac1_clk_n = dac_clk_n;
    */

    assign led[3] = pll_locked;
    assign led[2] = (mode == 2'h2) ? 1'b1 : 1'b0;
    assign led[1] = (mode == 2'h1) ? 1'b1 : 1'b0;
    assign led[0] = (mode == 2'h0) ? 1'b1 : 1'b0;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            dds <= 16'h0;
            mode <= 2'h0;
            sw_s_last <= 1'b0;
        end else begin
            sw_s_last <= sw_s;
            if ((sw_s_last == 1'b0) && (sw_s == 1'b1)) begin
                if (mode >= 2'h2) begin
                    mode <= 0;
                end else begin
                    mode <= mode + 1'b1;
                end
            end
            case (mode)
                2'h0: begin
                    dds <= dac_ch1;
                end
                2'h1: begin
                    //dds <= dac_ch2;
                end
                2'h2: begin
                    //dds <= dac_ch3;
                end
                default: begin
                    dds <= 16'h0;
                end
            endcase
        end
    end

    clk_pll clk_pll_inst (
        .resetn     (rstn),
        .clk_in1_n  (sysclk_n),
        .clk_in1_p  (sysclk_p),
        .clk_out_100(clk_100),
        .clk_out_20 (clk_20),
        .clk_out_10 (clk_10),
        .clk_out_50 (clk_50),
        .clk_dac_p  (dac_clk_p),
        .clk_dac_n  (dac_clk_n),
        .locked     (pll_locked)
    );

    dds_taylor dds_taylor_inst (
        .clk       (clk),
        .rstn      (rstn & pll_locked),
        .phase_step(dds_taylor_step),
        .dds_out   (dds_taylor)
    );

    dds_cordic dds_cordic_inst (
        .clk        (clk),
        .rstn       (rstn & pll_locked),
        .phase_step (dds_cordic_step),
        .dds_out    (dds_cordic)
    );

    dds_lut dds_lut_inst (
        .clk     (clk),
        .rst_n   (rstn & pll_locked),
        .dds_ctrl(dds_lut_step),
        .sin_out (dds_lut),
        .cos_out ()
    );

    dds_lut_1_4 dds_lut_1_4_inst (
        .clk     (clk),
        .rst_n   (rstn & pll_locked),
        .dds_ctrl(dds_lut_step),
        .sin_out (dds_lut_1_4)
    );


endmodule
