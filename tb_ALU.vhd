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
 
ENTITY tb_ALU IS
END tb_ALU;
 

ARCHITECTURE behavior OF tb_ALU IS 
 
    COMPONENT ALU
    PORT(
         clk : IN  std_logic;
         read_data_1 : IN  std_logic_vector(31 downto 0);
         read_data_2 : IN  std_logic_vector(31 downto 0);
         zero : OUT  std_logic;
         ALU_op : IN  std_logic_vector(3 downto 0);
         ALU_result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal read_data_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal read_data_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal zero : std_logic;
   signal ALU_result : std_logic_vector(31 downto 0);
	
	
	-- Clock period definitions
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          clk => clk,
          read_data_1 => read_data_1,
          read_data_2 => read_data_2,
          zero => zero,
          ALU_op => ALU_op,
          ALU_result => ALU_result
        );

	clk_process :process
   begin
		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
   end process; 
	
   -- Stimulus process
    stim_proc: process
   begin		
		read_data_1<= "00000000000000000000001010101010";
		read_data_2<= "00000000000000000000000101010101";
		ALU_op <= "0000"; -- add
		
		wait for 210 ns;
		read_data_1<= "00000000000000000000000000000010";
		read_data_2<= "00000000000000000000000001001101";
		ALU_op <= "0100"; -- slt
		 
		wait for 210 ns;
		read_data_1<= "00000000000000000000000101001101";
		read_data_2<= "00000000000000000000000101001101";
		ALU_op <= "0111"; -- beq
      wait;
   end process;


END;
