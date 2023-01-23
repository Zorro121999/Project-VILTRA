--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: display_noham.vhd
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
USE ieee.numeric_std.ALL;

entity display_noham is
port (
    --<port_name> : <direction> <type>;
	clk : IN  std_logic; 
    reset : IN std_logic;
    rd : IN std_logic;
    pulse : IN std_logic_vector(7 downto 0);
    LEDs : OUT std_logic_vector(7 downto 0)  -- example
    --<other_ports>;
);
end display_noham;
architecture architecture_display_noham of display_noham is
   -- signal, component etc. declarations
   signal dffr1 : std_logic := '0';
   signal dffr2 : std_logic := '0';
   signal LEDs_int : std_logic_vector(7 downto 0);
   signal rd_int : std_logic;
	

    
begin
  EP : process(clk, reset)
	begin
	if (reset = '0') then
		dffr1 <= '0';
	elsif(clk'event and clk = '1') then
		dffr1 <= rd;
		dffr2 <= dffr1;
	end if;
  end process;

rd_int <= dffr2 and (not dffr1);



  disp_copy : process(clk,reset)
  begin
  if(rising_edge(clk)) then
    if(reset='0') then
      LEDs<=(others=>'0');
    elsif(reset='1' and rd_int='1') then
      LEDs_int<=pulse;
    else
      LEDs<=LEDs_int;
    end if;
  end if;
  end process;
  
  --disp_own : process(clk,reset)
  --begin
  --if(rising_edge(clk)) then
    --if(reset='0') then
      --LEDs<=(others=>'0');
    --elsif(reset='1' and rd='1') then
      --LEDs_int<=pulse;
    --else
      --LEDs<=LEDs_int;
    --end if;
  --end if;
  
end architecture_display_noham;
