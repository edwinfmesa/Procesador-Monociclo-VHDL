-- Unidad de control de la ALU
-- Creado por:
-- Edwin Fernando Mesa Salazar 	1088273519
-- Jonathan Muñoz Gomez 			1088278497
-- Programa: Ingenieria de Sistemas y Computación
-- Asignatura: Arquitectura de computadores
-- Profesora: Lina Maria Perez Perez
-- Universidad Tecnologica de Pereira
-- 2012

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlALU is
	port (
		opcode: in std_logic_vector(5 downto 0);
		funct: in std_logic_vector(5 downto 0);
		ALU_op: out std_logic_vector(3 downto 0)
	);
end ControlALU;

architecture Behavioral of ControlALU is
	begin
		process(funct, opcode)
			begin
				case opcode is
					when "000000"=>  --  se modifica por 10
						case funct is
							when "100000"=>	
								ALU_op <= "0000";-- Instrucción add
							when "100010"=>	
								ALU_op <= "0001";-- Instrucción sub
							when "100100"=>	
								ALU_op <= "0010";-- Instrucción and
							when "100101"=>	
								ALU_op <= "0011";-- Instrucción or
							when "101010"=>	
								ALU_op <= "0100";-- Instrucción slt
							when others =>    
								ALU_op <= "1111";-- Operacion no configurada
						end case;
					when "100011"=>  --  instruccion lw -- se modifica a 00
							ALU_op <= "0101";
					when "100111"=> --  instruccion sw -- se modifica a 00
							ALU_op <= "0110";
					when "000100"=>  --  instruccioin beq -- se modifica a 01
							ALU_op <= "0111";
					when "000101"=>  -- instruccion bne -- se modifica a 01
							ALU_op <= "1000";
					when others =>    
							ALU_op <= "1111";-- Operacion no configurada
				end case;
		end process;
end Behavioral;

