---------------------------------------------------------------------------------------------
-- Copyright 2025 Hananya Ribo 
-- Advanced CPU architecture and Hardware Accelerators Lab 361-1-4693 BGU
---------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
USE work.cond_comilation_package.all;


package aux_package is

	component MIPS is
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
		PORT(	
			rst_i		 		:IN	STD_LOGIC;   						    --KEY0
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
	end component;
---------------------------------------------------------  
	component control is
		PORT( 	
		opcode_i 			: IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		funct_i             : IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		RegDst_ctrl_o 		: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUSrc_ctrl_o 		: OUT 	STD_LOGIC;
		MemtoReg_ctrl_o 	: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		RegWrite_ctrl_o 	: OUT 	STD_LOGIC;
		MemRead_ctrl_o 		: OUT 	STD_LOGIC;
		MemWrite_ctrl_o	 	: OUT 	STD_LOGIC;
		Branch_ctrl_o 		: OUT 	STD_LOGIC;
		BNE_ctrl_o          : OUT 	STD_LOGIC; 
		Jump_ctrl_o         : OUT 	STD_LOGIC;
		ALUOp_ctrl_o	 	: OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0);
		jr_flag_o	     	: OUT 	STD_LOGIC
	);
	end component;
---------------------------------------------------------	
	component dmemory is
		generic(
		DATA_BUS_WIDTH : integer := 32;
		DTCM_ADDR_WIDTH : integer := 8;
		WORDS_NUM : integer := 256
	);
	PORT(	clk_i,rst_i			: IN 	STD_LOGIC;
			dtcm_addr_i 		: IN 	STD_LOGIC_VECTOR(DTCM_ADDR_WIDTH-1 DOWNTO 0);
			dtcm_data_wr_i 		: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			MemRead_ctrl_i  	: IN 	STD_LOGIC;
			MemWrite_ctrl_i 	: IN 	STD_LOGIC;
			dtcm_data_rd_o 		: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0)
	);
	end component;
---------------------------------------------------------		
	component Execute is
		generic(
			DATA_BUS_WIDTH : integer := 32;
			FUNCT_WIDTH : integer := 6;
			PC_WIDTH : integer := 10
		);
		PORT(	
			read_data1_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			read_data2_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			sign_extend_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			funct_i 		: IN 	STD_LOGIC_VECTOR(FUNCT_WIDTH-1 DOWNTO 0);
			ALUOp_ctrl_i 	: IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
			ALUSrc_ctrl_i 	: IN 	STD_LOGIC;
			zero_o 			: OUT	STD_LOGIC;
			alu_res_o 		: OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			ForwardA_i 		: IN    STD_LOGIC_VECTOR(1 DOWNTO 0 );
			ForwardB_i 		: IN    STD_LOGIC_VECTOR(1 DOWNTO 0 );
			prev_alu_result_i :  IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			write_reg_data_i :  IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			ID_EX_RegRt_i,ID_EX_RegRd_i   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
			RegDst_ctrl_i 	: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			ID_EX_write_reg_addr_o     : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			ForwardB_mux_outputs_o 		: OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0)
		);
	end component;
---------------------------------------------------------		
	component Idecode is
		generic(
			DATA_BUS_WIDTH : integer := 32;
			PC_WIDTH : integer 			:= 10
		);
		PORT(	
			clk_i,rst_i		: IN 	STD_LOGIC;
			instruction_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			dtcm_data_rd_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			alu_result_i	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			RegWrite_ctrl_i : IN 	STD_LOGIC;
			MemtoReg_ctrl_i : IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			RegDst_ctrl_i 	: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			pc_plus4_r      : IN    STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			read_data1_o	: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			read_data2_o	: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			sign_extend_o 	: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			write_reg_data_o: OUT   STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			write_reg_addr_i: IN 	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			addr_res_o 		: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			RsRt_Comp_o     : OUT 	STD_LOGIC;
		    pc_plus4_WB     : IN    STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0)	
		);
	end component;
---------------------------------------------------------		
	component Ifetch is
		generic(
			WORD_GRANULARITY : boolean 	:= False;
			DATA_BUS_WIDTH : integer 	:= 32;
			PC_WIDTH : integer 			:= 10;
			NEXT_PC_WIDTH : integer 	:= 8; -- NEXT_PC_WIDTH = PC_WIDTH-2
			ITCM_ADDR_WIDTH : integer 	:= 8;
			WORDS_NUM : integer 		:= 256;
			INST_CNT_WIDTH : integer 	:= 16
		);
		PORT(	
			clk_i, rst_i 	: IN 	STD_LOGIC;
			add_result_i 	: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
        	Branch_ctrl_i 	: IN 	STD_LOGIC;
			BNE_ctrl_i      : IN 	STD_LOGIC;
			Jump_ctrl_i     : IN 	STD_LOGIC;
        	RsRt_Comp_i 	: IN 	STD_LOGIC;	
			jr_flag_i       : IN 	STD_LOGIC;
		    rs_data_i		: IN	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			pc_o 			: OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			pc_plus4_o 		: OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			instruction_o 	: OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			inst_cnt_o 		: OUT	STD_LOGIC_VECTOR(INST_CNT_WIDTH-1 DOWNTO 0);
			IF_Flush_o      : OUT 	STD_LOGIC;
			PCWrite_i       : IN    STD_LOGIC;
			Stall_flag_i   	: IN STD_LOGIC;
			instruction_ID_i: IN STD_LOGIC_VECTOR(NEXT_PC_WIDTH-1 downto 0)			
		);
	end component;
---------------------------------------------------------
	COMPONENT PLL port(
	    areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0     		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC );
    END COMPONENT;
---------------------------------------------------------	
	COMPONENT HazardUnit IS
		PORT( 				   
			ID_EX_MemRead 				: IN  STD_LOGIC;
			ID_EX_RegRt					: IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
			IF_ID_RegRs,IF_ID_RegRt 	: IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
			IF_ID_Write 				: OUT STD_LOGIC;
			PC_Write 					: OUT STD_LOGIC;
			HazDet_Mux 					: OUT STD_LOGIC;
			Branch_ctrl_i          		: IN  STD_LOGIC;
			BNE_ctrl_i          		: IN  STD_LOGIC;
			reg_write_EX_i          	: IN  STD_LOGIC;
			EX_write_reg_addr_i         : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
			reg_write_MEM_i          	: IN  STD_LOGIC;
			MEM_write_reg_addr_i 		: IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
			Stall_flag_o        		: OUT STD_LOGIC;
			jr_flag_i                   : IN STD_LOGIC			
			);
	END 	COMPONENT;
	
	COMPONENT ForwardingUnit IS
	PORT( 		
		ID_EX_RegRs_i,ID_EX_RegRt_i		: IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		EX_MEM_RegRd_i,MEM_WB_RegRd_i   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		EX_MEM_RegWrite_i 				: IN  STD_LOGIC;
		MEM_WB_RegWrite_i 				: IN  STD_LOGIC;
		ForwardA, ForwardB				: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		);
	END 	COMPONENT;
---------------------------------------------------------	
	COMPONENT Shifter IS
		GENERIC (n : INTEGER :=32;
				 k : INTEGER :=5); --k=log2(n)
		PORT(x,y : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			 dir : IN STD_LOGIC;
			 cout : OUT STD_LOGIC;
			 res : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
	END COMPONENT;


end aux_package;

