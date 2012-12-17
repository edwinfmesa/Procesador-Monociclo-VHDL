-- Unidad de control de la ALU
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

ENTITY tb_ControlALU IS
END tb_ControlALU;
 
ARCHITECTURE behavior OF tb_ControlALU IS 

    COMPONENT ControlALU
    PORT(
			CU_ALU_op: in std_logic_vector(1 downto 0);
         funct : IN  std_logic_vector(5 downto 0);
         ALU_op : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal CU_ALU_op : std_logic_vector(1 downto 0) := (others => '0');
	signal funct : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALU_op : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlALU PORT MAP (
			CU_ALU_op => CU_ALU_op,
          funct => funct,
          ALU_op => ALU_op
        );

   stim_proc: process
   begin		
		CU_ALU_op <="10";
      funct <="100000"; -- add
      wait for 20 ns;	
		CU_ALU_op <="10";
		funct <= "100101"; -- or
		wait for 20 ns;	
		CU_ALU_op <="01"; -- beq
		funct <= "000000"; -- no importa
      wait;
   end process;

END;
