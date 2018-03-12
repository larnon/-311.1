library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LE is 
    port(
	S : in std_logic_vector(2 DOWNTO 0);
	a, b : in std_logic;
	x : out std_logic);
end LE;


architecture imp of LE is
begin
	process(S, a, b)
	begin
		case S is
	            when "000" => x <= a;
		    when "001" => x <= a AND b;
		    when "010" => x <= a OR b;
		    when "011" => x <= NOT a;
		    when others => x <= a;
	        end case;
	end process;
end imp;