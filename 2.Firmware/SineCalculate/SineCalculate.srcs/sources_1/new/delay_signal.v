`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/13 09:43:18
// Design Name: 
// Module Name: delay_signal
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


module delay_signal #(
    parameter N = 7  // 延迟的时钟周期数
)(
    input wire clk,       // 时钟信号
    input wire rstn,       // 复位信号
    input wire in_signal, // 输入信号
    output wire out_signal // 输出信号
);

    // 定义一个宽度为N的移位寄存器，用于存储延迟过程中的中间值
    reg [N-1:0] shift_reg;

    // 在时钟上升沿更新移位寄存器的值
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            shift_reg <= {N{1'b0}}; // 如果复位信号有效，清零寄存器
        end else begin
            shift_reg <= {shift_reg[N-2:0], in_signal}; // 向移位寄存器中加入新输入信号
        end
    end

    // 将移位寄存器的最高位作为延迟后的输出
    assign out_signal = shift_reg[N-1];

endmodule

