-- Memoria de Instrucciones
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstructionMemory is
	Port (  instruction_address : in  STD_LOGIC_VECTOR (31 downto 0);
           instruccion : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

type rom is array (0 to 255) of std_logic_vector (31 downto 0);

-- Definición de una memoria de instrucciones con un codigo de prueba (Codigo HEX resultante de simulacion en MARS 4.2)
constant memoria: rom:=(
		X"3c011001", -- 00111100000000010001000000000001  test_bench
		X"34300000", -- 00110100001100000000000000000000  test_bench
		X"3c011001", -- 00111100000000010001000000000001  test_bench
		X"34310028",
		X"8e310000",
		X"ae090000",
		X"24090003",
		X"ae090004",
		X"24090004",
		X"ae090008",
		X"24090006",
		X"ae09000c",
		X"24090004",
		X"ae090010",
		X"24090008",
		X"ae090014",
		X"24090061",
		X"ae090018",
		X"24090017",
		X"ae09001c",
		X"2409000c",
		X"ae090020",
		X"24090007",
		X"ae090024",
		X"8e120000",
		X"00129820",
		X"20080004",
		X"20090001",
		X"0131502a",
		X"1140000c",
		X"01280018",
		X"00005812",
		X"020b5820",
		X"8d6b0000",
		X"024b602a",
		X"11800001",
		X"000b9020",
		X"0173602a",
		X"11800001",
		X"000b9820",
		X"21290001",
		X"0810001c",
		X"00121020",
		X"00131820",
			
		others => X"00000000");

begin

		instruccion <= memoria(conv_integer(instruction_address)/4);  -- se convierte la direccion de hexa a decimal y se divide por 4 ya que una instruccion utiliza 4 bytes.

end Behavioral;












