-- Test Bench InstructionMemory
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
 
ENTITY tb_InstructionMemory IS
END tb_InstructionMemory;
 
ARCHITECTURE behavior OF tb_InstructionMemory IS 
 
    COMPONENT InstructionMemory
    PORT(
         instruction_address : IN  std_logic_vector(31 downto 0);
         instruccion : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction_address : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal instruccion : std_logic_vector(31 downto 0);
 
BEGIN
 
   uut: InstructionMemory PORT MAP (
          instruction_address => instruction_address,
          instruccion => instruccion
        );


   stim_proc: process
   begin		
      instruction_address <= X"00000000";
      wait for 100 ns;	
		instruction_address <= X"00000004";
      wait for 100 ns;	
		instruction_address <= X"00000008";
      wait;
   end process;

END;
