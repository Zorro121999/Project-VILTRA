----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sun Jan  8 16:29:12 2023
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: disp2_ham_test.vhd
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


library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity disp2_ham_test is
end disp2_ham_test;

architecture behavioral of disp2_ham_test is

    

    component disp2_ham
        -- ports
        port( 
           clk : in std_logic;
         reset : in std_logic;
         pulse : in std_logic;
         LEDs : out std_logic_vector(7 downto 0)

        );
    end component;
   
    signal clk : std_logic :='1';
    signal reset : std_logic :='0';
    subtype message_t is std_logic_vector(8 downto 0);
    type pulse_t is array(0 to 7) of message_t;
    --subtype message_t is std_logic_vector(8 downto 0);
    signal pulse_int : pulse_t :=(others=>(others=>'0'));
    signal pulse : std_logic :='0';
	signal LEDs : std_logic_vector(7 downto 0); 
    signal i : integer range 0 to 8 :=0;
    signal j : integer range 0 to 72 :=0;
    signal pulse_int_v : std_logic_vector(35 downto 0) := (others=>'0');
    
begin
    pulse_int(0)<="100000001";
    pulse_int(1)<="100000011";
    pulse_int(2)<="110000101";
    pulse_int(3)<="100000111";
    pulse_int(4)<="101000001";
    pulse_int(5)<="011000001";
    pulse_int(6)<="111000001";
    pulse_int(7)<="000100001";
    pulse_int_v<=pulse_int(0) & pulse_int(1) & pulse_int(2) & pulse_int(3);

    

    -- Instantiate Unit Under Test:  disp2_ham
    disp2_ham_0 : disp2_ham
        -- port map
        port map( 
                  clk=>clk,
                  reset=>reset,
                  pulse=>pulse,
                  LEDs=>LEDs
            

        );
    
     clock_proc : process
    begin
      wait for 50 ns;
      clk<='1';
      wait for 50 ns;
      clk<='0';
    end process;
    
    reset_proc : process
    begin  
      
      wait for 2000 ns;
      reset<='1';
      
      wait;
    end process;
    
    pulse_proc : process
    begin
      if(j<36) then
        pulse<=pulse_int_v(j);
        wait for 20000 ns;
        j<=j+1;
        wait for 2 ns;
      else
        j<=0;
        --wait for 100000 ns;
      end if;
      
    end process;
    
end behavioral;

