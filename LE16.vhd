library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;
use work.u311.LE;

entity LE16 is
    port(
	S : in std_logic_vector(2 DOWNTO 0);
	A, B : in std_logic_vector(15 DOWNTO 0);
	X : out std_logic_vector(15 DOWNTO 0));
end LE16;

architecture imp of LE16 is
begin
	LE16X: for I in 0 to 15 generate
		LEX: LE port map(S, A(I), B(I), X(I));
	end generate LE16X;
end imp;
