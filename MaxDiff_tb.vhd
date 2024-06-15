LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE work.MyLib.all;

ENTITY MaxDiff_tb IS 

END MaxDiff_tb;

ARCHITECTURE MaxDiff_Arch OF MaxDiff_tb IS
SIGNAL RST, CLK : STD_LOGIC;
SIGNAL Start_i : STD_LOGIC;
SIGNAL Done_o : STD_LOGIC;
BEGIN
UUT: MaxDiff
PORT MAP(
	RST, CLK ,
	Start_i ,
	Done_o
);
--Clock
CLK_sig: PROCESS
BEGIN
	CLK <= '1'; Wait for 1 ns;
	CLK <= '0'; Wait for 1 ns;
END PROCESS;
--stimulus
Stimulus: PROCESS
BEGIN
	Start_i <= '0';
	RST <= '1'; Wait for 5 ns;
	RST <= '0'; Wait for 5 ns;
	--Test
	Start_i <= '1';
	Wait until Done_o = '1';
	Start_i <= '0';
	Wait;
END PROCESS;
END MaxDiff_Arch;