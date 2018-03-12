-- rom1024.vhd: 1024x16bit ROM

library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.u311.all;
use work.OPCODES.all;

entity rom1024 is port(
	cs : in std_logic;
	oe : in std_logic;
	addr : in std_logic_vector (9 downto 0);
	data : out std_logic_vector (15 downto 0));
end rom1024;

architecture imp of rom1024 is
subtype cell is std_logic_vector(15 downto 0);
type rom_type is array(0 to 40) of cell;

-- Our program stored in the memory
constant ROM : rom_type :=(
	jmp&"00000010100", -- jumps to first real instruction(for testing purposes) which is movi.
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	nop&"00000000000",
	movi&A&"00000000", -- ISR0 code starts here
	mov&C&D&"00000",   --
	add&A&A&D&"00",    --
	dec&C&C&"00000",   --
	nop&"00000000000", --
	ret&"00000000000", -- ISR0 code ends here
	movi&F&"11111111", 			-- This block from here...
	sl&F&F&"00000",				--
	sl&F&F&"00000",				--
	inc&F&F&"00000",			--
	inc&F&F&"00000",			--
	inc&F&F&"00000",			--
	s_mov_sp_r&"000"&F&"00000", -- To here; initializes SP to point to bottom of RAM.
	movi&A&"00000011", -- A = 3;
	movi&E&"00000010", -- E = 2;
	push&"000000"&A&"00", -- Push A to stack;
	dec&E&E&"00000", -- Dec E;
	jnz&"10000000011", -- loop back to 'Push A' untill E is zero
	call&"00000000001", -- Push current address to stack and jump to movi which is after halt.
	halt&"00000000000", -- halt here.
    movi&B&"00000101", -- B = 5 which we will use as an address. 
    wrt&"000"&B&A&"00", -- RAM[B] = A;
    rd&C&B&"00000",	-- C = RAM[B];
	push&"000000"&A&"00", -- Push A to stack;
    pop&D&"00000000", -- D = the value in the top of the stack, which is the value of A.
	ret&"00000000000" -- Finally, return to back to where we called.
	--movi&A&"00000111",
	--movi&C&"00000101",
	--wrt&"000"&A&C&"00",
	--halt&"00000000000",
	--push&"00000000"&H,
	--subtr&A&A&A&"00",
	--movi&A&"00000011",
	--push&"00000011"&A,
	--pop&B&"00000011",   
);

begin
	process(cs, oe, addr)
	begin
		if (cs='0' and oe='1') then
			data <= ROM(conv_integer(addr));
		else data <= (others=>'Z');
		end if;
	end process;
end imp;