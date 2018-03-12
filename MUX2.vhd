--mux2.vhd: 2x1 16-bit multiplexer

library ieee;
use ieee.std_logic_1164.all;

entity mux2 is port(
	s : in std_logic;
	x0,x1: in std_logic_vector (15 downto 0);
	y : out std_logic_vector (15 downto 0));
end mux2;

Architecture behavioral of mux2 is
begin
	Process(s,x0,x1)
	begin
		case s is
			when '0' => y<= x0;
			when '1' => y<= x1;
			when others => y <= "XXXXXXXXXXXXXXXX";
		end case;
	end Process;
end behavioral;
