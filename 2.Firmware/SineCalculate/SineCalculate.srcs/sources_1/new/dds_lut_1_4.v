`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 11:42:11
// Design Name: 
// Module Name: dds_lut_1_4
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


module dds_lut_1_4 (
    input  wire        clk,       // 时钟信号
    input  wire        rst_n,     // 复位信号
    input  wire [63:0] dds_ctrl,  // 相位步长控制
    output wire [15:0] sin_out    // 正弦波输出 (16-bit)
);

    reg  [63:0] phase_acc;  // 相位累加器
    wire [ 1:0] phase_flag;  // 相位象限
    wire [15:0] phase_sin;  // 正弦波相位
    wire [13:0] phase_input;  // ROM地址
    wire [15:0] rom_out;  // ROM输出

    // 取相位的高16位作为ROM地址
    assign phase_sin = phase_acc[63:48];
    // 根据相位所在象限
    assign phase_flag = phase_sin[15:14];
    // 根据象限修改输入相位值
    assign phase_input = (phase_flag == 2'h0) ? (phase_sin) :  // 第一象限
        (phase_flag == 2'h1) ? (16'h7fff - phase_sin) :  // 第二象限
        (phase_flag == 2'h2) ? (phase_sin - 16'h8000) :  // 第三象限
        (16'h7fff - phase_sin);  // 第四象限
    // 根据象限修改输出正弦波值
    assign sin_out = (phase_flag == 2'h0) ? (rom_out >> 1) + 16'h8000 :  // 第一象限
        (phase_flag == 2'h1) ? (rom_out >> 1) + 16'h7fff :  // 第二象限
        (phase_flag == 2'h2) ? (16'h7fff - (rom_out >> 1)) :  // 第三象限
        (16'h8000 - (rom_out >> 1));  // 第四象限

    // 相位累加器更新
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            phase_acc <= 64'h0;  // 复位时清空相位累加器
        end else begin
            phase_acc <= phase_acc + dds_ctrl;  // 累加相位增量
        end
    end

    // 实例化 rom_sin_1_4 模块，用于生成1/4周期的正弦波
    rom_sin_1_4 rom_sin_1_4_inst_sin (
        .clka (clk),          // input wire clka
        .addra(phase_input),  // input wire [13 : 0] addra
        .douta(rom_out),      // output wire [15 : 0] douta
        .clkb (clk),          // input wire clkb
        .addrb(14'h0),        // input wire [13 : 0] addrb
        .doutb()              // output wire [15 : 0] doutb
    );


endmodule
