--
-- Synopsys
-- Vhdl wrapper for top level design, written on Sun Jan 15 16:40:45 2023
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_mss_proto_rx is
   port (
      DEVRST_N : in std_logic;
      GPIO_8_F2M : in std_logic;
      GPIO_9_F2M : in std_logic;
      GPIO_0_M2F : out std_logic;
      GPIO_1_M2F : out std_logic;
      GPIO_2_M2F : out std_logic;
      GPIO_3_M2F : out std_logic;
      GPIO_4_M2F : out std_logic;
      GPIO_5_M2F : out std_logic;
      GPIO_6_M2F : out std_logic;
      GPIO_7_M2F : out std_logic
   );
end wrapper_for_mss_proto_rx;

architecture rtl of wrapper_for_mss_proto_rx is

component mss_proto_rx
 port (
   DEVRST_N : in std_logic;
   GPIO_8_F2M : in std_logic;
   GPIO_9_F2M : in std_logic;
   GPIO_0_M2F : out std_logic;
   GPIO_1_M2F : out std_logic;
   GPIO_2_M2F : out std_logic;
   GPIO_3_M2F : out std_logic;
   GPIO_4_M2F : out std_logic;
   GPIO_5_M2F : out std_logic;
   GPIO_6_M2F : out std_logic;
   GPIO_7_M2F : out std_logic
 );
end component;

signal tmp_DEVRST_N : std_logic;
signal tmp_GPIO_8_F2M : std_logic;
signal tmp_GPIO_9_F2M : std_logic;
signal tmp_GPIO_0_M2F : std_logic;
signal tmp_GPIO_1_M2F : std_logic;
signal tmp_GPIO_2_M2F : std_logic;
signal tmp_GPIO_3_M2F : std_logic;
signal tmp_GPIO_4_M2F : std_logic;
signal tmp_GPIO_5_M2F : std_logic;
signal tmp_GPIO_6_M2F : std_logic;
signal tmp_GPIO_7_M2F : std_logic;

begin

tmp_DEVRST_N <= DEVRST_N;

tmp_GPIO_8_F2M <= GPIO_8_F2M;

tmp_GPIO_9_F2M <= GPIO_9_F2M;

GPIO_0_M2F <= tmp_GPIO_0_M2F;

GPIO_1_M2F <= tmp_GPIO_1_M2F;

GPIO_2_M2F <= tmp_GPIO_2_M2F;

GPIO_3_M2F <= tmp_GPIO_3_M2F;

GPIO_4_M2F <= tmp_GPIO_4_M2F;

GPIO_5_M2F <= tmp_GPIO_5_M2F;

GPIO_6_M2F <= tmp_GPIO_6_M2F;

GPIO_7_M2F <= tmp_GPIO_7_M2F;



u1:   mss_proto_rx port map (
		DEVRST_N => tmp_DEVRST_N,
		GPIO_8_F2M => tmp_GPIO_8_F2M,
		GPIO_9_F2M => tmp_GPIO_9_F2M,
		GPIO_0_M2F => tmp_GPIO_0_M2F,
		GPIO_1_M2F => tmp_GPIO_1_M2F,
		GPIO_2_M2F => tmp_GPIO_2_M2F,
		GPIO_3_M2F => tmp_GPIO_3_M2F,
		GPIO_4_M2F => tmp_GPIO_4_M2F,
		GPIO_5_M2F => tmp_GPIO_5_M2F,
		GPIO_6_M2F => tmp_GPIO_6_M2F,
		GPIO_7_M2F => tmp_GPIO_7_M2F
       );
end rtl;
