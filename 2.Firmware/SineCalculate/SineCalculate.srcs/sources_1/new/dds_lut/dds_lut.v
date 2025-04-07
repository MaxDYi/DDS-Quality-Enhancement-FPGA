`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MaxDYi
// 
// Create Date: 2024/11/08 18:13:56
// Design Name: 
// Module Name: dds_lut
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


module dds_lut (
    input  wire        clk,       // 时钟信号
    input  wire        rst_n,     // 复位信号
    input  wire [63:0] dds_ctrl,  // 相位步长控制
    output wire [15:0] sin_out,   // 正弦波输出 (16-bit)
    output wire [15:0] cos_out    // 余弦波输出 (16-bit)
);

    reg  [63:0] phase_acc;  // 相位累加器
    wire [15:0] phase_sin;  // 正弦波相位
    wire [15:0] phase_cos;  // 余弦波相位

    // 相位累加器更新
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            phase_acc <= 32'h0;  // 复位时清空相位累加器
        end else begin
            phase_acc <= phase_acc + dds_ctrl;  // 累加相位增量
        end
    end

    assign phase_sin = phase_acc[63:48];
    assign phase_cos = phase_acc[63:48] + 64'h4000_0000;  // 偏移90度

    // 实例化 rom_sin 模块，用于生成正弦波
    rom_sin rom_sin_inst_sin (
        .clka (clk),        // input wire clka
        .addra({phase_sin[15:4],4'h0}),  // input wire [15 : 0] addra
        .douta(sin_out),    // output wire [15 : 0] douta
        .clkb (clk),        // input wire clkb
        .addrb({phase_cos[15:4],4'h0}),  // input wire [15 : 0] addrb
        .doutb(cos_out)     // output wire [15 : 0] doutb
    );

endmodule
