--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:39:45 09/13/2018
-- Design Name:   
-- Module Name:   C:/Users/IEUser/Desktop/trab1/trabalho1_Bica_2018_2/testBench.vhd
-- Project Name:  trabalho1_Bica_2018_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testBench IS
END testBench;
 
ARCHITECTURE behavior OF testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         updown1 : IN  std_logic;
         updown2 : IN  std_logic;
         selectionOption : IN  std_logic;
         output1 : OUT  std_logic_vector(6 downto 0);
         output2 : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal updown1 : std_logic := '0';
   signal updown2 : std_logic := '0';
   signal selectionOption : std_logic := '0';

 	--Outputs
   signal output1 : std_logic_vector(6 downto 0);
   signal output2 : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clk => clk,
          reset => reset,
          updown1 => updown1,
          updown2 => updown2,
          selectionOption => selectionOption,
          output1 => output1,
          output2 => output2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		-- hold reset state for 100ns
		reset <= '1';
		wait for 100 ns;
		wait for clk_period*10;
		
		-- insert stimulus here 
		reset <= '0';
		
		updown1 <= '0';
		updown2 <= '0';
		selectionOption <= '0';
      wait for clk_period*16;
		
		updown1 <= '0';
		updown2 <= '0';
		selectionOption <= '1';		
      wait for clk_period*16;
		
		updown1 <= '1';
		updown2 <= '0';
		selectionOption <= '0';		
      wait for clk_period*16;
		
		updown1 <= '1';
		updown2 <= '0';
		selectionOption <= '1';		
      wait for clk_period*16;

      wait;
   end process;

END;
