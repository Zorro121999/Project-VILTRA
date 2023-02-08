--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Feb  8 13:19:05 2023
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_receiver_with_ham is
   port (
      DEVRST_N : in std_logic;
      GPIO_0_F2M : in std_logic;
      LED_correct : out std_logic;
      LED_detect : out std_logic;
      LEDs : out std_logic_vector(7 downto 0)
   );
end wrapper_for_receiver_with_ham;

architecture rtl of wrapper_for_receiver_with_ham is

component receiver_with_ham
 port (
   DEVRST_N : in std_logic;
   GPIO_0_F2M : in std_logic;
   LED_correct : out std_logic;
   LED_detect : out std_logic;
   LEDs : out std_logic_vector (7 downto 0)
 );
end component;

signal tmp_DEVRST_N : std_logic;
signal tmp_GPIO_0_F2M : std_logic;
signal tmp_LED_correct : std_logic;
signal tmp_LED_detect : std_logic;
signal tmp_LEDs : std_logic_vector (7 downto 0);

begin

tmp_DEVRST_N <= DEVRST_N;

tmp_GPIO_0_F2M <= GPIO_0_F2M;

LED_correct <= tmp_LED_correct;

LED_detect <= tmp_LED_detect;

LEDs <= tmp_LEDs;



u1:   receiver_with_ham port map (
		DEVRST_N => tmp_DEVRST_N,
		GPIO_0_F2M => tmp_GPIO_0_F2M,
		LED_correct => tmp_LED_correct,
		LED_detect => tmp_LED_detect,
		LEDs => tmp_LEDs
       );
end rtl;
