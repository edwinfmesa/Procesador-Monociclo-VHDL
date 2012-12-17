-- Test bench MuxPC
-- Creado por:
-- Edwin Fernando Mesa Salazar 	
-- Jonathan Muñoz Gomez 			
-- Programa: Ingenieria de Sistemas y Computación
-- Asignatura: Arquitectura de computadores
-- Profesora: Lina Maria Perez Perez
-- Universidad Tecnologica de Pereira
-- 2012

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY tb_MuxPC IS
END tb_MuxPC;
 
ARCHITECTURE behavior OF tb_MuxPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MuxPC
    PORT(
         branch_and_zero : IN  std_logic;
         PC_increased : IN  std_logic_vector(31 downto 0);
         ALU_result : IN  std_logic_vector(31 downto 0);
         next_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal branch_and_zero : std_logic := '0';
   signal PC_increased : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_result : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal next_PC : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MuxPC PORT MAP (
          branch_and_zero => branch_and_zero,
          PC_increased => PC_increased,
          ALU_result => ALU_result,
          next_PC => next_PC
        );


   -- Stimulus process
   stim_proc: process
   begin		
     PC_increased 		  <= "01010101010101110011001100110011";
		 ALU_result <= "11111111111111001001001010101001";
		 branch_and_zero <= '0';
      wait for 100 ns;	
		PC_increased 		  <= "01010101010101110011001100110011";
		 ALU_result <= "11111111111111001001001010101001";
		 branch_and_zero <= '1';
      wait for 100 ns;	
		PC_increased 		  <= "01010101010101110011001100110011";
		 ALU_result <= "11111111111111001001001010101001";
		 branch_and_zero <= '0';
      wait;
   end process;

END;
