--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:35:07 12/17/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/xilinx_projects/monociclo/tb_MuxALU.vhd
-- Project Name:  monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MuxALU
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
 
ENTITY tb_MuxALU IS
END tb_MuxALU;
 
ARCHITECTURE behavior OF tb_MuxALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MuxALU
    PORT(
         aluSrc : IN  std_logic;
         inmediate_extended : IN  std_logic_vector(31 downto 0);
         read_data_2 : IN  std_logic_vector(31 downto 0);
         ALU_data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal aluSrc : std_logic := '0';
   signal inmediate_extended : std_logic_vector(31 downto 0) := (others => '0');
   signal read_data_2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ALU_data : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MuxALU PORT MAP (
          aluSrc => aluSrc,
          inmediate_extended => inmediate_extended,
          read_data_2 => read_data_2,
          ALU_data => ALU_data
        );


   -- Stimulus process
   stim_proc: process
   begin		
		 read_data_2 		  <= "01010101010101110011001100110011";
		 inmediate_extended <= "11111111111111001001001010101001";
		 aluSrc <= '0';
      wait for 100 ns;	
		read_data_2 		  <= "01010101010101110011001100110011";
		 inmediate_extended <= "11111111111111001001001010101001";
		 aluSrc <= '1';
      wait for 100 ns;	
		read_data_2 		  <= "01010101010101110011001100110011";
		 inmediate_extended <= "11111111111111001001001010101001";
		 aluSrc <= '0';
      wait;
   end process;

END;
