----------------------------------------------------------------------
-- Created by SmartDesign Wed Feb  8 13:18:37 2023
-- Version: 2022.2 2022.2.0.10
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- receiver_with_ham entity declaration
----------------------------------------------------------------------
entity receiver_with_ham is
    -- Port list
    port(
        -- Inputs
        DEVRST_N    : in  std_logic;
        GPIO_0_F2M  : in  std_logic;
        -- Outputs
        LED_correct : out std_logic;
        LED_detect  : out std_logic;
        LEDs        : out std_logic_vector(7 downto 0)
        );
end receiver_with_ham;
----------------------------------------------------------------------
-- receiver_with_ham architecture body
----------------------------------------------------------------------
architecture RTL of receiver_with_ham is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- receiver_with_ham_sb
component receiver_with_ham_sb
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        FAB_RESET_N      : in  std_logic;
        GPIO_0_F2M       : in  std_logic;
        -- Outputs
        LED_correct      : out std_logic;
        LED_detect       : out std_logic;
        LEDs             : out std_logic_vector(7 downto 0);
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal LED_correct_net_0                       : std_logic;
signal LED_detect_net_0                        : std_logic;
signal LEDs_net_0                              : std_logic_vector(7 downto 0);
signal receiver_with_ham_sb_0_POWER_ON_RESET_N : std_logic;
signal LED_correct_net_1                       : std_logic;
signal LED_detect_net_1                        : std_logic;
signal LEDs_net_1                              : std_logic_vector(7 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 LED_correct_net_1 <= LED_correct_net_0;
 LED_correct       <= LED_correct_net_1;
 LED_detect_net_1  <= LED_detect_net_0;
 LED_detect        <= LED_detect_net_1;
 LEDs_net_1        <= LEDs_net_0;
 LEDs(7 downto 0)  <= LEDs_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- receiver_with_ham_sb_0
receiver_with_ham_sb_0 : receiver_with_ham_sb
    port map( 
        -- Inputs
        FAB_RESET_N      => receiver_with_ham_sb_0_POWER_ON_RESET_N,
        DEVRST_N         => DEVRST_N,
        GPIO_0_F2M       => GPIO_0_F2M,
        -- Outputs
        POWER_ON_RESET_N => receiver_with_ham_sb_0_POWER_ON_RESET_N,
        LED_correct      => LED_correct_net_0,
        LED_detect       => LED_detect_net_0,
        LEDs             => LEDs_net_0 
        );

end RTL;
