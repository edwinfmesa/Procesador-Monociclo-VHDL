 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- Test Bench para MuxRF
-- Creado por:
-- Edwin Fernando Mesa Salazar 	
-- Jonathan Muñoz Gomez 			
-- Programa: Ingenieria de Sistemas y Computación
-- Asignatura: Arquitectura de computadores
-- Profesora: Lina Maria Perez Perez
-- Universidad Tecnologica de Pereira
-- 2012
ENTITY tb_MuxRF IS
END tb_MuxRF;
 
ARCHITECTURE behavior OF tb_MuxRF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MuxRF
    PORT(
         regDst : IN  std_logic;
         rd : IN  std_logic_vector(4 downto 0);
         rt : IN  std_logic_vector(4 downto 0);
         write_register : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal regDst : std_logic := '0';
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal rt : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal write_register : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MuxRF PORT MAP (
          regDst => regDst,
          rd => rd,
          rt => rt,
          write_register => write_register
        );

   -- Stimulus process
   stim_proc: process
   begin		
		 rd 		<= "00101";
		 rt      <= "11000";
		 regDst <= '0';
      wait for 100 ns;	
		 rd 		<= "10101";
		 rt      <= "01010";
		 regDst <= '1';
      wait for 100 ns;	
		 rd 	   <= "11001";
		 rt 		<= "00101";
		 regDst <= '0';
      wait;
   end process;

END;
