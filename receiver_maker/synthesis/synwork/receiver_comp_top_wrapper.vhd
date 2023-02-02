--
-- Synopsys
-- Vhdl wrapper for top level design, written on Thu Feb  2 18:03:31 2023
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_receiver is
   port (
      DEVRST_N : in std_logic;
      GPIO_0_F2M : in std_logic;
      LEDs : out std_logic_vector(7 downto 0)
   );
end wrapper_for_receiver;

architecture rtl of wrapper_for_receiver is

component receiver
 port (
   DEVRST_N : in std_logic;
   GPIO_0_F2M : in std_logic;
   LEDs : out std_logic_vector (7 downto 0)
 );
end component;

signal tmp_DEVRST_N : std_logic;
signal tmp_GPIO_0_F2M : std_logic;
signal tmp_LEDs : std_logic_vector (7 downto 0);

begin

tmp_DEVRST_N <= DEVRST_N;

tmp_GPIO_0_F2M <= GPIO_0_F2M;

LEDs <= tmp_LEDs;



u1:   receiver port map (
		DEVRST_N => tmp_DEVRST_N,
		GPIO_0_F2M => tmp_GPIO_0_F2M,
		LEDs => tmp_LEDs
       );
end rtl;
