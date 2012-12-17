-- Memoria de registros
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


entity MemoriaReg is

 Port ( clk : in  STD_LOGIC;
           Read_register_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_register_2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  reg_write : in  STD_LOGIC;--rf_wr
           write_register : in  STD_LOGIC_VECTOR (4 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data_2 : out  STD_LOGIC_VECTOR (31 downto 0));
end MemoriaReg;

architecture Behavioral of MemoriaReg is

type rom is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);

signal memoria_reg: rom := (
			x"00000000", -- 0  $zero
			x"00000000", -- 1  $at
			x"00000000", -- 2  $v0
			x"00000000", -- 3  $v1
			x"00000000", -- 4  $a0
			x"00000000", -- 5  $a1
			x"00000000", -- 6  $a2
			x"00000000", -- 7  $a3
			x"00000000", -- 8  $t0
			x"00000000", -- 9  $t1
			x"00000000", -- 10 $t2
			x"00000000", -- 11 $t3
			x"00000000", -- 12 $t4
			x"00000000", -- 13 $t5
			x"00000000", -- 14 $t6
			x"00000000", -- 15 $t7
			x"00000000", -- 16 $s0
			x"00000000", -- 17 $s1
			x"00000000", -- 18 $s2
			x"00000000", -- 19 $s3
			x"00000000", -- 20 $s4
			x"00000000", -- 21 $s5
			x"00000000", -- 22 $s6
			x"00000000", -- 23 $s7
			x"00000000", -- 24 $t8
			x"00000000", -- 25 $t9
			x"00000000", -- 26 $k0
			x"00000000", -- 27 $k1
			x"00000000", -- 28 $gp
			x"00000000", -- 29 $sp
			x"00000000", -- 30 $fp
			x"00000000" -- 31 $ra
			);
begin
	read_data_1 <= memoria_reg(conv_integer(Read_register_1)) ;
	read_data_2 <= memoria_reg(conv_integer(Read_register_2)) ;

	process (clk)
	begin
		if (rising_edge (clk)) then 
			if reg_write = '1' and write_register /= "00000" then  -- dejar solo zero
				memoria_reg(conv_integer (write_register)) <= write_data ;
			end if;
		end if;
	end process;

end Behavioral;

