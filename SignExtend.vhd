-- Unidad de signo extendido
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

entity SignExtend is
	Port ( inmediate : in  STD_LOGIC_VECTOR (15 downto 0);            -- Numero inmediato en 16 Bits
          inmediate_extended : out  STD_LOGIC_VECTOR (31 downto 0)); -- Numero Inmediato en 32 Bits
end SignExtend;

architecture Behavioral of SignExtend is

begin
	process(inmediate)
	begin
		if inmediate(15) = '1' then
			inmediate_extended <= "1111111111111111"&inmediate; -- Complemento a 2 para numeros negativos
		else 
			if inmediate(15) = '0' then
					inmediate_extended <= "0000000000000000"&inmediate; -- Complemento a 2 para numeros positivos
			end if; 
		end if;
	end process;
end Behavioral;