LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;
----------------------------------
ENTITY ForwardingUnit IS
	PORT( 		
		ID_EX_RegRs_i,ID_EX_RegRt_i		: IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		EX_MEM_RegRd_i,MEM_WB_RegRd_i   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		EX_MEM_RegWrite_i 				: IN  STD_LOGIC;
		MEM_WB_RegWrite_i 				: IN  STD_LOGIC;
		ForwardA, ForwardB				: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		);
END 	ForwardingUnit;
----------------------------------
ARCHITECTURE ForwardingUnit OF ForwardingUnit IS
BEGIN
	PROCESS (EX_MEM_RegWrite_i,EX_MEM_RegRd_i,ID_EX_RegRs_i,MEM_WB_RegWrite_i,MEM_WB_RegRd_i)
	BEGIN
		if (EX_MEM_RegWrite_i='1' AND EX_MEM_RegRd_i /= "00000" AND EX_MEM_RegRd_i = ID_EX_RegRs_i)  then
			ForwardA <= "10";
		elsif (MEM_WB_RegWrite_i='1' and MEM_WB_RegRd_i /= "00000" and not(EX_MEM_RegWrite_i='1' and EX_MEM_RegRd_i /= "00000" and 
			   EX_MEM_RegRd_i = ID_EX_RegRs_i) and MEM_WB_RegRd_i = ID_EX_RegRs_i) then 
			ForwardA <= "01";
		else 
			ForwardA <= "00";
		END IF;
	END PROCESS;	
		
		
	PROCESS (EX_MEM_RegWrite_i,EX_MEM_RegRd_i,ID_EX_RegRt_i,MEM_WB_RegWrite_i,MEM_WB_RegRd_i)
	BEGIN
		if (EX_MEM_RegWrite_i='1' AND EX_MEM_RegRd_i /= "00000" AND EX_MEM_RegRd_i = ID_EX_RegRt_i)  then
			ForwardB <= "10";
		elsif (MEM_WB_RegWrite_i='1' and MEM_WB_RegRd_i /= "00000" and not(EX_MEM_RegWrite_i='1' and EX_MEM_RegRd_i /= "00000" and 
			   EX_MEM_RegRd_i = ID_EX_RegRt_i) and MEM_WB_RegRd_i = ID_EX_RegRt_i) then 
			ForwardB <= "01";
		else 
			ForwardB <= "00";
		END IF;	
	END PROCESS;

END ForwardingUnit;