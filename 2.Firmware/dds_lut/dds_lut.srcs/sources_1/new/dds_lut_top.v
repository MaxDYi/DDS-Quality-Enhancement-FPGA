`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 10:13:22
// Design Name: 
// Module Name: dds_lut_top
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

module dds_lut_top (
    input  wire        sysclk_p,
    input  wire        sysclk_n,
    input  wire        sw_rst,
    output wire [15:0] dds_lut
);

    wire clk;
    wire rstn;
    wire pll_locked;
    wire clk_100;

    assign clk  = clk_100;
    assign rstn = ~sw_rst;

    clk_pll clk_pll_inst (
        .resetn     (rstn),
        .clk_in1_n  (sysclk_n),
        .clk_in1_p  (sysclk_p),
        .clk_out_100(clk_100),
        .locked     (pll_locked)
    );

    dds_lut dds_lut_inst (
        .clk     (clk),
        .rst_n   (rstn & pll_locked),
        .dds_ctrl(64'h10_0000_0000_0000),
        .sin_out (dds_lut[15:0])
    );


endmodule
