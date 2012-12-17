-- Unidad de control de la ALU
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is

Port (     clk: in std_logic;
	        read_data_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC;
           ALU_op : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_result : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end ALU;

architecture Behavioral of ALU is

-- posibles valores ALU_op
-- 0000 add, sw, lw    	R,i,i
-- 0001 sub					R
-- 0010 and					R
-- 0011 or					R
-- 0100 slt					R
-- 0111 beq, bne			i,i


begin
process(clk, ALU_op,read_data_1,read_data_2)
begin
	case ALU_op is
		when "0000" =>  -- add, lw, sw
			ALU_result <= read_data_1 + read_data_2;   
			zero <= '0';	
		when "0001" => -- sub
			ALU_result<= read_data_1 - read_data_2; 
			zero <= '0';
		when "0010" => -- and
			ALU_result <= read_data_1 AND read_data_2;  
			zero <= '0';
		when "0011" => -- or
			ALU_result<= read_data_1 OR read_data_2;  
			zero <= '0';
		when "0100" => -- slt
			if read_data_1<read_data_2 then 
				ALU_result<=x"00000001";
			else
				ALU_result<=x"00000000"; 
			end if;
			zero <= '0';
		when "0111" => -- beq, bne
			if read_data_1 - read_data_2 = x"00000000" then 
				zero <= '1';
			else
				zero <= '0';
			end if;
			ALU_result <= x"00000000"; -- no importa
		when others =>
			ALU_result <= x"00000000";  -- operacion no configurada
			zero <= '0';
			
END CASE; 

end process;

end Behavioral;

