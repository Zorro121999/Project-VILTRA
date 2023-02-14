--
-- Synopsys
-- Vhdl wrapper for top level design, written on Tue Feb 14 18:53:48 2023
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_trans_maker_ham3 is
   port (
      DEVRST_N : in std_logic;
      PB1 : in std_logic;
      GPIO_0_M2F : out std_logic;
      LEDs : out std_logic_vector(7 downto 0)
   );
end wrapper_for_trans_maker_ham3;

architecture rtl of wrapper_for_trans_maker_ham3 is

component trans_maker_ham3
 port (
   DEVRST_N : in std_logic;
   PB1 : in std_logic;
   GPIO_0_M2F : out std_logic;
   LEDs : out std_logic_vector (7 downto 0)
 );
end component;

signal tmp_DEVRST_N : std_logic;
signal tmp_PB1 : std_logic;
signal tmp_GPIO_0_M2F : std_logic;
signal tmp_LEDs : std_logic_vector (7 downto 0);

begin

tmp_DEVRST_N <= DEVRST_N;

tmp_PB1 <= PB1;

GPIO_0_M2F <= tmp_GPIO_0_M2F;

LEDs <= tmp_LEDs;



u1:   trans_maker_ham3 port map (
		DEVRST_N => tmp_DEVRST_N,
		PB1 => tmp_PB1,
		GPIO_0_M2F => tmp_GPIO_0_M2F,
		LEDs => tmp_LEDs
       );
end rtl;
