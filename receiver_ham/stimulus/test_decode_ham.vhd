--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: test_decode_ham.vhd
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

entity test_decode_ham is

    
    
    

end test_decode_ham;
architecture architecture_test_decode_ham of test_decode_ham is
   -- signal, component etc. declarations
	signal clk : std_logic;
    signal reset : std_logic;
    signal rd : std_logic;
    signal pulse : std_logic_vector(7 downto 0);
    signal LED_correct : std_logic;
    signal LED_detect : std_logic;
    signal LEDs : std_logic_vector(7 downto 0);
    
 
   component decode_ham
   port(
         clk : IN  std_logic :='0'; 
         reset : IN std_logic :='0';
         rd : IN std_logic :='0';
         pulse : IN std_logic_vector(7 downto 0);
         LED_correct : OUT std_logic;
         LED_detect : OUT std_logic;
         LEDs : OUT std_logic_vector(7 downto 0)  
   );
   end component;
   
begin

   dec : decode_ham
   port map(
             clk=>clk,
             reset=>reset,
             rd=>rd,
             pulse=>pulse,
             LED_correct=>LED_correct,
             LED_detect=>LED_detect,
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
    
    pulse_proc : process   --toggle between one correct and one error-injected input pulse
    begin
      pulse<="11001000";
      wait for 520 ns;
      pulse<="11001001";
      wait for 520 ns;
    end process;
    
end architecture_test_decode_ham;
