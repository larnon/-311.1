library ieee;
use ieee.std_logic_1164.all;

entity MUX_4_1 is port(
        S : in std_logic_vector(1 DOWNTO 0);
        X0, X1, X2, X3 : in std_logic;
        Y : out std_logic);
end MUX_4_1;

ARCHITECTURE implementation OF MUX_4_1 IS
BEGIN
	PROCESS(S, X0, X1, X2, X3)
	BEGIN
		CASE S IS
			WHEN "00"     => Y <= X0;
			WHEN "01"     => Y <= X1;
			WHEN "10"     => Y <= X2;
			WHEN "11"     => Y <= X3;
			WHEN OTHERS   => Y <= 'X';
		END CASE;
	END PROCESS;
END implementation;
        
