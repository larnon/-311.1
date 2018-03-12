--ram1024.vhd: 1024x16bit RAM implementation
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.opcodes.all;

entity ram1024 is port(
	rst: in std_logic;
	cs: in std_logic; --chip select
	wr: in std_logic; --write enable
	rd: in std_logic;--read enable
	addr: in std_logic_vector(9 downto 0);
	data: inout std_logic_vector(15 downto 0));
end ram1024;

architecture imp of ram1024 is

subtype cell is std_logic_vector(15 downto 0);
type ram_type is array(0 to 1023) of cell;
signal RAM: ram_type;

begin
	--subtype ISR is std_logic_vector(15 downto 0);
	--type int_type is array(0 to 5) of ISR;

	-- ISR0 code
	-- must be placed at FF80H
	--constant INT : int_type :=(
	--movi&A&"00000000",
	--mov&C&D&"00000",
	--add&A&A&D&"00",
	--dec&C&C&"00000",
	--jnz&"10000000010",
	--ret&"00000000000"
	--);

	--begin
	--process(rst)
		--begin
		--if(rst='1') then -- ISR is written into the RAM
			--for I in 0 to 5 loop
				--RAM(65407+I)<=INT(I);
			--end loop;
		--end if;
	--end process;
	
	process(cs, wr, rd, addr)
	begin
		if (cs='0' and rd='1') then
			data <= RAM(conv_integer(addr));
		elsif(cs='0' and wr='1') then
			RAM(conv_integer(addr)) <= data ;
		else data <= (others=>'Z');
		end if;
	end process;
end imp;
