--
-- Synopsys
-- Vhdl wrapper for top level design, written on Fri Feb  3 11:13:57 2023
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wrapper_for_decode_ham is
   port (
      clk : in std_logic;
      reset : in std_logic;
      rd : in std_logic;
      pulse : in std_logic_vector(7 downto 0);
      LED_correct : out std_logic;
      LED_detect : out std_logic;
      LEDs : out std_logic_vector(7 downto 0)
   );
end wrapper_for_decode_ham;

architecture architecture_decode_ham of wrapper_for_decode_ham is

component decode_ham
 port (
   clk : in std_logic;
   reset : in std_logic;
   rd : in std_logic;
   pulse : in std_logic_vector (7 downto 0);
   LED_correct : out std_logic;
   LED_detect : out std_logic;
   LEDs : out std_logic_vector (7 downto 0)
 );
end component;

signal tmp_clk : std_logic;
signal tmp_reset : std_logic;
signal tmp_rd : std_logic;
signal tmp_pulse : std_logic_vector (7 downto 0);
signal tmp_LED_correct : std_logic;
signal tmp_LED_detect : std_logic;
signal tmp_LEDs : std_logic_vector (7 downto 0);

begin

tmp_clk <= clk;

tmp_reset <= reset;

tmp_rd <= rd;

tmp_pulse <= pulse;

LED_correct <= tmp_LED_correct;

LED_detect <= tmp_LED_detect;

LEDs <= tmp_LEDs;



u1:   decode_ham port map (
		clk => tmp_clk,
		reset => tmp_reset,
		rd => tmp_rd,
		pulse => tmp_pulse,
		LED_correct => tmp_LED_correct,
		LED_detect => tmp_LED_detect,
		LEDs => tmp_LEDs
       );
end architecture_decode_ham;
