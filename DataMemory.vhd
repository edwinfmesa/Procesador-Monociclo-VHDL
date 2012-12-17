-- Memoria de Datos
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

entity DataMemory is
	Port (  clk : in  STD_LOGIC;
           mem_write : in  STD_LOGIC;
           mem_read : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (31 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data : out  STD_LOGIC_VECTOR (31 downto 0):=X"00000000");
end DataMemory;

architecture Behavioral of DataMemory is
	type ram is array (0 to 511) of STD_LOGIC_VECTOR(31 downto 0);
	-- Definicion de la memoria de datos con datos de prueba aleatorios
	signal memoria: ram :=	(
				x"00000010",  -- 00000000000000000000000000010000
				x"00000088",  -- 00000000000000000000000010001000
				x"00002002",  -- 00000000000000000010000000000010
				x"00000012",
				x"00000111",
				x"000f3000",
				x"00000000",
				x"00000012",
				x"08929322",
				x"00000cdd",
				x"00020000",
				x"0000b002",
				x"000e000e",
				x"000002dd",
				x"0000cdcc",
				x"000ffeef",
				others=>X"00000000");

	begin
			

			process(clk)
			begin
				if (rising_edge(clk)) then
					if (mem_read = '1') then
						read_data <= memoria(conv_integer(address)/4); -- se convierte la direccion en entero y se divide por cuatro y da como resultado el indice para leer la memoria de datos
					elsif (mem_write = '1')then  
						memoria(conv_integer(address)/4)<=  write_data; -- se convierte la direccion en entero y se divide por cuatro y da como resultado el indice para  guardar en memoria de datos
					end if;
				end if;
			end process;


end Behavioral;
