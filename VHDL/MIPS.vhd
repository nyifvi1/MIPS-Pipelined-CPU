---------------------------------------------------------------------------------------------
-- Copyright 2025 Hananya Ribo 
-- Advanced CPU architecture and Hardware Accelerators Lab 361-1-4693 BGU
---------------------------------------------------------------------------------------------
-- Top Level Structural Model for MIPS Processor Core
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
USE work.cond_comilation_package.all;
USE work.aux_package.all;


ENTITY MIPS IS
	generic( 
			WORD_GRANULARITY : boolean 	:= G_WORD_GRANULARITY;
	        MODELSIM : integer 			:= G_MODELSIM;
			DATA_BUS_WIDTH : integer 	:= 32;
			ITCM_ADDR_WIDTH : integer 	:= G_ADDRWIDTH;
			DTCM_ADDR_WIDTH : integer 	:= G_ADDRWIDTH;
			PC_WIDTH : integer 			:= 10;
			FUNCT_WIDTH : integer 		:= 6;
			DATA_WORDS_NUM : integer 	:= G_DATA_WORDS_NUM;
			CLK_CNT_WIDTH : integer 	:= 16;
			INST_CNT_WIDTH : integer 	:= 16
	);
	PORT(	rst_i		 		:IN	STD_LOGIC;   						    --KEY0
			clk_i				:IN	STD_LOGIC;	   							--CLK0
			BPADDR_i			:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);  			--SW[7]-SW[0]	
			BPADDR_EN_i         :IN STD_LOGIC;								--KEY1
			-- Output important signals to pins for easy display in SignalTap
			CLKCNT_o			:OUT	STD_LOGIC_VECTOR(CLK_CNT_WIDTH-1 DOWNTO 0);
			INSTCNT_o 			:OUT	STD_LOGIC_VECTOR(INST_CNT_WIDTH-1 DOWNTO 0);
			IFpc_o				:OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			IFinstruction_o     :OUT    STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			IDpc_o				:OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			IDinstruction_o     :OUT    STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			EXpc_o				:OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			EXinstruction_o     :OUT    STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			MEMpc_o				:OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			MEMinstruction_o     :OUT    STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			WBpc_o				:OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			WBinstruction_o     :OUT    STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			STRIGGER_o          :OUT    STD_LOGIC;
			FHCNT_o				:OUT 	STD_LOGIC_VECTOR(15 DOWNTO 0);
			STCNT_o				:OUT 	STD_LOGIC_VECTOR(15 DOWNTO 0)
	);		
END MIPS;
-------------------------------------------------------------------------------------
ARCHITECTURE structure OF MIPS IS
	-- declare signals used to connect VHDL components
	SIGNAL pc_plus4_w,pc_plus4_w2,pc_plus4_EX,pc_plus4_MEM,pc_plus4_WB 		: STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
	SIGNAL read_data1_w,read_data1_w2 	: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL read_data2_w,read_data2_w2,MEM_read_data2 	: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL sign_extend_w,sign_extend_w2 	: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL addr_res_w 		: STD_LOGIC_VECTOR(7 DOWNTO 0 );
	SIGNAL alu_result_w,MEM_alu_result,WB_alu_result 	: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL dtcm_data_rd_w,WB_dtcm_data_rd 	: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL alu_src_w,alu_src_ID,alu_src_EX 		: STD_LOGIC;
	SIGNAL branch_w 		: STD_LOGIC;
	SIGNAL bne_w            : STD_LOGIC;
	SIGNAL jump_w 		    : STD_LOGIC;
	SIGNAL reg_dst_w,reg_dst_ID,reg_dst_EX,reg_dst_MEM,reg_dst_WB 		: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL reg_write_w,reg_write_ID,reg_write_EX,reg_write_MEM,reg_write_WB 		: STD_LOGIC;
	SIGNAL zero_w 			: STD_LOGIC;
	SIGNAL mem_write_w,mem_write_ID,mem_write_EX,mem_write_MEM 		: STD_LOGIC;
	SIGNAL MemtoReg_w,MemtoReg_ID,MemtoReg_EX,MemtoReg_MEM,MemtoReg_WB 		: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL mem_read_w,mem_read_ID,mem_read_EX,mem_read_MEM 		: STD_LOGIC;
	SIGNAL alu_op_w,alu_op_ID,alu_op_EX 		: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL instruction_w,instruction_w2,EX_instruction_w,MEM_instruction_w,WB_instruction_w	: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL MCLK_w 			: STD_LOGIC;
	SIGNAL mclk_cnt_q		: STD_LOGIC_VECTOR(CLK_CNT_WIDTH-1 DOWNTO 0);
	SIGNAL inst_cnt_w		: STD_LOGIC_VECTOR(INST_CNT_WIDTH-1 DOWNTO 0);
	SIGNAL jr_flag          : STD_LOGIC;
	SIGNAL RsRt_Comp_w      : STD_LOGIC;
	SIGNAL PCWrite_w        : STD_LOGIC;
	SIGNAL IF_ID_Flush_rst,IF_ID_Enable : STD_LOGIC;
	SIGNAL write_reg_data_w : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL ID_EX_RegRd,ID_EX_RegRt,ID_EX_RegRs      : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL HazDet_Mux_w : STD_LOGIC;
	SIGNAL func_EX          : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL ForwardA_w,ForwardB_w       : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL EX_write_reg_addr_w,MEM_write_reg_addr_w,WB_write_reg_addr_w : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL ForwardB_mux_outputs_w :  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
	SIGNAL Stall_flag_w           : STD_LOGIC;
	SIGNAL IF_PC_w,ID_PC_w,EX_PC_w,MEM_PC_w,WB_PC_w 		: STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
	SIGNAL BPADDR_w			:	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);  	
	SIGNAL rst_w,BPADDR_EN_w : STD_LOGIC;
	SIGNAL FHCNT_w,STCNT_w    : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
--------------------------------------------------------------------------------------------
	G_RST:
	if MODELSIM = 1 generate
		rst_w <= rst_i;
		BPADDR_EN_w <= BPADDR_EN_i;
	end generate;

	G_RST_NOT:
	if MODELSIM = 0 generate
		rst_w <= not rst_i;
		BPADDR_EN_w <= not BPADDR_EN_i;
	end generate;
--------------------------------------------------------------------------------------------

					-- copy important signals to output pins for easy 
					-- display in Simulator
--------------------------------------------------------------------------------------------
	CLKCNT_o	<=	mclk_cnt_q;
	INSTCNT_o	<=	inst_cnt_w;
	
	IFpc_o      	<=	IF_PC_w;
	IFinstruction_o <=  instruction_w;
	
	IDpc_o      	<=	ID_PC_w;
	IDinstruction_o <=	instruction_w2;
	
	EXpc_o      	<=	EX_PC_w;
	EXinstruction_o <=  EX_instruction_w;
	
	MEMpc_o      	<=  MEM_PC_w;
	MEMinstruction_o <= MEM_instruction_w;
	
	WBpc_o      	<=  WB_PC_w;
	WBinstruction_o <=  WB_instruction_w;

	STRIGGER_o <=	'1' when IF_PC_w=BPADDR_w else '0';
	FHCNT_o    <=	FHCNT_w;
	STCNT_o    <=	STCNT_w;

	
	-- connect the PLL component
	G0:
	if (MODELSIM = 0) generate
	  MCLK: PLL
		PORT MAP (
			inclk0 	=> clk_i,
			c0 		=> MCLK_w
		);
	else generate
		MCLK_w <= clk_i;
	end generate;
	-- connect the 5 MIPS components   
	IFE : Ifetch
	generic map(
		WORD_GRANULARITY	=> 	WORD_GRANULARITY,
		DATA_BUS_WIDTH		=> 	DATA_BUS_WIDTH, 
		PC_WIDTH			=>	PC_WIDTH,
		ITCM_ADDR_WIDTH		=>	ITCM_ADDR_WIDTH,
		WORDS_NUM			=>	DATA_WORDS_NUM,
		INST_CNT_WIDTH		=>	INST_CNT_WIDTH
	)
	PORT MAP (	
		clk_i 			=> MCLK_w,  
		rst_i 			=> rst_w, 
		add_result_i 	=> addr_res_w,
		Branch_ctrl_i 	=> branch_w,
		BNE_ctrl_i      => bne_w,       
		Jump_ctrl_i     => jump_w,
		RsRt_Comp_i 	=> RsRt_Comp_w,
		jr_flag_i		=> jr_flag,
		rs_data_i       => read_data1_w,
		pc_o 			=> IF_PC_w,
		instruction_o 	=> instruction_w,
    	pc_plus4_o	 	=> pc_plus4_w,
		inst_cnt_o		=> inst_cnt_w,
		IF_Flush_o      => IF_ID_Flush_rst,
		PCWrite_i       => PCWrite_w,
		Stall_flag_i    => Stall_flag_w,
		instruction_ID_i => instruction_w2(7 downto 0)
	);
--------------------------IF_ID Register--------------------------
process(MCLK_w,IF_ID_Flush_rst)
begin
		if(rising_edge(MCLK_w)) then
			if(IF_ID_Flush_rst='1') then
				pc_plus4_w2		<=  (others => '0');
				instruction_w2	<=	(others => '0');
				ID_PC_w         <=  (others => '0');
			elsif(IF_ID_Enable='1') then
				pc_plus4_w2		<= pc_plus4_w;
				instruction_w2	<= instruction_w;
				ID_PC_w         <= IF_PC_w;
			end if;
		end if;
end process;
---------------------------------------------------------------------
	ID : Idecode
   	generic map(
		DATA_BUS_WIDTH		=>  DATA_BUS_WIDTH,
		PC_WIDTH			=>	PC_WIDTH
	)
	PORT MAP (	
			clk_i 				=> MCLK_w,  
			rst_i 				=> rst_w,
        	instruction_i 		=> instruction_w2,
        	dtcm_data_rd_i 		=> WB_dtcm_data_rd,
			alu_result_i 		=> WB_alu_result,
			RegWrite_ctrl_i 	=> reg_write_WB,
			MemtoReg_ctrl_i 	=> MemtoReg_WB,
			RegDst_ctrl_i 		=> reg_dst_WB,
			pc_plus4_r          => pc_plus4_w2,
			read_data1_o 		=> read_data1_w,
        	read_data2_o 		=> read_data2_w,
			sign_extend_o 		=> sign_extend_w,
			write_reg_data_o    => write_reg_data_w,
			write_reg_addr_i    => WB_write_reg_addr_w,
			addr_res_o 			=> addr_res_w,
			RsRt_Comp_o			=> RsRt_Comp_w,
			pc_plus4_WB         => pc_plus4_WB
		);
--------------------------ID_EX Register--------------------------
process(MCLK_w)
begin
		if(rising_edge(MCLK_w)) then
		EX_PC_w       	<= ID_PC_w;
		EX_instruction_w <=instruction_w2;
		
		read_data1_w2	<=	read_data1_w;
		read_data2_w2	<=	read_data2_w;
		sign_extend_w2	<=	sign_extend_w;
		ID_EX_RegRd	<=	instruction_w2(15 DOWNTO 11); --Rd
		ID_EX_RegRt	<=	instruction_w2(20 DOWNTO 16); --Rt
		ID_EX_RegRs	<=	instruction_w2(25 DOWNTO 21); --Rs
		func_EX <= instruction_w2(5 DOWNTO 0);
		pc_plus4_EX <= pc_plus4_w2;
		--Control bits
		reg_dst_EX  <=	reg_dst_ID;
		MemtoReg_EX	<=	MemtoReg_ID; 
		reg_write_EX<=	reg_write_ID; 
		mem_read_EX	<=	mem_read_ID;
		mem_write_EX<=	mem_write_ID;
		alu_op_EX	<=	alu_op_ID;
		alu_src_EX	<=	alu_src_ID;
		end if;
end process;
---------------------------------------------------------------------
	CTL:   control
	PORT MAP ( 	
			opcode_i 			=> instruction_w2(DATA_BUS_WIDTH-1 DOWNTO 26),
			funct_i             => instruction_w2(5 DOWNTO 0),
			RegDst_ctrl_o 		=> reg_dst_w,
			ALUSrc_ctrl_o 		=> alu_src_w,
			MemtoReg_ctrl_o 	=> MemtoReg_w,
			RegWrite_ctrl_o 	=> reg_write_w,
			MemRead_ctrl_o 		=> mem_read_w,
			MemWrite_ctrl_o 	=> mem_write_w,
			Branch_ctrl_o 		=> branch_w,
			BNE_ctrl_o          => bne_w,        
			Jump_ctrl_o         => jump_w,
			ALUOp_ctrl_o 		=> alu_op_w,
			jr_flag_o           => jr_flag
		);
------------------------Hazard Control Mux------------------------	
		reg_dst_ID   <=	reg_dst_w   when HazDet_Mux_w='1' else "00";   
		MemtoReg_ID  <=	MemtoReg_w 	when HazDet_Mux_w='1' else "00";  
		reg_write_ID <=	reg_write_w when HazDet_Mux_w='1' else '0';  
			
		mem_read_ID  <=	mem_read_w 	when HazDet_Mux_w='1' else '0';  
		mem_write_ID <=	mem_write_w when HazDet_Mux_w='1' else '0';  
			
		alu_op_ID   <=	alu_op_w 	when HazDet_Mux_w='1' else "1111";  --ALUop="1111" is default value (nop)
		alu_src_ID  <=	alu_src_w 	when HazDet_Mux_w='1' else '0';  
------------------------------------------------------------------							
	EXE:  Execute
   	generic map(
		DATA_BUS_WIDTH 		=> 	DATA_BUS_WIDTH,
		FUNCT_WIDTH 		=>	FUNCT_WIDTH,
		PC_WIDTH 			=>	PC_WIDTH
	)
	PORT MAP (	
		read_data1_i 	=> read_data1_w2,
        read_data2_i 	=> read_data2_w2,
		sign_extend_i 	=> sign_extend_w2,
        funct_i			=> func_EX,
		ALUOp_ctrl_i 	=> alu_op_EX,
		ALUSrc_ctrl_i 	=> alu_src_EX,
		zero_o 			=> zero_w,
        alu_res_o		=> alu_result_w,
		ForwardA_i 		=> ForwardA_w,
		ForwardB_i      => ForwardB_w,
		prev_alu_result_i=>MEM_alu_result,
		write_reg_data_i=>write_reg_data_w,
		ID_EX_RegRt_i	=> ID_EX_RegRt,	
		ID_EX_RegRd_i	=> ID_EX_RegRd,
		RegDst_ctrl_i	=> reg_dst_EX,
		ID_EX_write_reg_addr_o => EX_write_reg_addr_w,
		ForwardB_mux_outputs_o => ForwardB_mux_outputs_w
	);
--------------------------EX_MEM Register--------------------------
process(MCLK_w)
begin
		if(rising_edge(MCLK_w)) then
		MEM_PC_w       	<= EX_PC_w;
		MEM_instruction_w <=EX_instruction_w;
		
		MEM_alu_result			  <=	alu_result_w;
		MEM_read_data2			  <=	ForwardB_mux_outputs_w;
		MEM_write_reg_addr_w	  <=    EX_write_reg_addr_w;
		pc_plus4_MEM <= pc_plus4_EX;
		--Control bits
		reg_dst_MEM   <=	reg_dst_EX;
		MemtoReg_MEM  <=	MemtoReg_EX; 
		reg_write_MEM <=	reg_write_EX; 
		mem_read_MEM  <=	mem_read_EX;
		mem_write_MEM <=	mem_write_EX;
		end if;
end process;
---------------------------------------------------------------------
	G1: 
	if (WORD_GRANULARITY = True) generate -- i.e. each WORD has a unike address
		MEM:  dmemory
			generic map(
				DATA_BUS_WIDTH		=> 	DATA_BUS_WIDTH, 
				DTCM_ADDR_WIDTH		=> 	DTCM_ADDR_WIDTH,
				WORDS_NUM			=>	DATA_WORDS_NUM
			)
			PORT MAP (	
				clk_i 				=> MCLK_w,  
				rst_i 				=> rst_w,
				dtcm_addr_i 		=> MEM_alu_result((DTCM_ADDR_WIDTH+2)-1 DOWNTO 2), -- increment memory address by 4
				dtcm_data_wr_i 		=> MEM_read_data2,
				MemRead_ctrl_i 		=> mem_read_MEM, 
				MemWrite_ctrl_i 	=> mem_write_MEM,
				dtcm_data_rd_o 		=> dtcm_data_rd_w 
			);	
	elsif (WORD_GRANULARITY = False) generate -- i.e. each BYTE has a unike address	
		MEM:  dmemory
			generic map(
				DATA_BUS_WIDTH		=> 	DATA_BUS_WIDTH, 
				DTCM_ADDR_WIDTH		=> 	DTCM_ADDR_WIDTH,
				WORDS_NUM			=>	DATA_WORDS_NUM
			)
			PORT MAP (	
				clk_i 				=> MCLK_w,  
				rst_i 				=> rst_w,
				dtcm_addr_i 		=> MEM_alu_result(DTCM_ADDR_WIDTH-1 DOWNTO 2)&"00",
				dtcm_data_wr_i 		=> MEM_read_data2,
				MemRead_ctrl_i 		=> mem_read_MEM, 
				MemWrite_ctrl_i 	=> mem_write_MEM,
				dtcm_data_rd_o 		=> dtcm_data_rd_w
			);
	end generate;
--------------------------MEM_WB Register--------------------------
process(MCLK_w)
begin
		if(rising_edge(MCLK_w)) then
		WB_PC_w       	<= MEM_PC_w;
		WB_instruction_w <=MEM_instruction_w;
		
		WB_dtcm_data_rd <=	dtcm_data_rd_w;
		WB_alu_result   <=	MEM_alu_result;
		WB_write_reg_addr_w	<= MEM_write_reg_addr_w;
		pc_plus4_WB <= pc_plus4_MEM;
		--Control bits
		reg_dst_WB   <=	reg_dst_MEM;
		MemtoReg_WB  <=	MemtoReg_MEM; 
		reg_write_WB <=	reg_write_MEM; 
		end if;
end process;
---------------------------------------------------------------------	
	HazUn : HazardUnit	
	PORT MAP ( 	
			ID_EX_MemRead => mem_read_EX,
			ID_EX_RegRt => ID_EX_RegRt,
			IF_ID_RegRs =>instruction_w2(25 DOWNTO 21), --Rs
			IF_ID_RegRt =>instruction_w2(20 DOWNTO 16), --Rt
			IF_ID_Write =>IF_ID_Enable,
			PC_Write =>PCWrite_w,
			HazDet_Mux => HazDet_Mux_w,
			Branch_ctrl_i => branch_w,
			BNE_ctrl_i => bne_w,
			reg_write_EX_i => reg_write_EX,
			EX_write_reg_addr_i => EX_write_reg_addr_w,
			reg_write_MEM_i => reg_write_MEM,
			MEM_write_reg_addr_i => MEM_write_reg_addr_w,
			Stall_flag_o  => Stall_flag_w,
			jr_flag_i => jr_flag
		);

	ForUn : ForwardingUnit
		PORT MAP ( 	
			ID_EX_RegRs_i => ID_EX_RegRs,
			ID_EX_RegRt_i => ID_EX_RegRt,
			EX_MEM_RegRd_i =>MEM_write_reg_addr_w,
			MEM_WB_RegRd_i => WB_write_reg_addr_w,	
			EX_MEM_RegWrite_i => reg_write_MEM,
			MEM_WB_RegWrite_i => reg_write_WB,
			ForwardA => ForwardA_w,
			ForwardB => ForwardB_w
		);			
---------------------------------------------------------------------------------------
--									IPC - MCLK counter register
---------------------------------------------------------------------------------------
process (MCLK_w , rst_w)
begin
	if rst_w = '1' then
		mclk_cnt_q	<=	(others	=> '0');
	elsif rising_edge(MCLK_w) then
		mclk_cnt_q	<=	mclk_cnt_q + '1';
	end if;
end process;
---------------------------------------------------------------------------------------
--									BPADDR register
---------------------------------------------------------------------------------------
process (MCLK_w , rst_w)
begin
	if rising_edge(MCLK_w) then
		if BPADDR_EN_w='1' then
			BPADDR_w	<=	BPADDR_i&"00";
		end if;
	end if;
end process;
---------------------------------------------------------------------------------------
--									FHCNT register
---------------------------------------------------------------------------------------
process (MCLK_w , rst_w)
begin
	if rst_w = '1' then
		FHCNT_w	<=	(others	=> '0');
	elsif rising_edge(MCLK_w) then
		if IF_ID_Flush_rst='1' then
			FHCNT_w	<=	FHCNT_w+1;
		end if;
	end if;
end process;
---------------------------------------------------------------------------------------
--									STCNT register
---------------------------------------------------------------------------------------
process (MCLK_w , rst_w)
begin
	if rst_w = '1' then
		STCNT_w	<=	(others	=> '0');
	elsif rising_edge(MCLK_w) then
		if IF_ID_Enable='0' then
			STCNT_w	<=	STCNT_w+1;
		end if;
	end if;
end process;
END structure;

