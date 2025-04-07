-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Thu Nov 14 13:40:27 2024
-- Host        : Desktop-NUC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/SineCalculate/2.Firmware/SineCalculate/SineCalculate.gen/sources_1/ip/clk_pll/clk_pll_stub.vhdl
-- Design      : clk_pll
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_pll is
  Port ( 
    clk_out_100 : out STD_LOGIC;
    clk_out_20 : out STD_LOGIC;
    clk_out_10 : out STD_LOGIC;
    clk_out_50 : out STD_LOGIC;
    clk_dac_p : out STD_LOGIC;
    clk_dac_n : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end clk_pll;

architecture stub of clk_pll is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out_100,clk_out_20,clk_out_10,clk_out_50,clk_dac_p,clk_dac_n,resetn,locked,clk_in1_p,clk_in1_n";
begin
end;
