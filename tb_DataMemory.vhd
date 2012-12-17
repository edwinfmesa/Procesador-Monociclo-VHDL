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
 
ENTITY tb_DataMemory IS
END tb_DataMemory;
 
ARCHITECTURE behavior OF tb_DataMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         clk : IN  std_logic;
         mem_write : IN  std_logic;
         mem_read : IN  std_logic;
         address : IN  std_logic_vector(31 downto 0);
         write_data : IN  std_logic_vector(31 downto 0);
         read_data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal mem_write : std_logic := '0';
   signal mem_read : std_logic := '0';
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal read_data : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          clk => clk,
          mem_write => mem_write,
          mem_read => mem_read,
          address => address,
          write_data => write_data,
          read_data => read_data
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
       mem_write <= '0';
		 mem_read <= '1';
		 address <= X"00000000";
		 write_data <= X"f2f3f4f5"; -- No importa porque no se va a escribir
      wait for 100 ns;	
		 mem_write <= '1';
		 mem_read <= '1';
		 address <= X"00000004";
		 write_data <= X"f2f3f4f4"; 
		 wait for 100 ns;	
		mem_write <= '0';
		 mem_read <= '1';
		 address <= X"00000008";
		 write_data <= X"f2f3f4f1"; -- No importa porque no se va a escribir
		wait for 100 ns;	
		 mem_write <= '0';
		 mem_read <= '1';
		 address <= X"00000004";
		 write_data <= X"f2f3f4f5"; -- No importa porque no se va a escribir 
      wait;
   end process;

END;
