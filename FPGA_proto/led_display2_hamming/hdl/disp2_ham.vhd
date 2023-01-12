--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: disp2_ham.vhd
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
use IEEE.numeric_std.all;

entity disp2_ham is
port (
    --<port_name> : <direction> <type>;
	clk : IN  std_logic; -- example
    reset : IN std_logic;
    pulse : IN std_logic;
    LEDs : OUT std_logic_vector(7 downto 0)  -- example
    --<other_ports>;
);
end disp2_ham;

architecture architecture_disp2_ham of disp2_ham is
   -- signal, component etc. declarations
	signal clk_count : integer range 0 to 101;
	signal signal_clk : std_logic;
    signal pulse_count : unsigned(3 downto 0);
    signal shift_reg : std_logic_vector(3 downto 0);
    signal a : std_logic;
    signal b : std_logic;
    signal c : std_logic;
    signal d : std_logic;
    signal LED_int : std_logic_vector(7 downto 0);

begin
  clock_devider : process(clk,reset)
  begin
  if(reset='0' and rising_edge(clk)) then
    clk_count<=0;
    signal_clk<='0';
  elsif(reset='1' and rising_edge(clk)) then
    if(clk_count<99) then
      clk_count<=clk_count+1;
    elsif(clk_count>=99) then
      signal_clk<=not signal_clk;
      clk_count<=0;
    end if;
  end if;
  end process;
    
  hamming_encode : process(clk,reset,signal_clk)
  begin
  if(reset='0' and rising_edge(clk)) then
    a<='0';
    b<='0';
    c<='0';
    d<='0';
  elsif(reset='1' and rising_edge(signal_clk)) then
    if(pulse_count="100") then
      a<=shift_reg(0) xor shift_reg(2) xor shift_reg(3);
      b<=shift_reg(0) xor shift_reg(1) xor shift_reg(3);
      c<=shift_reg(0) xor shift_reg(1) xor shift_reg(2);
    elsif(pulse_count="101") then
      d<=shift_reg(0) xor shift_reg(1) xor shift_reg(2) xor a xor shift_reg(3) xor b xor c;
    end if;
  end if;
  end process;
  
  LED_count : process(clk,reset,signal_clk)
  begin
  if(reset='0' and rising_edge(clk)) then
    pulse_count<=(others=>'0');
    shift_reg<=(others=>'0');
  elsif(reset='1' and rising_edge(signal_clk)) then
    if(pulse_count<="011") then
       shift_reg(3 downto 0)<=shift_reg(2 downto 0) & pulse;
       pulse_count<=pulse_count+1;
    elsif(pulse_count>"111") then
       pulse_count<=(others=>'0');
       LED_int<=shift_reg & a & b & c & d;
       shift_reg<=(others=>'0');
    else
       pulse_count<=pulse_count+1;
    end if;
  end if;
  end process;
  LEDs<=LED_int;

end architecture_disp2_ham;