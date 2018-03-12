library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package u311 is
    component FA port(
        carryIn : IN std_logic;
        carryOut : OUT std_logic;
        x, y : IN std_logic;
        s : OUT std_logic);
    end component;

    component FA16 port(
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        F : out std_logic_vector(15 downto 0);
        cIn: in std_logic ;
        unsigned_overflow: out std_logic;
        signed_overflow: out std_logic);
    end component;
    
    component MUX_4_1 port(
        S : in std_logic_vector(1 DOWNTO 0);
        X0, X1, X2, X3 : in std_logic;
        Y : out std_logic);
    end component;
    
    component AE port(
        S : in std_logic_vector(2 DOWNTO 0);
        a, b : in std_logic;
        x : out std_logic);
    end component;

    component AE16 port(
        S : in std_logic_vector(2 DOWNTO 0);
        A, B : in std_logic_vector(15 DOWNTO 0);
        Y : out std_logic_vector(15 DOWNTO 0));
    end component;

    component LE port( 
		S : in std_logic_vector(2 DOWNTO 0);
		a, b : in std_logic;
		x : out std_logic);
    end component;

    component LE16 port(
		S : in std_logic_vector(2 DOWNTO 0);
		A, B : in std_logic_vector(15 DOWNTO 0);
		x : out std_logic_vector(15 DOWNTO 0));
    end component;

    component mux2 port(
		s : in std_logic;
		x0,x1: in std_logic_vector (15 downto 0);
		y : out std_logic_vector (15 downto 0));
    end component;

    component mux4 port(
		S : in std_logic_vector(1 downto 0);
		x0,x1,x2,x3 : in std_logic_vector (15 downto 0);
		y : out std_logic_vector (15 downto 0));
    end component;

    component Shifter16 port(
    	S : in std_logic_vector(1 DOWNTO 0);
    	A : in std_logic_vector(15 DOWNTO 0);
    	Y : out std_logic_vector(15 DOWNTO 0);
    	carryOut : out std_logic;
    	zero : out std_logic;
		zeroCheck: in std_logic_vector(4 downto 0));
    end component;

    component reg16 port(
		d : IN std_logic_vector(15 DOWNTO 0);
		ld : IN std_logic; -- load/enable.
		clr : IN std_logic; -- async. clear.
		clk : IN std_logic; -- clock.
		q : OUT std_logic_vector(15 DOWNTO 0)); -- output
    end component;

    component regfile port(
		clk: in std_logic;
		reset: in std_logic;
		we: in std_logic;
		WA: in std_logic_vector(2 downto 0);
		D: in std_logic_vector(15 downto 0);
		rbe: in std_logic;
		rae: in std_logic;
		RAA: in std_logic_vector(2 downto 0);
		RBA: in std_logic_vector(2 downto 0);
		portA: out std_logic_vector(15 downto 0);
		portB: out std_logic_vector(15 downto 0));
    end component;

    component ALU port (
   		S: in std_logic_vector(4 downto 0);
		A, B: in std_logic_vector(15 downto 0);
		F: out std_logic_vector(15 downto 0);
		unsigned_overflow: out std_logic;
		signed_overflow: out std_logic;
		carry: out std_logic;
		zero: out std_logic);
    end component;

    component buf port(
		enable: in std_logic;
		input : in std_logic_vector (15 downto 0);
		output: out std_logic_vector(15 downto 0));
    end component;

    component buf2 port(
		enable: in std_logic;
		direction: in std_logic;
		input : inout std_logic_vector (15 downto 0);
		output: inout std_logic_vector(15 downto 0));
    end component;

    component addsub16 port(
		sub: in std_logic;
		in1,in2: in std_logic_vector(15 downto 0);
		output: out std_logic_vector(15 downto 0));
    end component;

	component rst_gen port(
		reset : out std_logic);
	end component;

	component clk_gen port(
		clk : out std_logic);
	end component;

	component datapath port(
		clk: in std_logic;
		reset : in std_logic;
		pcen, den, dir, aen: in std_logic;
		SPload, PCload, IRload: in std_logic;
		Psel, Ssel, Rsel, Osel : in std_logic_vector(1 downto 0);
		sub2: in std_logic;
		jmpMux : in std_logic;
		IR : out std_logic_vector (4 downto 0);
		zero: out std_logic;
		ALUsel : in std_logic_vector (4 downto 0);
		we, rae, rbe : in std_logic;
		Buf2_out: out std_logic_vector(15 downto 0);
		Buf3_out: inout std_logic_vector(15 downto 0));
	end component;

	component controller port(
		clk: in std_logic;
		reset : in std_logic;
		pcen, den, dir, aen: out std_logic;
		SPload, PCload, IRload: out std_logic;
		Psel, Ssel, Rsel, Osel : out std_logic_vector(1 downto 0);
		sub2: out std_logic;
		jmpMux : out std_logic;
		opfetch : out std_logic;
		IR : in std_logic_vector (4 downto 0);
		zero: in std_logic;
		ALUsel : out std_logic_vector (4 downto 0);
		we, rae, rbe : out std_logic;
		int: inout std_logic; -- Had to change it to inout.
		inta, wr, rd: out std_logic);
	end component;

	component u311_1 port(
		clk: in std_logic;
		reset: in std_logic;
		opfetch: out std_logic;
		INT: inout std_logic; -- Had to change it to inout.
		INTA: out std_logic;
		WR: out std_logic;
		RD: out std_logic;
		A: out std_logic_vector(15 downto 0);
		D: inout std_logic_vector(15 downto 0));
	end component;
	
	component rom1024 port(
		cs : in std_logic;
		oe : in std_logic;
		addr : in std_logic_vector (9 downto 0);
		data : out std_logic_vector (15 downto 0));
	end component;

	component ram1024 port(
		rst: in std_logic;
		cs: in std_logic; --chip select
		wr: in std_logic; --write enable
		rd: in std_logic;--read enable
		addr: in std_logic_vector(9 downto 0);
		data: inout std_logic_vector(15 downto 0));
	end component;

end u311;