---------------------------------------------------------------------------------------------
-- Copyright 2025 Hananya Ribo 
-- Advanced CPU architecture and Hardware Accelerators Lab 361-1-4693 BGU
---------------------------------------------------------------------------------------------
--  Execute module (implements the data ALU and Branch Address Adder  
--  for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE work.aux_package.ALL;

ENTITY  Execute IS
	generic(
		DATA_BUS_WIDTH : integer := 32;
		FUNCT_WIDTH : integer := 6;
		PC_WIDTH : integer := 10
	);
	PORT(	read_data1_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
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
END Execute;


ARCHITECTURE behavior OF Execute IS
SIGNAL a_input_w, b_input_w 	: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
SIGNAL alu_out_mux_w			: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
SIGNAL alu_ctl_w				: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL b_input_aux 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
SIGNAL shifter_dir,shifter_cout : STD_LOGIC;
SIGNAL shifter_out 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
BEGIN						
-----------------------Forwarding Unit Mux-----------------------------------------------------------------------
	b_input_aux <= 	read_data2_i	 	when ForwardB_i="00" ELSE
					write_reg_data_i 	when ForwardB_i="01" ELSE	
					prev_alu_result_i 	when ForwardB_i="10" ELSE
					read_data2_i;	
					
	ForwardB_mux_outputs_o <= b_input_aux;
	
	a_input_w <= 	read_data1_i	 	when ForwardA_i="00" ELSE
					write_reg_data_i 	when ForwardA_i="01" ELSE	
					prev_alu_result_i 	when ForwardA_i="10" ELSE
					read_data1_i;
-- ALU input mux	
	b_input_w <= 	b_input_aux WHEN (ALUSrc_ctrl_i = '0') ELSE
					sign_extend_i(DATA_BUS_WIDTH-1 DOWNTO 0);					
----------------------------------------------------------------------------------------------
	-- Mux for Register Write Address
	ID_EX_write_reg_addr_o <= ID_EX_RegRd_i WHEN RegDst_ctrl_i = "01" ELSE 
							ID_EX_RegRt_i when RegDst_ctrl_i = "00" ELSE
							"11111";   --$ra=R31						
--------------------------------------------------------------------------------------------------------
--  Generate ALU control bits
--------------------------------------------------------------------------------------------------------

	alu_ctl_w <= "000" when (funct_i="100100" and ALUOp_ctrl_i="0000") or (ALUOp_ctrl_i="0011") else   				    --AND _and,andi
				 "001" when (funct_i="100101" and ALUOp_ctrl_i="0000") or (ALUOp_ctrl_i="0010") else   					--OR _or,ori			
				 "010" when ((funct_i="100000" or funct_i="100001") and ALUOp_ctrl_i="0000") or (ALUOp_ctrl_i="0001")  else			 --ADD(+) _add,addi,lw,sw,addiu,addu
				 "011" when (funct_i="100110" and ALUOp_ctrl_i="0000") or (ALUOp_ctrl_i="0110") else   --XOR _xor,xori
				 "100" when  ALUOp_ctrl_i="1000" else --MUL _mul
				 --"101" when //edit on RealTime												
				 "110" when ((funct_i="100010" or funct_i="101010") and ALUOp_ctrl_i="0000") or (ALUOp_ctrl_i = "0101")  else	    --SUB(-) _sub,slt,slti
				 "111"; 
   							
--------------------------------------------------------------------------------------------------------
Shftr: Shifter generic map(32,5) port map(x=>X"000000" & B"000" & sign_extend_i(10 DOWNTO 6),
											y=>b_input_w,
											dir=>shifter_dir,
											cout=>shifter_cout,
											res=>shifter_out); 
shifter_dir <= '1' when (funct_i="000010" and ALUOp_ctrl_i="0000") else --srl
			   '0';			
--------------------------------------------------------------------------------------------------------			   
	-- Generate Zero Flag
	zero_o <= 	'1' WHEN (alu_out_mux_w(DATA_BUS_WIDTH-1 DOWNTO 0) = X"00000000") ELSE
				'0';    
	
	-- Select ALU output        
	alu_res_o <= 	X"0000000" & B"000"  & alu_out_mux_w(31) 								 WHEN  (funct_i="101010" and ALUOp_ctrl_i="0000") or (ALUOp_ctrl_i = "0101") ELSE  --slt,slti
					sign_extend_i(15 DOWNTO 0) & X"0000" 									 when ALUOp_ctrl_i="0111" else  --lui
					shifter_out		 when (funct_i="000000" and ALUOp_ctrl_i="0000") else  --sll
					shifter_out		 when (funct_i="000010" and ALUOp_ctrl_i="0000") else  --srl						
					alu_out_mux_w(DATA_BUS_WIDTH-1 DOWNTO 0);
					

PROCESS (alu_ctl_w, a_input_w, b_input_w)
	BEGIN		
 	CASE alu_ctl_w IS	-- Select ALU operation
						-- ALU performs ALUresult = A_input AND B_input
		WHEN "000" 	=>	alu_out_mux_w 	<= a_input_w AND b_input_w; 
						-- ALU performs ALUresult = A_input OR B_input
     	WHEN "001" 	=>	alu_out_mux_w 	<= a_input_w OR b_input_w;
						-- ALU performs ALUresult = A_input + B_input
	 	WHEN "010" 	=>	alu_out_mux_w 	<= a_input_w + b_input_w;
						-- ALU performs ALUresult = A_input XOR B_input
 	 	WHEN "011" 	=>	alu_out_mux_w <= a_input_w XOR b_input_w;
						-- ALU performs ALUresult = A_input(15 downto 0) * B_input(15 downto 0)
 	 	WHEN "100" 	=>	alu_out_mux_w 	<= a_input_w(15 DOWNTO 0) * b_input_w(15 DOWNTO 0);
						-- ALU performs ?
 	 	WHEN "101" 	=>	alu_out_mux_w 	<= X"00000000";
						-- ALU performs ALUresult = A_input -B_input
 	 	WHEN "110" 	=>	alu_out_mux_w 	<= a_input_w - b_input_w;
						-- ALU performs ?
  	 	WHEN "111" 	=>	alu_out_mux_w 	<= X"00000000"; 
 	 	WHEN OTHERS	=>	alu_out_mux_w 	<= X"00000000" ;
  	END CASE;
  END PROCESS;
  
END behavior;

