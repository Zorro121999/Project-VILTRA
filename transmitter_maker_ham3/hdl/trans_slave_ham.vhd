--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: trans_slave_ham.vhd
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

entity trans_slave_ham is
port (
    --<port_name> : <direction> <type>;
	 PCLK : in  STD_LOGIC;
		PENABLE : in  STD_LOGIC;
		PSEL : in  STD_LOGIC;
		PRESETN : in  STD_LOGIC;
		PWRITE : in  STD_LOGIC;
		PWDATA : in  STD_LOGIC_VECTOR (31 downto 0);
		PADDR : in  STD_LOGIC_VECTOR (31 downto 0);
        BUTTON : in STD_LOGIC;
        PRDATA : out STD_LOGIC_VECTOR(31 downto 0);
		LEDs : out  STD_LOGIC_VECTOR (7 downto 0);
		PREADY : out  STD_LOGIC
);
end trans_slave_ham;
architecture architecture_trans_slave_ham of trans_slave_ham is
   -- signal, component etc. declarations
   signal rd_int : std_logic;
   signal data_int : std_logic_vector(7 downto 0);
   signal ham_int : std_logic_vector(7 downto 0);
   
   	component APB_slave_vhdl_ham
    port (
             PCLK : in  STD_LOGIC;
            PENABLE : in  STD_LOGIC;
            PSEL : in  STD_LOGIC;
            PRESETN : in  STD_LOGIC;
            PWRITE : in  STD_LOGIC;
            PWDATA : in  STD_LOGIC_VECTOR (31 downto 0);
            PADDR : in  STD_LOGIC_VECTOR (31 downto 0);
            ham_in : in STD_LOGIC_VECTOR(7 downto 0);
            PRDATA : out STD_LOGIC_VECTOR(31 downto 0);
            data_out : out  STD_LOGIC_VECTOR (7 downto 0);
            PREADY : out  STD_LOGIC;
            RD_EN  : out STD_LOGIC
            --PSLVERR : out  STD_LOGIC;
              );
    end component;
    
      component display_ham
    port(
         	clk : IN  std_logic; 
    reset : IN std_logic;
    rd : IN std_logic;
    pulse : IN std_logic_vector(7 downto 0);
    button : IN std_logic;
    ham_out : OUT std_logic_vector(7 downto 0);
    LEDs : OUT std_logic_vector(7 downto 0)  
    );
    end component;
    
begin
  dn : display_ham
  port map(
           clk => PCLK,
           reset => PRESETN,
           rd => rd_int,
           pulse => data_int,
           button => button,
           ham_out => ham_int,
           LEDs => LEDs);

    APB : APB_slave_vhdl_ham
  port map(
            PCLK => PCLK,
            PENABLE => PENABLE,
            PSEL => PSEL,
            PRESETN => PRESETN,
            PWRITE => PWRITE,
            PWDATA => PWDATA,
            PADDR => PADDR,
            ham_in => ham_int,
            PRDATA => PRDATA,
            data_out => data_int,
            PREADY => PREADY,
            RD_EN => rd_int
            );
   -- architecture body
end architecture_trans_slave_ham;
