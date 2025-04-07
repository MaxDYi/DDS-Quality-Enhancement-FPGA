`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 10:29:28
// Design Name: 
// Module Name: dds_lut_tb
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

module dds_lut_tb;
    // 测试信号定义
    reg         sysclk_p;  // 差分时钟正
    reg         sysclk_n;  // 差分时钟负
    reg         sw_rst;  // 复位信号
    wire [15:0] dds_lut;  // 正弦波输出


    localparam CLK_PERIOD = 2.5;  // //差分时钟 时钟周期 5ns

    // 实例化被测模块
    dds_lut_top dds_lut_top_inst (
        .sysclk_p     (sysclk_p),
        .sysclk_n     (sysclk_n),
        .sw_rst       (sw_rst),
        .dds_lut      (dds_lut)
    );

    // 200MHz时钟生成
    initial begin
        sysclk_p = 0;
        sysclk_n = 1;
        forever begin
            #CLK_PERIOD sysclk_p = ~sysclk_p;
            sysclk_n = ~sysclk_p;
        end
    end

    // 复位信号生成
    initial begin
        sw_rst = 1;
        #10;
        sw_rst = 0;  // 100ns后取消复位
    end

    // 仿真过程
    initial begin
        // 初始化
        $display("Simulation start");

        // 等待复位结束
        #20;

        // 仿真时间结束
        #1000;
        $stop;
    end

endmodule

