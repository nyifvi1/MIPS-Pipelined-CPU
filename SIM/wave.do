onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_tb/rst_tb_i
add wave -noupdate /mips_tb/clk_tb_i
add wave -noupdate -radix decimal -childformat {{/mips_tb/mclk_cnt_tb_o(15) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(14) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(13) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(12) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(11) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(10) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(9) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(8) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(7) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(6) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(5) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(4) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(3) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(2) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(1) -radix hexadecimal} {/mips_tb/mclk_cnt_tb_o(0) -radix hexadecimal}} -subitemconfig {/mips_tb/mclk_cnt_tb_o(15) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(14) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(13) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(12) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(11) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(10) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(9) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(8) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(7) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(6) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(5) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(4) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(3) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(2) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(1) {-height 15 -radix hexadecimal} /mips_tb/mclk_cnt_tb_o(0) {-height 15 -radix hexadecimal}} /mips_tb/mclk_cnt_tb_o
add wave -noupdate -radix decimal -childformat {{/mips_tb/inst_cnt_tb_o(15) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(14) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(13) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(12) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(11) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(10) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(9) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(8) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(7) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(6) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(5) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(4) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(3) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(2) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(1) -radix hexadecimal} {/mips_tb/inst_cnt_tb_o(0) -radix hexadecimal}} -subitemconfig {/mips_tb/inst_cnt_tb_o(15) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(14) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(13) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(12) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(11) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(10) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(9) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(8) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(7) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(6) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(5) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(4) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(3) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(2) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(1) {-height 15 -radix hexadecimal} /mips_tb/inst_cnt_tb_o(0) {-height 15 -radix hexadecimal}} /mips_tb/inst_cnt_tb_o
add wave -noupdate -group tb -radix hexadecimal /mips_tb/alu_result_tb_o
add wave -noupdate -group tb /mips_tb/Branch_ctrl_tb_o
add wave -noupdate -group tb -radix hexadecimal -childformat {{/mips_tb/instruction_top_tb_o(31) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(30) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(29) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(28) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(27) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(26) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(25) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(24) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(23) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(22) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(21) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(20) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(19) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(18) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(17) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(16) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(15) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(14) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(13) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(12) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(11) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(10) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(9) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(8) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(7) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(6) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(5) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(4) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(3) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(2) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(1) -radix hexadecimal} {/mips_tb/instruction_top_tb_o(0) -radix hexadecimal}} -subitemconfig {/mips_tb/instruction_top_tb_o(31) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(30) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(29) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(28) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(27) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(26) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(25) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(24) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(23) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(22) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(21) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(20) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(19) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(18) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(17) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(16) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(15) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(14) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(13) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(12) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(11) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(10) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(9) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(8) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(7) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(6) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(5) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(4) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(3) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(2) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(1) {-height 15 -radix hexadecimal} /mips_tb/instruction_top_tb_o(0) {-height 15 -radix hexadecimal}} /mips_tb/instruction_top_tb_o
add wave -noupdate -group tb /mips_tb/MemWrite_ctrl_tb_o
add wave -noupdate -group tb -radix decimal /mips_tb/pc_tb_o
add wave -noupdate -group tb /mips_tb/RegWrite_ctrl_tb_o
add wave -noupdate -group tb /mips_tb/Zero_tb_o
add wave -noupdate -group tb -radix hexadecimal /mips_tb/read_data1_tb_o
add wave -noupdate -group tb -radix hexadecimal /mips_tb/read_data2_tb_o
add wave -noupdate -group tb -radix hexadecimal /mips_tb/write_data_tb_o
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/rst_i
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/clk_i
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/pc_o
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/alu_result_o
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/read_data1_o
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/read_data2_o
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/write_data_o
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/instruction_top_o
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/Branch_ctrl_o
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/Jump_ctrl_o
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/Zero_o
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/MemWrite_ctrl_o
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/RegWrite_ctrl_o
add wave -noupdate -expand -group {MIPS CORE} -radix decimal /mips_tb/CORE/mclk_cnt_o
add wave -noupdate -expand -group {MIPS CORE} -radix decimal /mips_tb/CORE/inst_cnt_o
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/pc_plus4_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/pc_plus4_w2
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/read_data1_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/read_data1_w2
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/read_data2_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/read_data2_w2
add wave -noupdate -expand -group {MIPS CORE} -radix decimal /mips_tb/CORE/MEM_read_data2
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/sign_extend_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/sign_extend_w2
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/addr_res_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/alu_result_w
add wave -noupdate -expand -group {MIPS CORE} -radix decimal /mips_tb/CORE/MEM_alu_result
add wave -noupdate -expand -group {MIPS CORE} -radix decimal /mips_tb/CORE/WB_alu_result
add wave -noupdate -expand -group {MIPS CORE} -radix decimal /mips_tb/CORE/dtcm_data_rd_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/WB_dtcm_data_rd
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/alu_src_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/alu_src_ID
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/alu_src_EX
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/branch_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/bne_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/jump_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_dst_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_dst_ID
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_dst_EX
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_dst_MEM
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_dst_WB
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_write_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_write_ID
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_write_EX
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_write_MEM
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/reg_write_WB
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/zero_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/mem_write_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/mem_write_ID
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/mem_write_EX
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/mem_write_MEM
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/MemtoReg_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/MemtoReg_ID
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/MemtoReg_EX
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/MemtoReg_MEM
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/MemtoReg_WB
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/mem_read_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/mem_read_ID
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/mem_read_EX
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/mem_read_MEM
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/alu_op_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/alu_op_ID
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/alu_op_EX
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/instruction_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/instruction_w2
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/MCLK_w
add wave -noupdate -expand -group {MIPS CORE} -radix decimal /mips_tb/CORE/mclk_cnt_q
add wave -noupdate -expand -group {MIPS CORE} -radix decimal /mips_tb/CORE/inst_cnt_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/jr_flag
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/RsRt_Comp_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/PCWrite_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/IF_ID_Flush_rst
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/IF_ID_Enable
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/write_reg_data_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/ID_EX_RegRd
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/ID_EX_RegRt
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/ID_EX_RegRs
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/HazDet_Mux_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/func_EX
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/ForwardA_w
add wave -noupdate -expand -group {MIPS CORE} /mips_tb/CORE/ForwardB_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/EX_write_reg_addr_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/MEM_write_reg_addr_w
add wave -noupdate -expand -group {MIPS CORE} -radix hexadecimal /mips_tb/CORE/WB_write_reg_addr_w
add wave -noupdate -expand -group IFETCH /mips_tb/CORE/IFE/clk_i
add wave -noupdate -expand -group IFETCH /mips_tb/CORE/IFE/rst_i
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/add_result_i
add wave -noupdate -expand -group IFETCH /mips_tb/CORE/IFE/Branch_ctrl_i
add wave -noupdate -expand -group IFETCH -color Magenta /mips_tb/CORE/IFE/BNE_ctrl_i
add wave -noupdate -expand -group IFETCH /mips_tb/CORE/IFE/Jump_ctrl_i
add wave -noupdate -expand -group IFETCH -color Magenta /mips_tb/CORE/IFE/RsRt_Comp_i
add wave -noupdate -expand -group IFETCH /mips_tb/CORE/IFE/jr_flag_i
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/rs_data_i
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/pc_o
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/pc_plus4_o
add wave -noupdate -expand -group IFETCH -color Magenta -radix hexadecimal -childformat {{/mips_tb/CORE/IFE/instruction_o(31) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(30) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(29) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(28) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(27) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(26) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(25) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(24) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(23) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(22) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(21) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(20) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(19) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(18) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(17) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(16) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(15) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(14) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(13) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(12) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(11) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(10) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(9) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(8) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(7) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(6) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(5) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(4) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(3) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(2) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(1) -radix hexadecimal} {/mips_tb/CORE/IFE/instruction_o(0) -radix hexadecimal}} -subitemconfig {/mips_tb/CORE/IFE/instruction_o(31) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(30) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(29) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(28) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(27) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(26) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(25) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(24) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(23) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(22) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(21) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(20) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(19) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(18) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(17) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(16) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(15) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(14) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(13) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(12) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(11) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(10) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(9) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(8) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(7) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(6) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(5) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(4) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(3) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(2) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(1) {-color Magenta -height 15 -radix hexadecimal} /mips_tb/CORE/IFE/instruction_o(0) {-color Magenta -height 15 -radix hexadecimal}} /mips_tb/CORE/IFE/instruction_o
add wave -noupdate -expand -group IFETCH -radix decimal /mips_tb/CORE/IFE/inst_cnt_o
add wave -noupdate -expand -group IFETCH /mips_tb/CORE/IFE/IF_Flush_o
add wave -noupdate -expand -group IFETCH /mips_tb/CORE/IFE/PCWrite_i
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/pc_q
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/pc_plus4_r
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/itcm_addr_w
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/next_pc_w
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/next_pc0_w
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/next_pc_final_w
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/instruction_j_aux
add wave -noupdate -expand -group IFETCH /mips_tb/CORE/IFE/rst_flag_q
add wave -noupdate -expand -group IFETCH -radix decimal /mips_tb/CORE/IFE/inst_cnt_q
add wave -noupdate -expand -group IFETCH -radix hexadecimal /mips_tb/CORE/IFE/pc_prev_q
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/wren_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/wren_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/rden_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/rden_b
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/data_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/data_b
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/address_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/address_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/clock0
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/clock1
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/clocken0
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/clocken1
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/clocken2
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/clocken3
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/aclr0
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/aclr1
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/addressstall_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/addressstall_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/byteena_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/byteena_b
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/q_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/q_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/eccstatus
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_data_reg_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_data_reg_b
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_q_reg_a
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_q_tmp_a
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_q_tmp2_a
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_q_tmp_wren_a
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_q_tmp2_wren_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_q_tmp_wren_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_q_reg_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_q_tmp_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_q_tmp2_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_q_output_latch
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_q_ecc_reg_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_q_ecc_tmp_b
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_current_written_data_a
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_original_data_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_original_data_b
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_byteena_mask_reg_a_x
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_byteena_mask_reg_b_x
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_byteena_mask_reg_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_byteena_mask_reg_b
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_byteena_mask_reg_a_out
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_byteena_mask_reg_b_out
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_address_reg_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_address_reg_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_wren_reg_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_wren_reg_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_rden_reg_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_rden_reg_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_read_flag_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_read_flag_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_reread_flag_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_reread_flag_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_reread_flag2_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_reread_flag2_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_write_flag_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_write_flag_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_nmram_write_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_nmram_write_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_indata_aclr_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_address_aclr_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_wrcontrol_aclr_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_indata_aclr_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_address_aclr_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_wrcontrol_aclr_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_outdata_aclr_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_outdata_aclr_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_rdcontrol_aclr_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_byteena_aclr_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_byteena_aclr_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/good_to_go_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/good_to_go_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_core_clocken_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_core_clocken_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_core_clocken_b0
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_core_clocken_b1
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_inclocken0
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_input_clocken_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_outdata_clken_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_outdata_clken_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_outlatch_clken_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_outlatch_clken_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_core_clocken_a_reg
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_core_clocken_b_reg
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/default_val
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_data_zero_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_data_zero_b
add wave -noupdate -expand -group IFETCH -group Wires -radix hexadecimal /mips_tb/CORE/IFE/inst_memory/i_data_ones_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_data_ones_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/same_clock_pulse0
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/same_clock_pulse1
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_force_reread_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_force_reread_a1
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_force_reread_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_force_reread_b1
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_force_reread_signal_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_force_reread_signal_b
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_good_to_write_a
add wave -noupdate -expand -group IFETCH -group Wires /mips_tb/CORE/IFE/inst_memory/i_good_to_write_b
add wave -noupdate -group IDECODE /mips_tb/CORE/ID/clk_i
add wave -noupdate -group IDECODE /mips_tb/CORE/ID/rst_i
add wave -noupdate -group IDECODE -radix hexadecimal -childformat {{/mips_tb/CORE/ID/instruction_i(31) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(30) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(29) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(28) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(27) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(26) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(25) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(24) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(23) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(22) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(21) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(20) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(19) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(18) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(17) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(16) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(15) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(14) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(13) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(12) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(11) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(10) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(9) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(8) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(7) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(6) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(5) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(4) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(3) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(2) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(1) -radix hexadecimal} {/mips_tb/CORE/ID/instruction_i(0) -radix hexadecimal}} -subitemconfig {/mips_tb/CORE/ID/instruction_i(31) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(30) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(29) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(28) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(27) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(26) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(25) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(24) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(23) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(22) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(21) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(20) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(19) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(18) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(17) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(16) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(15) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(14) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(13) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(12) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(11) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(10) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(9) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(8) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(7) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(6) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(5) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(4) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(3) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(2) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(1) {-height 15 -radix hexadecimal} /mips_tb/CORE/ID/instruction_i(0) {-height 15 -radix hexadecimal}} /mips_tb/CORE/ID/instruction_i
add wave -noupdate -group IDECODE -radix decimal /mips_tb/CORE/ID/dtcm_data_rd_i
add wave -noupdate -group IDECODE -radix decimal /mips_tb/CORE/ID/alu_result_i
add wave -noupdate -group IDECODE /mips_tb/CORE/ID/RegWrite_ctrl_i
add wave -noupdate -group IDECODE /mips_tb/CORE/ID/MemtoReg_ctrl_i
add wave -noupdate -group IDECODE /mips_tb/CORE/ID/RegDst_ctrl_i
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/pc_plus4_r
add wave -noupdate -group IDECODE -radix decimal /mips_tb/CORE/ID/read_data1_o
add wave -noupdate -group IDECODE -radix decimal /mips_tb/CORE/ID/read_data2_o
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/sign_extend_o
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/write_reg_data_o
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/write_reg_addr_i
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/addr_res_o
add wave -noupdate -group IDECODE /mips_tb/CORE/ID/RsRt_Comp_o
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/RF_q
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/write_reg_addr_w
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/write_reg_data_w
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/rs_register_w
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/rt_register_w
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/rd_register_w
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/imm_value_w
add wave -noupdate -group IDECODE -radix hexadecimal /mips_tb/CORE/ID/branch_addr_r
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/opcode_i
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/funct_i
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/RegDst_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/ALUSrc_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/MemtoReg_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/RegWrite_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/MemRead_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/MemWrite_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/Branch_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/BNE_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/Jump_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/ALUOp_ctrl_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/jr_flag_o
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/rtype_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/lw_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/sw_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/beq_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/itype_imm_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/jump_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/jal_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/bne_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/lui_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/mul_w
add wave -noupdate -group CONTROL /mips_tb/CORE/CTL/jr_w
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/read_data1_i
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/read_data2_i
add wave -noupdate -expand -group EXECUTE -radix hexadecimal /mips_tb/CORE/EXE/sign_extend_i
add wave -noupdate -expand -group EXECUTE -radix hexadecimal /mips_tb/CORE/EXE/funct_i
add wave -noupdate -expand -group EXECUTE -radix hexadecimal /mips_tb/CORE/EXE/ALUOp_ctrl_i
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/ALUSrc_ctrl_i
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/zero_o
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/alu_res_o
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/ForwardA_i
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/ForwardB_i
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/prev_alu_result_i
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/write_reg_data_i
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/ID_EX_RegRt_i
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/ID_EX_RegRd_i
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/RegDst_ctrl_i
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/ID_EX_write_reg_addr_o
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/a_input_w
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/b_input_w
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/alu_out_mux_w
add wave -noupdate -expand -group EXECUTE /mips_tb/CORE/EXE/alu_ctl_w
add wave -noupdate -expand -group EXECUTE -radix decimal /mips_tb/CORE/EXE/b_input_aux
add wave -noupdate -expand -group DMEMORY /mips_tb/CORE/G1/MEM/clk_i
add wave -noupdate -expand -group DMEMORY /mips_tb/CORE/G1/MEM/rst_i
add wave -noupdate -expand -group DMEMORY -radix decimal /mips_tb/CORE/G1/MEM/dtcm_addr_i
add wave -noupdate -expand -group DMEMORY -radix decimal /mips_tb/CORE/G1/MEM/dtcm_data_wr_i
add wave -noupdate -expand -group DMEMORY /mips_tb/CORE/G1/MEM/MemRead_ctrl_i
add wave -noupdate -expand -group DMEMORY /mips_tb/CORE/G1/MEM/MemWrite_ctrl_i
add wave -noupdate -expand -group DMEMORY -radix decimal /mips_tb/CORE/G1/MEM/dtcm_data_rd_o
add wave -noupdate -expand -group DMEMORY /mips_tb/CORE/G1/MEM/wrclk_w
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/wren_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/wren_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/rden_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/rden_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/data_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/data_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/address_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/address_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/clock0
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/clock1
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/clocken0
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/clocken1
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/clocken2
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/clocken3
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/aclr0
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/aclr1
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/addressstall_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/addressstall_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/byteena_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/byteena_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/q_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/q_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/eccstatus
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_data_reg_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_data_reg_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_reg_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_tmp_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_tmp2_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_tmp_wren_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_tmp2_wren_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_tmp_wren_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_reg_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_tmp_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_tmp2_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_output_latch
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_ecc_reg_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_q_ecc_tmp_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_current_written_data_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_original_data_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_original_data_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_mask_reg_a_x
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_mask_reg_b_x
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_mask_reg_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_mask_reg_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_mask_reg_a_out
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_mask_reg_b_out
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_address_reg_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_address_reg_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_wren_reg_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_wren_reg_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_rden_reg_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_rden_reg_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_read_flag_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_read_flag_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_reread_flag_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_reread_flag_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_reread_flag2_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_reread_flag2_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_write_flag_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_write_flag_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_nmram_write_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_nmram_write_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_indata_aclr_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_address_aclr_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_wrcontrol_aclr_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_indata_aclr_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_address_aclr_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_wrcontrol_aclr_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_outdata_aclr_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_outdata_aclr_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_rdcontrol_aclr_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_aclr_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_byteena_aclr_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/good_to_go_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/good_to_go_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_core_clocken_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_core_clocken_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_core_clocken_b0
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_core_clocken_b1
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_inclocken0
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_input_clocken_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_outdata_clken_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_outdata_clken_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_outlatch_clken_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_outlatch_clken_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_core_clocken_a_reg
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_core_clocken_b_reg
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/default_val
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_data_zero_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_data_zero_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_data_ones_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_data_ones_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/same_clock_pulse0
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/same_clock_pulse1
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_force_reread_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_force_reread_a1
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_force_reread_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_force_reread_b1
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_force_reread_signal_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_force_reread_signal_b
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_good_to_write_a
add wave -noupdate -expand -group DMEMORY -group Wires /mips_tb/CORE/G1/MEM/data_memory/i_good_to_write_b
add wave -noupdate -group {HAZARD UNIT} /mips_tb/CORE/HazUn/ID_EX_MemRead
add wave -noupdate -group {HAZARD UNIT} /mips_tb/CORE/HazUn/ID_EX_RegRt
add wave -noupdate -group {HAZARD UNIT} /mips_tb/CORE/HazUn/IF_ID_RegRs
add wave -noupdate -group {HAZARD UNIT} /mips_tb/CORE/HazUn/IF_ID_RegRt
add wave -noupdate -group {HAZARD UNIT} /mips_tb/CORE/HazUn/IF_ID_Write
add wave -noupdate -group {HAZARD UNIT} /mips_tb/CORE/HazUn/PC_Write
add wave -noupdate -group {HAZARD UNIT} /mips_tb/CORE/HazUn/HazDet_Mux
add wave -noupdate -group {FORWARDING UNIT} /mips_tb/CORE/ForUn/ID_EX_RegRs_i
add wave -noupdate -group {FORWARDING UNIT} /mips_tb/CORE/ForUn/ID_EX_RegRt_i
add wave -noupdate -group {FORWARDING UNIT} /mips_tb/CORE/ForUn/EX_MEM_RegRd_i
add wave -noupdate -group {FORWARDING UNIT} /mips_tb/CORE/ForUn/MEM_WB_RegRd_i
add wave -noupdate -group {FORWARDING UNIT} /mips_tb/CORE/ForUn/EX_MEM_RegWrite_i
add wave -noupdate -group {FORWARDING UNIT} /mips_tb/CORE/ForUn/MEM_WB_RegWrite_i
add wave -noupdate -group {FORWARDING UNIT} /mips_tb/CORE/ForUn/ForwardA
add wave -noupdate -group {FORWARDING UNIT} /mips_tb/CORE/ForUn/ForwardB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1751902 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 286
configure wave -valuecolwidth 151
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1167860 ps} {2097903 ps}
