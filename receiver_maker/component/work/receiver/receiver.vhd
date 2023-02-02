----------------------------------------------------------------------
-- Created by SmartDesign Tue Jan 31 19:06:09 2023
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
-- receiver entity declaration
----------------------------------------------------------------------
entity receiver is
    -- Port list
    port(
        -- Inputs
        DEVRST_N   : in  std_logic;
        GPIO_0_F2M : in  std_logic;
        -- Outputs
        LEDs       : out std_logic_vector(7 downto 0)
        );
end receiver;
----------------------------------------------------------------------
-- receiver architecture body
----------------------------------------------------------------------
architecture RTL of receiver is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- receiver_sb
component receiver_sb
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        FAB_RESET_N      : in  std_logic;
        GPIO_0_F2M       : in  std_logic;
        -- Outputs
        LEDs             : out std_logic_vector(7 downto 0);
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal LEDs_net_0                     : std_logic_vector(7 downto 0);
signal receiver_sb_0_POWER_ON_RESET_N : std_logic;
signal LEDs_net_1                     : std_logic_vector(7 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 LEDs_net_1       <= LEDs_net_0;
 LEDs(7 downto 0) <= LEDs_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- receiver_sb_0
receiver_sb_0 : receiver_sb
    port map( 
        -- Inputs
        FAB_RESET_N      => receiver_sb_0_POWER_ON_RESET_N,
        DEVRST_N         => DEVRST_N,
        GPIO_0_F2M       => GPIO_0_F2M,
        -- Outputs
        POWER_ON_RESET_N => receiver_sb_0_POWER_ON_RESET_N,
        LEDs             => LEDs_net_0 
        );

end RTL;
