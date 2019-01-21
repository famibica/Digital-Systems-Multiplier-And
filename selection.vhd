----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:48:00 09/12/2018 
-- Design Name: 
-- Module Name:    selection - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity selection is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           selectionOption : in  STD_LOGIC;
           resultBox1 : in  STD_LOGIC_VECTOR (7 downto 0);
           resultBox2 : in  STD_LOGIC_VECTOR (7 downto 0);
           selectionOutput : out  STD_LOGIC_VECTOR (7 downto 0));
end selection;

architecture Behavioral of selection is
	signal reg : std_logic_vector(7 downto 0); -- selection temporary output	
begin

	process (clk, reset)
	begin
		if (reset = '1') then
			reg <= "00000000";
		elsif (clk'event and clk = '1') then
			if (selectionOption = '0') then
				reg <= resultBox1;
			else
				reg <= resultBox2;
			end if;
		end if;
	end process;
	
	selectionOutput <= reg;

end Behavioral;

