vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xbip_utils_v3_0_13
vlib modelsim_lib/msim/c_reg_fd_v12_0_9
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_6
vlib modelsim_lib/msim/xbip_pipe_v3_0_9
vlib modelsim_lib/msim/xbip_dsp48_addsub_v3_0_9
vlib modelsim_lib/msim/xbip_addsub_v3_0_9
vlib modelsim_lib/msim/c_addsub_v12_0_18
vlib modelsim_lib/msim/xbip_bram18k_v3_0_9
vlib modelsim_lib/msim/mult_gen_v12_0_21
vlib modelsim_lib/msim/axi_utils_v2_0_9
vlib modelsim_lib/msim/cordic_v6_0_22
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xbip_utils_v3_0_13 modelsim_lib/msim/xbip_utils_v3_0_13
vmap c_reg_fd_v12_0_9 modelsim_lib/msim/c_reg_fd_v12_0_9
vmap xbip_dsp48_wrapper_v3_0_6 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_6
vmap xbip_pipe_v3_0_9 modelsim_lib/msim/xbip_pipe_v3_0_9
vmap xbip_dsp48_addsub_v3_0_9 modelsim_lib/msim/xbip_dsp48_addsub_v3_0_9
vmap xbip_addsub_v3_0_9 modelsim_lib/msim/xbip_addsub_v3_0_9
vmap c_addsub_v12_0_18 modelsim_lib/msim/c_addsub_v12_0_18
vmap xbip_bram18k_v3_0_9 modelsim_lib/msim/xbip_bram18k_v3_0_9
vmap mult_gen_v12_0_21 modelsim_lib/msim/mult_gen_v12_0_21
vmap axi_utils_v2_0_9 modelsim_lib/msim/axi_utils_v2_0_9
vmap cordic_v6_0_22 modelsim_lib/msim/cordic_v6_0_22
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv \
"D:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"D:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_13  -93  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_9  -93  \
"../../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6  -93  \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_9  -93  \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_9  -93  \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_9  -93  \
"../../../ipstatic/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_18  -93  \
"../../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_9  -93  \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_21  -93  \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_9  -93  \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_22  -93  \
"../../../ipstatic/hdl/cordic_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../SineCalculate.gen/sources_1/ip/cordic_sin_ip/sim/cordic_sin_ip.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

