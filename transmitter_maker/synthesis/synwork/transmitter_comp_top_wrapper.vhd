--
-- Synopsys
-- Vhdl wrapper for top level design, written on Mon Jan 23 17:42:05 2023
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_transmitter is
   port (
      DEVRST_N : in std_logic;
      FAB_RESET_N : in std_logic;
      FIC_0_CLK : out std_logic;
      FIC_0_LOCK : out std_logic;
      GPIO_0_M2F : out std_logic;
      LEDs : out std_logic_vector(7 downto 0)
   );
end wrapper_for_transmitter;

architecture rtl of wrapper_for_transmitter is

component transmitter
 port (
   DEVRST_N : in std_logic;
   FAB_RESET_N : in std_logic;
   FIC_0_CLK : out std_logic;
   FIC_0_LOCK : out std_logic;
   GPIO_0_M2F : out std_logic;
   LEDs : out std_logic_vector (7 downto 0)
 );
end component;

signal tmp_DEVRST_N : std_logic;
signal tmp_FAB_RESET_N : std_logic;
signal tmp_FIC_0_CLK : std_logic;
signal tmp_FIC_0_LOCK : std_logic;
signal tmp_GPIO_0_M2F : std_logic;
signal tmp_LEDs : std_logic_vector (7 downto 0);

begin

tmp_DEVRST_N <= DEVRST_N;

tmp_FAB_RESET_N <= FAB_RESET_N;

FIC_0_CLK <= tmp_FIC_0_CLK;

FIC_0_LOCK <= tmp_FIC_0_LOCK;

GPIO_0_M2F <= tmp_GPIO_0_M2F;

LEDs <= tmp_LEDs;



u1:   transmitter port map (
		DEVRST_N => tmp_DEVRST_N,
		FAB_RESET_N => tmp_FAB_RESET_N,
		FIC_0_CLK => tmp_FIC_0_CLK,
		FIC_0_LOCK => tmp_FIC_0_LOCK,
		GPIO_0_M2F => tmp_GPIO_0_M2F,
		LEDs => tmp_LEDs
       );
end rtl;
