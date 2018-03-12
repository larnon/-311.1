library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY FA IS PORT(
        carryIn : IN std_logic;
        carryOut : OUT std_logic;
        x, y : IN std_logic;
        s : OUT std_logic);
END FA;

ARCHITECTURE implementation OF FA IS
    BEGIN
        s <= x XOR y XOR carryIn;
        carryOut <= (x and y) or (carryIn and (x or y));
END implementation;