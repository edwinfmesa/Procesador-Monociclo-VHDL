-- Multiplexor para el Register File
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


entity MuxRF is
    Port ( regDst : in  STD_LOGIC;
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           write_register : out  STD_LOGIC_VECTOR (4 downto 0));
end MuxRF;

architecture Behavioral of MuxRF is

begin
	process(regDst, rd, rt)
	  begin
		case regDst is
			when '0'	=>  write_register <=  rd;
			when '1'	=>  write_register <=  rt;
			when others	=>  write_register <= (others => '0');		
		end case;
   end process;

end Behavioral;

