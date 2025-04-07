// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Nov 10 14:51:21 2024
// Host        : Laptop-OMEN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/SineCalculate/2.Firmware/SineCalculate/SineCalculate.gen/sources_1/ip/mult_64x64/mult_64x64_stub.v
// Design      : mult_64x64
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_21,Vivado 2024.1" *)
module mult_64x64(CLK, A, B, SCLR, P)
/* synthesis syn_black_box black_box_pad_pin="A[63:0],B[63:0],SCLR,P[127:0]" */
/* synthesis syn_force_seq_prim="CLK" */;
  input CLK /* synthesis syn_isclock = 1 */;
  input [63:0]A;
  input [63:0]B;
  input SCLR;
  output [127:0]P;
endmodule
