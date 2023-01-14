----------------------------------------------------------------------
-- Created by SmartDesign Sat Jan 14 10:24:06 2023
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
-- tx_pin_check_sys entity declaration
----------------------------------------------------------------------
entity tx_pin_check_sys is
    -- Port list
    port(
        -- Inputs
        DEVRST_N   : in  std_logic;
        -- Outputs
        GPIO_0_M2F : out std_logic;
        GPIO_1_M2F : out std_logic;
        GPIO_2_M2F : out std_logic;
        GPIO_3_M2F : out std_logic;
        GPIO_4_M2F : out std_logic;
        GPIO_5_M2F : out std_logic;
        GPIO_6_M2F : out std_logic;
        GPIO_7_M2F : out std_logic;
        GPIO_8_M2F : out std_logic;
        GPIO_9_M2F : out std_logic
        );
end tx_pin_check_sys;
----------------------------------------------------------------------
-- tx_pin_check_sys architecture body
----------------------------------------------------------------------
architecture RTL of tx_pin_check_sys is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- tx_pin_check_sys_sb
component tx_pin_check_sys_sb
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        FAB_RESET_N      : in  std_logic;
        -- Outputs
        FAB_CCC_GL0      : out std_logic;
        FAB_CCC_LOCK     : out std_logic;
        GPIO_0_M2F       : out std_logic;
        GPIO_1_M2F       : out std_logic;
        GPIO_2_M2F       : out std_logic;
        GPIO_3_M2F       : out std_logic;
        GPIO_4_M2F       : out std_logic;
        GPIO_5_M2F       : out std_logic;
        GPIO_6_M2F       : out std_logic;
        GPIO_7_M2F       : out std_logic;
        GPIO_8_M2F       : out std_logic;
        GPIO_9_M2F       : out std_logic;
        INIT_DONE        : out std_logic;
        MSS_READY        : out std_logic;
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal GPIO_0_M2F_net_0                       : std_logic;
signal GPIO_1_M2F_net_0                       : std_logic;
signal GPIO_2_M2F_net_0                       : std_logic;
signal GPIO_3_M2F_net_0                       : std_logic;
signal GPIO_4_M2F_net_0                       : std_logic;
signal GPIO_5_M2F_net_0                       : std_logic;
signal GPIO_6_M2F_net_0                       : std_logic;
signal GPIO_7_M2F_net_0                       : std_logic;
signal GPIO_8_M2F_net_0                       : std_logic;
signal GPIO_9_M2F_net_0                       : std_logic;
signal tx_pin_check_sys_sb_0_POWER_ON_RESET_N : std_logic;
signal GPIO_0_M2F_net_1                       : std_logic;
signal GPIO_1_M2F_net_1                       : std_logic;
signal GPIO_2_M2F_net_1                       : std_logic;
signal GPIO_3_M2F_net_1                       : std_logic;
signal GPIO_4_M2F_net_1                       : std_logic;
signal GPIO_5_M2F_net_1                       : std_logic;
signal GPIO_6_M2F_net_1                       : std_logic;
signal GPIO_7_M2F_net_1                       : std_logic;
signal GPIO_8_M2F_net_1                       : std_logic;
signal GPIO_9_M2F_net_1                       : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 GPIO_0_M2F_net_1 <= GPIO_0_M2F_net_0;
 GPIO_0_M2F       <= GPIO_0_M2F_net_1;
 GPIO_1_M2F_net_1 <= GPIO_1_M2F_net_0;
 GPIO_1_M2F       <= GPIO_1_M2F_net_1;
 GPIO_2_M2F_net_1 <= GPIO_2_M2F_net_0;
 GPIO_2_M2F       <= GPIO_2_M2F_net_1;
 GPIO_3_M2F_net_1 <= GPIO_3_M2F_net_0;
 GPIO_3_M2F       <= GPIO_3_M2F_net_1;
 GPIO_4_M2F_net_1 <= GPIO_4_M2F_net_0;
 GPIO_4_M2F       <= GPIO_4_M2F_net_1;
 GPIO_5_M2F_net_1 <= GPIO_5_M2F_net_0;
 GPIO_5_M2F       <= GPIO_5_M2F_net_1;
 GPIO_6_M2F_net_1 <= GPIO_6_M2F_net_0;
 GPIO_6_M2F       <= GPIO_6_M2F_net_1;
 GPIO_7_M2F_net_1 <= GPIO_7_M2F_net_0;
 GPIO_7_M2F       <= GPIO_7_M2F_net_1;
 GPIO_8_M2F_net_1 <= GPIO_8_M2F_net_0;
 GPIO_8_M2F       <= GPIO_8_M2F_net_1;
 GPIO_9_M2F_net_1 <= GPIO_9_M2F_net_0;
 GPIO_9_M2F       <= GPIO_9_M2F_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- tx_pin_check_sys_sb_0
tx_pin_check_sys_sb_0 : tx_pin_check_sys_sb
    port map( 
        -- Inputs
        FAB_RESET_N      => tx_pin_check_sys_sb_0_POWER_ON_RESET_N,
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => tx_pin_check_sys_sb_0_POWER_ON_RESET_N,
        INIT_DONE        => OPEN,
        FAB_CCC_GL0      => OPEN,
        FAB_CCC_LOCK     => OPEN,
        MSS_READY        => OPEN,
        GPIO_0_M2F       => GPIO_0_M2F_net_0,
        GPIO_1_M2F       => GPIO_1_M2F_net_0,
        GPIO_2_M2F       => GPIO_2_M2F_net_0,
        GPIO_3_M2F       => GPIO_3_M2F_net_0,
        GPIO_4_M2F       => GPIO_4_M2F_net_0,
        GPIO_5_M2F       => GPIO_5_M2F_net_0,
        GPIO_6_M2F       => GPIO_6_M2F_net_0,
        GPIO_7_M2F       => GPIO_7_M2F_net_0,
        GPIO_8_M2F       => GPIO_8_M2F_net_0,
        GPIO_9_M2F       => GPIO_9_M2F_net_0 
        );

end RTL;
