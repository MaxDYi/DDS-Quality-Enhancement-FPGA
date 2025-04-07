`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/05 20:44:55
// Design Name: 
// Module Name: sine_top_tb
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


module sine_top_tb;

    // 测试信号定义
    reg         sysclk_p;  // 差分时钟正
    reg         sysclk_n;  // 差分时钟负
    reg         sw_rst;  // 复位信号
    reg         sw_s;  // 模式选择
    wire [ 3:0] led;
    wire        dac_clk1;
    wire        dac_clk2;
    wire        dac_wrt1;
    wire        dac_wrt2;
    wire [13:0] dac_ch0;
    wire [13:0] dac_ch1;

    localparam CLK_PERIOD = 2.5;  // //差分时钟 时钟周期 5ns

    // 实例化被测模块
    sine_top sine_top_inst (
        .sysclk_p(sysclk_p),
        .sysclk_n(sysclk_n),
        .sw_rst  (sw_rst),
        .sw_s    (sw_s),
        .led     (led),
        .dac_clk1(dac_clk1),
        .dac_clk2(dac_clk2),
        .dac_wrt1(dac_wrt1),
        .dac_wrt2(dac_wrt2),
        .dac_ch0 (dac_ch0),
        .dac_ch1 (dac_ch1)
    );

    // 200MHz时钟生成
    initial begin
        sysclk_p = 0;
        sysclk_n = 1;
        sw_s = 0;
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
