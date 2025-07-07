LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;
----------------------------------
ENTITY HazardUnit IS
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
END 	HazardUnit;
----------------------------------
ARCHITECTURE HazardUnit OF HazardUnit IS
SIGNAL Stall_flag_w : STD_LOGIC;
BEGIN
	Stall_flag_w <= '1' when (ID_EX_MemRead='1' and ((ID_EX_RegRt = IF_ID_RegRs) or (ID_EX_RegRt = IF_ID_RegRt))) OR   --lw hazard check
			(((Branch_ctrl_i = '1' OR BNE_ctrl_i = '1') AND reg_write_EX_i = '1' AND (EX_write_reg_addr_i =IF_ID_RegRs OR EX_write_reg_addr_i = IF_ID_RegRt)) OR    --depencency with EX stage
			((Branch_ctrl_i = '1' OR BNE_ctrl_i = '1') AND reg_write_MEM_i = '1' AND (MEM_write_reg_addr_i = IF_ID_RegRs  OR MEM_write_reg_addr_i = IF_ID_RegRt)) OR --depencency with MEM stage
			(jr_flag_i = '1'  AND reg_write_EX_i = '1' AND EX_write_reg_addr_i = IF_ID_RegRs) OR --depencency with EX stage
			(jr_flag_i = '1'  AND reg_write_MEM_i = '1' AND MEM_write_reg_addr_i = IF_ID_RegRs)) else --depencency with MEM stage
			'0'; 
	Stall_flag_o <= Stall_flag_w;
	PROCESS (Stall_flag_w)
	BEGIN
 		if Stall_flag_w='1' then 
			IF_ID_Write	<= '0';
			PC_Write	<= '0';
			HazDet_Mux  <= '0';
		else 
			IF_ID_Write	<= '1';
			PC_Write	<= '1';
			HazDet_Mux  <= '1';
		end if;
	END PROCESS;	
END HazardUnit;


