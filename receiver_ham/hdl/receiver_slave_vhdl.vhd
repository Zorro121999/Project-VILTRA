--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: receiver_slave_vhdl.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::144 TQ>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity receiver_slave_vhdl is
port (
    --<port_name> : <direction> <type>;
	    PCLK : in  STD_LOGIC;
		PENABLE : in  STD_LOGIC;
		PSEL : in  STD_LOGIC;
		PRESETN : in  STD_LOGIC;
		PWRITE : in  STD_LOGIC;
		PWDATA : in  STD_LOGIC_VECTOR (31 downto 0);
		PADDR : in  STD_LOGIC_VECTOR (31 downto 0);
        PRDATA : out STD_LOGIC_VECTOR(31 downto 0);
        LED_correct : OUT std_logic;
        LED_detect : OUT std_logic;
		LEDs : out  STD_LOGIC_VECTOR (7 downto 0);
		PREADY : out  STD_LOGIC
    --<other_ports>;
);
end receiver_slave_vhdl;
architecture architecture_receiver_slave_vhdl of receiver_slave_vhdl is
   -- signal, component etc. declarations
   signal rd_int : std_logic;
   signal data_int : std_logic_vector(7 downto 0);
   
	component APB_slave_vhdl
    port (
             PCLK : in  STD_LOGIC;
            PENABLE : in  STD_LOGIC;
            PSEL : in  STD_LOGIC;
            PRESETN : in  STD_LOGIC;
            PWRITE : in  STD_LOGIC;
            PWDATA : in  STD_LOGIC_VECTOR (31 downto 0);
            PADDR : in  STD_LOGIC_VECTOR (31 downto 0);
            PRDATA : out STD_LOGIC_VECTOR(31 downto 0);
            data_out : out  STD_LOGIC_VECTOR (7 downto 0);
            PREADY : out  STD_LOGIC;
            RD_EN  : out STD_LOGIC
            --PSLVERR : out  STD_LOGIC;
              );
    end component;
    
    component decode_ham
    port(
         	clk : IN  std_logic; 
    reset : IN std_logic;
    rd : IN std_logic;
    pulse : IN std_logic_vector(7 downto 0);
    LED_correct : OUT std_logic;
    LED_detect : OUT std_logic;
    LEDs : OUT std_logic_vector(7 downto 0)  
    );
    end component;

begin
  dc : decode_ham
  port map(
           clk => PCLK,
           reset => PRESETN,
           rd => rd_int,
           pulse => data_int,
           LED_correct=>LED_correct,
           LED_detect=>LED_detect,
           LEDs => LEDs);
  
  APB : APB_slave_vhdl
  port map(
            PCLK => PCLK,
            PENABLE => PENABLE,
            PSEL => PSEL,
            PRESETN => PRESETN,
            PWRITE => PWRITE,
            PWDATA => PWDATA,
            PRDATA => PRDATA,
            PADDR => PADDR,
            data_out => data_int,
            PREADY => PREADY,
            RD_EN => rd_int
            );

   -- architecture body
end architecture_receiver_slave_vhdl;
