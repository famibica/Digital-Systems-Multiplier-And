----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:59 09/12/2018 
-- Design Name: 
-- Module Name:    counter4bits - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity counter4bits is
	port(
		clk: in std_logic;
		reset: in std_logic;
		updown: in std_logic;		
		counterOut: out std_logic_vector (3 downto 0)
	);
end counter4bits;

architecture Behavioral of counter4bits is
	signal reg : std_logic_vector(3 downto 0); -- contador
begin

	process(clk, reset, updown) begin
		if(reset='1') then
			reg <= (others=>'0');
		elsif(clk'event and clk='1') then
			if(updown='0') then
				reg <= std_logic_vector(unsigned(reg)+1);
			else
				reg <= std_logic_vector(unsigned(reg)-1);
			end if;
		end if;
	end process;

	counterOut <= reg;
 
end Behavioral;