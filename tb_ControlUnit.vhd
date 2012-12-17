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
 
ENTITY tb_ControlUnit IS
END tb_ControlUnit;
 
ARCHITECTURE behavior OF tb_ControlUnit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         opCode : IN  std_logic_vector(5 downto 0);
         regWrite : OUT  std_logic;
         memToReg : OUT  std_logic;
         memWrite : OUT  std_logic;
         memRead : OUT  std_logic;
         aluOP : OUT  std_logic_vector(1 downto 0);
         regDst : OUT  std_logic;
         branch : OUT  std_logic;
			aluSrc		: out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal opCode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal regWrite : std_logic;
   signal memToReg : std_logic;
   signal memWrite : std_logic;
   signal memRead : std_logic;
   signal aluOP : std_logic_vector(1 downto 0);
   signal regDst : std_logic;
   signal branch : std_logic;
	signal aluSrc	: std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          opCode => opCode,
          regWrite => regWrite,
          memToReg => memToReg,
          memWrite => memWrite,
          memRead => memRead,
          aluOP => aluOP,
          regDst => regDst,
          branch => branch,
			 aluSrc	=>aluSrc
        );

   -- Stimulus process
   stim_proc: process
   begin		
      opCode <= "000000"; --tipo R
      wait for 100 ns;	
		opCode <= "100011"; -- LW
		wait for 100 ns;	
		opCode <= "101011"; -- SW
		wait for 100 ns;	
		opCode <= "000100"; -- BEQ
		wait for 100 ns;	
		opCode <= "000101"; -- BNE
      wait;
   end process;

END;
