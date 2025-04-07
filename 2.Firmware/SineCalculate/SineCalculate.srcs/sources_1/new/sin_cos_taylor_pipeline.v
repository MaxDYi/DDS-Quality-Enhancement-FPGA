`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/11 22:49:16
// Design Name: 
// Module Name: sin_cos_taylor_line
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


module sin_cos_taylor_pipeline (
    input  wire        clk,
    input  wire        rstn,
    input  wire [17:0] phase,
    output reg  [16:0] sin_out,
    output reg  [16:0] cos_out
);

    localparam sin_k1 = 18'd65536;
    localparam sin_k2 = 18'd10923;
    localparam sin_k3 = 18'd546;
    localparam sin_k4 = 18'd13;
    localparam cos_k1 = 18'd65536;
    localparam cos_k2 = 18'd32768;
    localparam cos_k3 = 18'd2731;
    localparam cos_k4 = 18'd91;

    reg        [ 17:0] x_0;
    reg        [ 17:0] x_1;
    wire       [ 35:0] x_2;
    wire       [ 53:0] x_3;
    wire       [ 71:0] x_4;
    wire       [ 89:0] x_5;
    wire       [107:0] x_6;
    wire       [125:0] x_7;
    wire       [ 35:0] sin_kx1;
    wire       [ 71:0] sin_kx2;
    wire       [107:0] sin_kx3;
    wire       [143:0] sin_kx4;
    wire       [ 35:0] cos_kx1;
    wire       [ 53:0] cos_kx2;
    wire       [ 89:0] cos_kx3;
    wire       [125:0] cos_kx4;
    reg signed [161:0] sin_sum1;
    reg signed [161:0] sin_sum2;
    reg signed [161:0] sin_sum3;
    reg signed [161:0] sin_sum4;
    reg signed [161:0] cos_sum1;
    reg signed [161:0] cos_sum2;
    reg signed [161:0] cos_sum3;
    reg signed [161:0] cos_sum4;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            x_0 <= 18'h0;
            x_1 <= 18'h0;
            sin_sum1 <= 161'h0;
            cos_sum1 <= 161'h0;
            sin_sum2 <= 161'h0;
            cos_sum2 <= 161'h0;
            sin_sum3 <= 161'h0;
            cos_sum3 <= 161'h0;
            sin_sum4 <= 161'h0;
            cos_sum4 <= 161'h0;
            sin_out <= 17'h0;
            cos_out <= 17'h0;
        end else begin
            x_0 <= 18'h1;
            x_1 <= phase;
            sin_sum1 <= (sin_kx1 << 96);
            sin_sum2 <= sin_sum1 - (sin_kx2 << 64);
            sin_sum3 <= sin_sum2 + (sin_kx3 << 32);
            sin_sum4 <= sin_sum3 - (sin_kx4 << 0);
            cos_sum1 <= (cos_kx1 << 96);
            cos_sum2 <= cos_sum1 - (cos_kx2 << 64);
            cos_sum3 <= cos_sum2 + (cos_kx3 << 32);
            cos_sum4 <= cos_sum3 - (cos_kx4 << 0);
            if (sin_sum4 < 0) begin
                sin_out <= ((-sin_sum4) >> 112);
            end else begin
                sin_out <= ((sin_sum4) >> 112);
            end
            if (cos_sum4 < 0) begin
                cos_out <= ((-cos_sum4) >> 96);
            end else begin
                cos_out <= ((cos_sum4 - 1'b1) >> 96);
            end
        end
    end

    mult_u18xu18 mult_u18xu18_sin_kx1 (
        .CLK (clk),
        .A   (sin_k1),
        .B   (x_1),
        .SCLR(~rstn),
        .P   (sin_kx1)
    );
    mult_u18xu54 mult_u18xu54_sin_kx2 (
        .CLK (clk),
        .A   (sin_k2),
        .B   (x_3),
        .SCLR(~rstn),
        .P   (sin_kx2)
    );
    mult_u18xu90 mult_u18xu90_sin_kx3 (
        .CLK (clk),
        .A   (sin_k3),
        .B   (x_5),
        .SCLR(~rstn),
        .P   (sin_kx3)
    );
    mult_u18xu126 mult_u18xu126_sin_kx4 (
        .CLK (clk),
        .A   (sin_k4),
        .B   (x_7),
        .SCLR(~rstn),
        .P   (sin_kx4)
    );

    mult_u18xu18 mult_u18xu18_cos_kx1 (
        .CLK (clk),
        .A   (cos_k1),
        .B   (x_0),
        .SCLR(~rstn),
        .P   (cos_kx1)
    );
    mult_u18xu36 mult_u18xu36_cos_kx2 (
        .CLK (clk),
        .A   (cos_k2),
        .B   (x_2),
        .SCLR(~rstn),
        .P   (cos_kx2)
    );
    mult_u18xu72 mult_u18xu72_cos_kx3 (
        .CLK (clk),
        .A   (cos_k3),
        .B   (x_4),
        .SCLR(~rstn),
        .P   (cos_kx3)
    );
    mult_u18xu108 mult_u18xu108_cos_kx4 (
        .CLK (clk),
        .A   (cos_k4),
        .B   (x_6),
        .SCLR(~rstn),
        .P   (cos_kx4)
    );

    mult_u18xu18 mult_u18xu18_x_2 (
        .CLK (clk),
        .A   (x_1),
        .B   (x_1),
        .SCLR(~rstn),
        .P   (x_2)
    );
    mult_u18xu36 mult_u18xu36_x_3 (
        .CLK (clk),
        .A   (x_1),
        .B   (x_2),
        .SCLR(~rstn),
        .P   (x_3)
    );
    mult_u18xu54 mult_u18xu54_x_4 (
        .CLK (clk),
        .A   (x_1),
        .B   (x_3),
        .SCLR(~rstn),
        .P   (x_4)
    );
    mult_u18xu72 mult_u18xu72_x_5 (
        .CLK (clk),
        .A   (x_1),
        .B   (x_4),
        .SCLR(~rstn),
        .P   (x_5)
    );
    mult_u18xu90 mult_u18xu90_x_6 (
        .CLK (clk),
        .A   (x_1),
        .B   (x_5),
        .SCLR(~rstn),
        .P   (x_6)
    );
    mult_u18xu108 mult_u18xu108_x_7 (
        .CLK (clk),
        .A   (x_1),
        .B   (x_6),
        .SCLR(~rstn),
        .P   (x_7)
    );



endmodule
