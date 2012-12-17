-- Test Bench MuxALU
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
