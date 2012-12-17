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

entity ControlALU is
	port (
		--opcode: in std_logic_vector(5 downto 0);
		CU_ALU_op: in std_logic_vector(1 downto 0);
		funct: in std_logic_vector(5 downto 0);
		ALU_op: out std_logic_vector(3 downto 0)
	);
end ControlALU;

architecture Behavioral of ControlALU is
	begin
		process(funct, CU_ALU_op)
			begin
				case CU_ALU_op is
					when "10"=>  --  se modifica por 10
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
					when "00" => -- instruccion lw y sw
							ALU_OP <= "0000"; -- se utiliza la misma operacion que la suma
					when "01"=>  --  instruccioin beq  y bne
							ALU_op <= "0111";
					when others =>    
							ALU_op <= "1111";-- Operacion no configurada
				end case;
		end process;
end Behavioral;

