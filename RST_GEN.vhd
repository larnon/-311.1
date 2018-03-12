-- reset.vhd: Reset circuit

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rst_gen is port(
	reset : out std_logic);
end rst_gen;

architecture Behavioral of rst_gen is
begin
	reset <= '1' after 0 us, '0' after 1.5 us;
end Behavioral;
