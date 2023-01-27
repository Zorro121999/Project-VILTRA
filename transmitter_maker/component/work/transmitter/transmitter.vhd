----------------------------------------------------------------------
-- Created by SmartDesign Fri Jan 27 16:33:23 2023
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
-- transmitter entity declaration
----------------------------------------------------------------------
entity transmitter is
    -- Port list
    port(
        -- Inputs
        DEVRST_N   : in  std_logic;
        -- Outputs
        FIC_0_CLK  : out std_logic;
        FIC_0_LOCK : out std_logic;
        GPIO_0_M2F : out std_logic;
        LEDs       : out std_logic_vector(7 downto 0)
        );
end transmitter;
----------------------------------------------------------------------
-- transmitter architecture body
----------------------------------------------------------------------
architecture RTL of transmitter is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- transmitter_sb
component transmitter_sb
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        FAB_RESET_N      : in  std_logic;
        -- Outputs
        FIC_0_CLK        : out std_logic;
        FIC_0_LOCK       : out std_logic;
        GPIO_0_M2F       : out std_logic;
        LEDs             : out std_logic_vector(7 downto 0);
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal FIC_0_CLK_net_0                   : std_logic;
signal FIC_0_LOCK_net_0                  : std_logic;
signal GPIO_0_M2F_net_0                  : std_logic;
signal LEDs_net_0                        : std_logic_vector(7 downto 0);
signal transmitter_sb_0_POWER_ON_RESET_N : std_logic;
signal FIC_0_CLK_net_1                   : std_logic;
signal FIC_0_LOCK_net_1                  : std_logic;
signal GPIO_0_M2F_net_1                  : std_logic;
signal LEDs_net_1                        : std_logic_vector(7 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 FIC_0_CLK_net_1  <= FIC_0_CLK_net_0;
 FIC_0_CLK        <= FIC_0_CLK_net_1;
 FIC_0_LOCK_net_1 <= FIC_0_LOCK_net_0;
 FIC_0_LOCK       <= FIC_0_LOCK_net_1;
 GPIO_0_M2F_net_1 <= GPIO_0_M2F_net_0;
 GPIO_0_M2F       <= GPIO_0_M2F_net_1;
 LEDs_net_1       <= LEDs_net_0;
 LEDs(7 downto 0) <= LEDs_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- transmitter_sb_0
transmitter_sb_0 : transmitter_sb
    port map( 
        -- Inputs
        FAB_RESET_N      => transmitter_sb_0_POWER_ON_RESET_N,
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => transmitter_sb_0_POWER_ON_RESET_N,
        FIC_0_CLK        => FIC_0_CLK_net_0,
        FIC_0_LOCK       => FIC_0_LOCK_net_0,
        GPIO_0_M2F       => GPIO_0_M2F_net_0,
        LEDs             => LEDs_net_0 
        );

end RTL;
