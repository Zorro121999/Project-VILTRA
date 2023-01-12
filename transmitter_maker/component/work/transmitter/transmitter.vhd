----------------------------------------------------------------------
-- Created by SmartDesign Sat Jan  7 23:57:59 2023
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
        DEVRST_N : in std_logic
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
        AMBA_SLAVE_0_PRDATAS0  : in  std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PREADYS0  : in  std_logic;
        AMBA_SLAVE_0_PSLVERRS0 : in  std_logic;
        DEVRST_N               : in  std_logic;
        FAB_RESET_N            : in  std_logic;
        -- Outputs
        AMBA_SLAVE_0_PADDRS    : out std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PENABLES  : out std_logic;
        AMBA_SLAVE_0_PSELS0    : out std_logic;
        AMBA_SLAVE_0_PWDATAS   : out std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PWRITES   : out std_logic;
        FIC_0_CLK              : out std_logic;
        FIC_0_LOCK             : out std_logic;
        GPIO_0_M2F             : out std_logic;
        INIT_DONE              : out std_logic;
        MSS_READY              : out std_logic;
        POWER_ON_RESET_N       : out std_logic
        );
end component;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net: std_logic;
signal GND_net: std_logic;
signal AMBA_SLAVE_0_PRDATAS0_const_net_0: std_logic_vector(31 downto 0);

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net                           <= '1';
 GND_net                           <= '0';
 AMBA_SLAVE_0_PRDATAS0_const_net_0 <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- transmitter_sb_0
transmitter_sb_0 : transmitter_sb
    port map( 
        -- Inputs
        FAB_RESET_N            => VCC_net, -- tied to '1' from definition
        AMBA_SLAVE_0_PREADYS0  => VCC_net, -- tied to '1' from definition
        AMBA_SLAVE_0_PSLVERRS0 => GND_net, -- tied to '0' from definition
        DEVRST_N               => DEVRST_N,
        AMBA_SLAVE_0_PRDATAS0  => AMBA_SLAVE_0_PRDATAS0_const_net_0, -- tied to X"0" from definition
        -- Outputs
        POWER_ON_RESET_N       => OPEN,
        INIT_DONE              => OPEN,
        AMBA_SLAVE_0_PSELS0    => OPEN,
        AMBA_SLAVE_0_PENABLES  => OPEN,
        AMBA_SLAVE_0_PWRITES   => OPEN,
        FIC_0_CLK              => OPEN,
        FIC_0_LOCK             => OPEN,
        MSS_READY              => OPEN,
        GPIO_0_M2F             => OPEN,
        AMBA_SLAVE_0_PADDRS    => OPEN,
        AMBA_SLAVE_0_PWDATAS   => OPEN 
        );

end RTL;
