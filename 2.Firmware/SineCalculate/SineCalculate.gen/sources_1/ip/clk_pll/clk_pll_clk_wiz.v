
// file: clk_pll.v
// (c) Copyright 2017-2018, 2023 Advanced Micro Devices, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// clk_out_100__100.00000______0.000______50.0______136.686____105.461
// clk_out_20__20.00000______0.000______50.0______188.136____105.461
// clk_out_10__10.00000______0.000______50.0______215.046____105.461
// clk_out_50__50.00000______0.000______50.0______157.199____105.461
// clk_dac_p__10.00000______0.000______50.0______215.046____105.461
// clk_dac_n__10.00000____180.000______50.0______215.046____105.461
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________200.000____________0.010

`timescale 1ps/1ps

module clk_pll_clk_wiz 

 (// Clock in ports
  // Clock out ports
  output        clk_out_100,
  output        clk_out_20,
  output        clk_out_10,
  output        clk_out_50,
  output        clk_dac_p,
  output        clk_dac_n,
  // Status and control signals
  input         resetn,
  output        locked,
  input         clk_in1_p,
  input         clk_in1_n
 );
  // Input buffering
  //------------------------------------
wire clk_in1_clk_pll;
wire clk_in2_clk_pll;
  IBUFDS clkin1_ibufgds
   (.O  (clk_in1_clk_pll),
    .I  (clk_in1_p),
    .IB (clk_in1_n));




  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk_out_100_clk_pll;
  wire        clk_out_20_clk_pll;
  wire        clk_out_10_clk_pll;
  wire        clk_out_50_clk_pll;
  wire        clk_dac_p_clk_pll;
  wire        clk_dac_n_clk_pll;
  wire        clk_out7_clk_pll;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_clk_pll;
  wire        clkfbout_buf_clk_pll;
  wire        clkfboutb_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;

  PLLE2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (2),
    .CLKFBOUT_MULT        (9),
    .CLKFBOUT_PHASE       (0.000),
    .CLKOUT0_DIVIDE       (9),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT1_DIVIDE       (45),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT2_DIVIDE       (90),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT3_DIVIDE       (18),
    .CLKOUT3_PHASE        (0.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKOUT4_DIVIDE       (90),
    .CLKOUT4_PHASE        (0.000),
    .CLKOUT4_DUTY_CYCLE   (0.500),
    .CLKOUT5_DIVIDE       (90),
    .CLKOUT5_PHASE        (180.000),
    .CLKOUT5_DUTY_CYCLE   (0.500),
    .CLKIN1_PERIOD        (5.000))
  plle2_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_clk_pll),
    .CLKOUT0             (clk_out_100_clk_pll),
    .CLKOUT1             (clk_out_20_clk_pll),
    .CLKOUT2             (clk_out_10_clk_pll),
    .CLKOUT3             (clk_out_50_clk_pll),
    .CLKOUT4             (clk_dac_p_clk_pll),
    .CLKOUT5             (clk_dac_n_clk_pll),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_clk_pll),
    .CLKIN1              (clk_in1_clk_pll),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Other control and status signals
    .LOCKED              (locked_int),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));
  assign reset_high = ~resetn; 

  assign locked = locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_clk_pll),
    .I (clkfbout_clk_pll));






  BUFG clkout1_buf
   (.O   (clk_out_100),
    .I   (clk_out_100_clk_pll));


  BUFG clkout2_buf
   (.O   (clk_out_20),
    .I   (clk_out_20_clk_pll));

  BUFG clkout3_buf
   (.O   (clk_out_10),
    .I   (clk_out_10_clk_pll));

  BUFG clkout4_buf
   (.O   (clk_out_50),
    .I   (clk_out_50_clk_pll));

  BUFG clkout5_buf
   (.O   (clk_dac_p),
    .I   (clk_dac_p_clk_pll));

  BUFG clkout6_buf
   (.O   (clk_dac_n),
    .I   (clk_dac_n_clk_pll));



endmodule
