-- Multiplexor para el Program Counter
-- Creado por:
-- Edwin Fernando Mesa Salazar 	
-- Jonathan Muñoz Gomez 			
-- Programa: Ingenieria de Sistemas y Computación
-- Asignatura: Arquitectura de computadores
-- Profesora: Lina Maria Perez Perez
-- Universidad Tecnologica de Pereira
-- 2012
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxPC is
    Port ( branch_and_zero : in  STD_LOGIC;
           PC_increased : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_result : in  STD_LOGIC_VECTOR (31 downto 0);
           next_PC : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end MuxPC;

architecture Behavioral of MuxPC is

begin
	process(branch_and_zero, PC_increased, ALU_result)
	  begin
		case branch_and_zero is
			when '0'	=> next_PC <=  PC_increased;
			when '1'	=> next_PC <=  ALU_result;
			when others	=> next_PC <= (others => '0');		
		end case;
   end process;

end Behavioral;

