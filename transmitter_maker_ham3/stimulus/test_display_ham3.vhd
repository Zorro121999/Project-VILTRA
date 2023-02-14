--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: test_display_ham3.vhd
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

entity test_display_ham3 is
end test_display_ham3;

architecture behavioral of test_display_ham3 is

    signal clk : std_logic; 
	signal reset : std_logic;
    signal rd : std_logic;
    signal pulse : std_logic_vector(7 downto 0);
    signal button : std_logic;
    signal ham_out :std_logic_vector(7 downto 0);
    signal LEDs : std_logic_vector(7 downto 0); 
    
    
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
   
   display : display_ham
   port map(
            clk=>clk,
            reset=>reset,
            rd=>rd,
            pulse=>pulse,
            button=>button,
            ham_out=>ham_out,
            LEDs=>LEDs
            );
    
    clock_proc : process
    begin
      clk<='0';
      wait for 10 ns;
      clk<='1';
      wait for 10 ns;
    end process;
    
    reset_proc : process
    begin
      reset<='0';
      wait for 200 ns;
      reset<='1';
      wait;
    end process;
    
    rd_proc : process
    begin
      rd<='1';
      wait for 20 ns;
      rd<='0';
      wait for 500 ns;
    end process;
    
    button_proc : process
    begin
      button<='0';
      wait for 1000 ns;
      button<='1';
      wait for 500 ns;
    end process;
    
    pulse_proc : process  -- toggle between to possible pulses
    begin
      pulse<="00000000";
      wait for 520 ns;
      pulse<="00001111";
      wait for 520 ns;
    end process;
    
end behavioral;

