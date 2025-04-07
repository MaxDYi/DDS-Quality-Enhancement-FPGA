`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MaxDYi
// 
// Create Date: 2024/11/08 12:48:38
// Design Name: 
// Module Name: mult_192x64
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


module mult_192x64 (
    input  wire         CLK,
    input  wire [191:0] A,
    input  wire [ 63:0] B,
    input  wire         SCLR,
    output wire [255:0] P
);

    wire [127:0] P1;
    wire [127:0] P2;
    wire [127:0] P3;
    assign P = (P3 << 128) + (P2 << 64) + P1;


    // 低64x64位乘法
    mult_64x64 mult1 (
        .CLK (CLK),
        .A   (A[63:0]),
        .B   (B),
        .SCLR(SCLR),
        .P   (P1)
    );

    // 中64x64位乘法
    mult_64x64 mult2 (
        .CLK (CLK),
        .A   (A[127:64]),
        .B   (B),
        .SCLR(SCLR),
        .P   (P2)
    );

    // 高64x64位乘法
    mult_64x64 mult3 (
        .CLK (CLK),
        .A   (A[191:128]),
        .B   (B),
        .SCLR(SCLR),
        .P   (P3)
    );

endmodule
