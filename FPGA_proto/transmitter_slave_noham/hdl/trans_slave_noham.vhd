--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: trans_slave_noham.vhd
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

entity trans_slave_noham is
port (
    PCLK : in  STD_LOGIC;
		PENABLE : in  STD_LOGIC;
		PSEL : in  STD_LOGIC;
		PRESETN : in  STD_LOGIC;
		PWRITE : in  STD_LOGIC;
		PWDATA : in  STD_LOGIC_VECTOR (7 downto 0);
		PADDR : in  STD_LOGIC_VECTOR (7 downto 0);
		LEDs : out  STD_LOGIC_VECTOR (7 downto 0);
		PREADY : out  STD_LOGIC
		--PSLVERR : out  STD_LOGIC
		);

end trans_slave_noham;
architecture architecture_trans_slave_noham of trans_slave_noham is
   -- signal, component etc. declarations
   signal rd_int : std_logic;
   
	component APB_slave_vhdl
    port (
             PCLK : in  STD_LOGIC;
            PENABLE : in  STD_LOGIC;
            PSEL : in  STD_LOGIC;
            PRESETN : in  STD_LOGIC;
            PWRITE : in  STD_LOGIC;
            PWDATA : in  STD_LOGIC_VECTOR (7 downto 0);
            PADDR : in  STD_LOGIC_VECTOR (7 downto 0);
            LEDs : out  STD_LOGIC_VECTOR (7 downto 0);
            PREADY : out  STD_LOGIC;
            RD_EN  : out STD_LOGIC
            --PSLVERR : out  STD_LOGIC;
              );
    end component;
    
    component display_noham
    port(
         	clk : IN  std_logic; 
    reset : IN std_logic;
    rd : IN std_logic;
    pulse : IN std_logic_vector(7 downto 0);
    LEDs : OUT std_logic_vector(7 downto 0)  
    );
    end component;

begin
  dn : display_noham
  port map(
           clk => PCLK,
           reset => PRESETN,
           rd => rd_int,
           pulse => PWDATA,
           LEDs => LEDs);
  
  APB : APB_slave_vhdl
  port map(
            PCLK => PCLK,
            PENABLE => PENABLE,
            PSEL => PSEL,
            PRESETN => PRESETN,
            PWRITE => PWRITE,
            PWDATA => PWDATA,
            PADDR => PADDR,
            LEDs => LEDs,
            PREADY => PREADY,
            RD_EN => rd_int
            );
            
           

end architecture_trans_slave_noham;
