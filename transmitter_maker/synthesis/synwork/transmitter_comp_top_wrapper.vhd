--
-- Synopsys
-- Vhdl wrapper for top level design, written on Sat Jan  7 23:58:24 2023
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_transmitter is
   port (
      DEVRST_N : in std_logic
   );
end wrapper_for_transmitter;

architecture rtl of wrapper_for_transmitter is

component transmitter
 port (
   DEVRST_N : in std_logic
 );
end component;

signal tmp_DEVRST_N : std_logic;

begin

tmp_DEVRST_N <= DEVRST_N;



u1:   transmitter port map (
		DEVRST_N => tmp_DEVRST_N
       );
end rtl;
