LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SHIFT_IN IS
	GENERIC (BIT_WIDTH : INTEGER := 8);
	PORT (CLK : IN STD_LOGIC;
		  RST : IN STD_LOGIC;
		  EN : IN STD_LOGIC;
		  BIT_IN : IN STD_LOGIC;
		  REG_OUT : OUT STD_LOGIC_VECTOR(BIT_WIDTH-1 DOWNTO 0));
END SHIFT_IN;

ARCHITECTURE SHIFT_LOGIC OF SHIFT_IN IS
	CONSTANT ENABLE_VAL : STD_LOGIC := '0';
	SIGNAL SHIFT_REGISTER : STD_LOGIC_VECTOR(BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(CLK, RST)
	BEGIN
		IF RST = '1' THEN
			SHIFT_REGISTER <= (OTHERS => '0');
		ELSIF CLK'EVENT AND CLK = '1' THEN
			IF EN = '0' THEN
				SHIFT_REGISTER <= SHIFT_REGISTER(BIT_WIDTH-2 DOWNTO 0) & BIT_IN;
			END IF;
		END IF;
	END PROCESS;
	REG_OUT(BIT_WIDTH-1 DOWNTO 0) <= SHIFT_REGISTER(BIT_WIDTH-1 DOWNTO 0);
END SHIFT_LOGIC;