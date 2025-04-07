`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MaxDYi
// 
// Create Date: 2024/11/05 18:38:55
// Design Name: 
// Module Name: sine_cordic
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


module sine_cordic (
    input  wire        clk,
    input  wire        rstn,
    input  wire        phase_tvalid,
    input  wire [17:0] phase_tdata,
    output wire [15:0] dout_sin,
    output wire [15:0] dout_cos,
    output wire        dout_sin_symbol,
    output wire        dout_cos_symbol,
    output wire        dout_tvalid
);

    wire [47:0] dout_tdata; // cordic输出的x和y值
    wire [23:0] x_out;  // cordic输出的x值
    wire [23:0] y_out;  // cordic输出的y值

    assign x_out = dout_tdata[23:0];  // cordic输出的x值
    assign y_out = dout_tdata[47:24];  // cordic输出的y值
    assign dout_sin_symbol = x_out[17];  // cordic输出的正弦值符号
    assign dout_cos_symbol = y_out[17];  // cordic输出的余弦值符号
    assign dout_sin = x_out[15:0];  // cordic输出的正弦值小数部分
    assign dout_cos = y_out[15:0];  // cordic输出的余弦值小数部分

    // cordic计算正弦值(radains scaled模式范围-1到1)
    cordic_sin_ip cordic_sin_ip_inst (
        .aclk               (clk),                  // input wire aclk
        .aresetn            (rstn),                 // input wire aresetn
        .s_axis_phase_tvalid(phase_tvalid),         // input wire s_axis_phase_tvalids
        .s_axis_phase_tdata ({6'h0, phase_tdata}),  // input wire [23 : 0] s_axis_phase_tdata
        .m_axis_dout_tvalid (dout_tvalid),          // output wire m_axis_dout_tvalid
        .m_axis_dout_tdata  (dout_tdata)            // output wire [47 : 0] m_axis_dout_tdata
    );

endmodule
