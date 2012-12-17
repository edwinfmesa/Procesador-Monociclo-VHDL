-- Multiplexor para la ALU
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

entity MuxALU is
    Port ( aluSrc : in  STD_LOGIC;
           inmediate_extended : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_data : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxALU;

architecture Behavioral of MuxALU is

begin
	process(aluSrc,inmediate_extended, read_data_2)
	  begin
		case aluSrc is
			when '0'	=> ALU_data <= read_data_2;
			when '1'	=> ALU_data <=  inmediate_extended;
			when others	=> ALU_data <= (others => '0');		
		end case;
  end process;

end Behavioral;

