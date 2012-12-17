LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_SignExtend IS
END tb_SignExtend;
 
ARCHITECTURE behavior OF tb_SignExtend IS 
 
    COMPONENT SignExtend
    PORT(
         inmediate : IN  std_logic_vector(15 downto 0);
         inmediate_extended : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
   signal inmediate : std_logic_vector(15 downto 0) := (others => '0');


   signal inmediate_extended : std_logic_vector(31 downto 0);

 
 
BEGIN
 
   uut: SignExtend PORT MAP (
          inmediate => inmediate,
          inmediate_extended => inmediate_extended
        );


   stim_proc: process
   begin		
		inmediate <= "0111001100101001";
      wait for 100 ns;	
		inmediate <= "1011100101000010";
      wait;
   end process;

END;
