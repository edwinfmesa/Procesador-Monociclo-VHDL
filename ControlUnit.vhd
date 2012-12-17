-- Unidad de control
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



entity ControlUnit is
	port(
		opCode		: in std_logic_vector(5 downto 0);
		regWrite		: out std_logic;                       		--habilita la escritura en un registro			//RegWrite
		memToReg		: out std_logic;										--habilita cual dato se enviara a escribir 		//MemtoReg
		memWrite		: out std_logic;										--habilita la escritura en memoria 			//MemWrite
		memRead		: out std_logic;										--habilita la lectura en memoria 			//MemRead
		aluOP	: out std_logic_vector(1 downto 0);						--operacion a realizar en la ALU 	//ALUOp
		regDst		: out std_logic;										--habilita en cual registro se va a escribir //RegDst
		branch		: out std_logic;										--Habilita las instrucciones de salto
		aluSrc		: out std_logic										--Habilita el inmediato extendido
	);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

process (opCode)
begin
	case opCode is
		-- Instructiones Tipo R
		when "000000" =>
			regWrite		<= '1';	--La instruccion tipo R requiere escribir en un registro
			regDst		<= '1';  --Se selecciona el registr rt para escritura
			memWrite		<= '0'; 
			memRead		<= '0';
			memToReg		<= '0'; 
			branch 		<= '0'; 
			aluOp       <= "10";
			aluSrc      <= '0';
		-- LW
		when "100011" =>
			regWrite		<= '1'; --Se habilita para poder escribir en un registro
			regDst		<= '0';
			branch 		<= '0';
			memWrite		<= '0';
			memRead		<= '1'; --Se habilita la lectura de la memoria de datos
			memToReg		<= '1'; --Se selecciona el dato que viene de la memoria de datos
			aluOP 	   <= "00"; 
			aluSrc      <= '1';  -- Se trabaja con el inmediato
		-- SW
		when "101011" =>
			regWrite		<= '0';
			regDst		<= '0';
			branch 		<= '0';
			memWrite		<= '1'; --Se habilita para almacenar el dato en la memoria de datos
			memRead		<= '0';
			memToReg		<= '0'; 
			aluOP 	   <= "00"; 
			aluSrc      <= '1';  -- Se trabaja con el inmediato
		-- BEQ
		when "000100" =>
			regWrite		<= '0';
			regDst		<= '0';
			branch 		<= '1'; --Se habilita el branch
			memWrite		<= '0';
			memRead		<= '0';
			memToReg		<= '0';
			aluOP 	   <= "01";
			aluSrc      <= '1';
		-- BNE
		when "000101" =>
			regWrite		<= '0';
			regDst		<= '0';
			branch 		<= '1'; --Se habilita el branch
			memWrite		<= '0';
			memRead		<= '0';
			memToReg		<= '0';
			aluOP 	   <= "01";
			aluSrc      <= '1';
		when others => null; -- despues colocar en ceros

	end case;

end process;

end;