-- Test Bench MemoriaReg
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

ENTITY tb_MemoriaReg IS
END tb_MemoriaReg;
 
ARCHITECTURE behavior OF tb_MemoriaReg IS 

    COMPONENT MemoriaReg
    PORT(
         clk : IN  std_logic;
         reg_write : IN  std_logic;
         read_register_1 : IN  std_logic_vector(4 downto 0);
         read_register_2 : IN  std_logic_vector(4 downto 0);
         write_register : IN  std_logic_vector(4 downto 0);
         write_data : IN  std_logic_vector(31 downto 0);
         read_data_1 : OUT  std_logic_vector(31 downto 0);
         read_data_2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reg_write : std_logic := '0';
   signal read_register_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal read_register_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal write_register : std_logic_vector(4 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal read_data_1 : std_logic_vector(31 downto 0);
   signal read_data_2 : std_logic_vector(31 downto 0);

	-- Clock period definitions

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemoriaReg PORT MAP (
          clk => clk,
          reg_write => reg_write,
          read_register_1 => read_register_1,
          read_register_2 => read_register_2,
          write_register => write_register,
          write_data => write_data,
          read_data_1 => read_data_1,
          read_data_2 => read_data_2
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
		
		wait for 210 ns;
		reg_write<='1';
      read_register_1<="01000"; -- no importa
		read_register_2<="01001"; -- no importa
		write_register<="10001";  -- $s1
		write_data<="00000000000000000000100100011001";
		
		wait for 210 ns;
		reg_write<='1';
      read_register_1<="01010"; -- no importa
		read_register_2<="01011"; -- no importa
		write_register<="10010";  -- $s2
		write_data<="00000000000000000000011001100101";
		
      wait for  210 ns;
		reg_write<='0';
      read_register_1<="10001"; -- $s1
		read_register_2<="10010"; -- $s2
		write_register<="01010";  -- no importa
		write_data<="00000000000000000000111001100101"; -- no importa
      wait;
   end process;

END;
