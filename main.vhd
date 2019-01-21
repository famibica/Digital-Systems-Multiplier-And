----------------------------------------------------------------------------------
-- Company: None
-- Engineer: Matheus Bica
-- 
-- Create Date:    01:30:54 09/12/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: Work 1 - VHDL - Sistemas Digitais - UFRGS - 2018 - 2
-- Target Devices: Spartan 3
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
-- Assumindo que sao 2 botoes de updown, um para C1 e outro para C2.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  updown1 : in  STD_LOGIC;
			  updown2 : in  STD_LOGIC;
           selectionOption : in  STD_LOGIC;
           output1 : out  STD_LOGIC_VECTOR (6 downto 0);
           output2 : out  STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is
	
	component counter4bits is
		port(
			clk: in std_logic;
			reset: in std_logic;
			updown: in std_logic;		
			counterOut: out std_logic_vector (3 downto 0)
		);
	end component counter4bits;
	
	component boxAnd is
		port(
			counter1 : in  STD_LOGIC_VECTOR (3 downto 0);
			counter2 : in  STD_LOGIC_VECTOR (3 downto 0);
         output : out  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component boxAnd;
	
	component boxMultiply is
		port(
			counter1 : in  STD_LOGIC_VECTOR (3 downto 0);
			counter2 : in  STD_LOGIC_VECTOR (3 downto 0);
         output : out  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component boxMultiply;
	
	component selection is
		port(
			clk : in  STD_LOGIC;
			reset : in  STD_LOGIC;
         selectionOption : in  STD_LOGIC;
         resultBox1 : in  STD_LOGIC_VECTOR (7 downto 0);
         resultBox2 : in  STD_LOGIC_VECTOR (7 downto 0);
         selectionOutput : out STD_LOGIC_VECTOR (7 downto 0)
		);
	end component selection;
	
	component nibble7seg is
		port(
			selectionEntry : in  STD_LOGIC_VECTOR (7 downto 0);
         nibbleOutputLSN : out  STD_LOGIC_VECTOR (6 downto 0);
			nibbleOutputMSN : out  STD_LOGIC_VECTOR (6 downto 0)
		);
	end component nibble7seg;
		
	signal counter1Output : std_logic_vector (3 downto 0);
	signal counter2Output : std_logic_vector (3 downto 0);
	signal box1Output : std_logic_vector (7 downto 0);
	signal box2Output : std_logic_vector (7 downto 0);
	signal selectionOutput : std_logic_vector (7 downto 0);
	signal nibbleOutputMSN : STD_LOGIC_VECTOR (6 downto 0);
	signal nibbleOutputLSN : STD_LOGIC_VECTOR (6 downto 0);
		
begin

	box_Counter_1		:	counter4bits port map(clk, reset, updown1, counter1Output);
	box_Counter_2   	:	counter4bits port map(clk, reset, updown2, counter2Output);
	box_And				:	boxAnd port map(counter1Output, counter2Output, box1Output);		
	box_Multiply		:	boxMultiply port map(counter1Output, counter2Output, box2Output);
	box_Selection		: 	selection port map(clk, reset, selectionOption, box1Output, box2Output, selectionOutput);
	box_Nibble			:	nibble7seg port map(selectionOutput, nibbleOutputLSN, nibbleOutputMSN);
		
	output1 <= nibbleOutputMSN;
	output2 <= nibbleOutputLSN;
	
end Behavioral;

