----------------------------------------------------------------------
-- Created by SmartDesign Wed Feb  8 12:08:45 2023
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
-- trans_maker_ham3 entity declaration
----------------------------------------------------------------------
entity trans_maker_ham3 is
    -- Port list
    port(
        -- Inputs
        DEVRST_N   : in  std_logic;
        PB1        : in  std_logic;
        -- Outputs
        GPIO_0_M2F : out std_logic;
        LEDs       : out std_logic_vector(7 downto 0)
        );
end trans_maker_ham3;
----------------------------------------------------------------------
-- trans_maker_ham3 architecture body
----------------------------------------------------------------------
architecture RTL of trans_maker_ham3 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- trans_maker_ham3_sb
component trans_maker_ham3_sb
    -- Port list
    port(
        -- Inputs
        DEVRST_N       : in  std_logic;
        FAB_RESET_N    : in  std_logic;
        PB1            : in  std_logic;
        -- Outputs
        GPIO_0_M2F     : out std_logic;
        LEDs           : out std_logic_vector(7 downto 0);
        power_on_reset : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal GPIO_0_M2F_net_0                     : std_logic;
signal LEDs_net_0                           : std_logic_vector(7 downto 0);
signal trans_maker_ham3_sb_0_power_on_reset : std_logic;
signal GPIO_0_M2F_net_1                     : std_logic;
signal LEDs_net_1                           : std_logic_vector(7 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 GPIO_0_M2F_net_1 <= GPIO_0_M2F_net_0;
 GPIO_0_M2F       <= GPIO_0_M2F_net_1;
 LEDs_net_1       <= LEDs_net_0;
 LEDs(7 downto 0) <= LEDs_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- trans_maker_ham3_sb_0
trans_maker_ham3_sb_0 : trans_maker_ham3_sb
    port map( 
        -- Inputs
        FAB_RESET_N    => trans_maker_ham3_sb_0_power_on_reset,
        DEVRST_N       => DEVRST_N,
        PB1            => PB1,
        -- Outputs
        GPIO_0_M2F     => GPIO_0_M2F_net_0,
        power_on_reset => trans_maker_ham3_sb_0_power_on_reset,
        LEDs           => LEDs_net_0 
        );

end RTL;
