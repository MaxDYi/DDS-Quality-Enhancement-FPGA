`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/11 23:06:59
// Design Name: 
// Module Name: mult_u18xu108
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


module mult_u18xu108 (
    input  wire         CLK,
    input  wire [ 17:0] A,
    input  wire [107:0] B,
    input  wire         SCLR,
    output wire [125:0] P
);

    wire [35:0] P1;
    wire [35:0] P2;
    wire [35:0] P3;
    wire [35:0] P4;
    wire [35:0] P5;
    wire [35:0] P6;

    assign P = (P6 << 90) + (P5 << 72) + (P4 << 54) + (P3 << 36) + (P2 << 18) + P1;

    mult_u18xu18 mult_u18xu18_1 (
        .CLK (CLK),
        .A   (A),
        .B   (B[17:0]),
        .SCLR(SCLR),
        .P   (P1)
    );

    mult_u18xu18 mult_u18xu18_2 (
        .CLK (CLK),
        .A   (A),
        .B   (B[35:18]),
        .SCLR(SCLR),
        .P   (P2)
    );

    mult_u18xu18 mult_u18xu18_3 (
        .CLK (CLK),
        .A   (A),
        .B   (B[53:36]),
        .SCLR(SCLR),
        .P   (P3)
    );

    mult_u18xu18 mult_u18xu18_4 (
        .CLK (CLK),
        .A   (A),
        .B   (B[71:54]),
        .SCLR(SCLR),
        .P   (P4)
    );

    mult_u18xu18 mult_u18xu18_5 (
        .CLK (CLK),
        .A   (A),
        .B   (B[89:72]),
        .SCLR(SCLR),
        .P   (P5)
    );

    mult_u18xu18 mult_u18xu18_6 (
        .CLK (CLK),
        .A   (A),
        .B   (B[107:90]),
        .SCLR(SCLR),
        .P   (P6)
    );

endmodule
