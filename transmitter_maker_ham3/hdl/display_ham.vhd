--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: display_ham.vhd
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

entity display_ham is
port (
    --<port_name> : <direction> <type>;
	clk : IN  std_logic; 
    reset : IN std_logic;
    rd : IN std_logic;
    pulse : IN std_logic_vector(7 downto 0);
    button : IN std_logic;
    ham_out : OUT std_logic_vector(7 downto 0);
    LEDs : OUT std_logic_vector(7 downto 0)  
    --<other_ports>;
);
end display_ham;

architecture architecture_display_ham of display_ham is
   -- signal, component etc. declarations
	signal LEDs_int : std_logic_vector(7 downto 0); 
	signal LEDs_disp : std_logic_vector(7 downto 0) ; 
    signal rd_int : std_logic;
    
    signal dffr1 : std_logic := '0';
    signal dffr2 : std_logic := '0';
    
    signal button1 : std_logic :='0';
    signal button2 : std_logic :='0';
    signal button_int : std_logic :='0';
    
    signal LEDs_err : std_logic_vector(7 downto 0);
    signal button_count : integer range 0 to 8;
    signal LEDs_temp : std_logic_vector(7 downto 0);

begin
   
   EP : process(clk, reset)               --detect moment when pulse is supposed to be read in
	begin
	if (reset = '0') then
		dffr1 <= '0';
	elsif(clk'event and clk = '1') then
		dffr1 <= rd;
		dffr2 <= dffr1;
	end if;
  end process;

  rd_int <= dffr2 and (not dffr1);     -- rd_int is high when rd is falling
  
   button_proc : process(clk, reset)   --detect moment when button starts to be pressed
	begin
	if (reset = '0') then
		button1 <= '0';
	elsif(clk'event and clk = '1') then
		button1 <= button;
		button2 <= button1;
	end if;
  end process;

  button_int <= button1 and (not button2);
   
   disp : process(clk,reset)
   begin
   if(rising_edge(clk)) then
     if(reset='0') then
       LEDs_int<=(others=>'0');
     else
       if(rd_int='1') then
         LEDs_int<= not pulse;     --LEDs_int helps to delay display of LED until next data package is available
         LEDs_disp<=LEDs_int;
       else
          LEDs_int(4)<=LEDs_int(0) xor LEDs_int(1) xor LEDs_int(3);    --apply hamming code
          LEDs_int(5)<=LEDs_int(0) xor LEDs_int(2) xor LEDs_int(3);
          LEDs_int(6)<=LEDs_int(1) xor LEDs_int(2) xor LEDs_int(3);
          LEDs_int(7)<=LEDs_int(0) xor LEDs_int(1) xor LEDs_int(2) xor LEDs_int(3) xor LEDs_int(4) xor LEDs_int(5) xor LEDs_int(6);
          --LEDs<=LEDs_disp;
       end if;
     end if;
   end if;
   end process;
   
   error_intro : process(clk,reset) 
   begin
   if(rising_edge(clk)) then
     if(reset='0') then
       LEDs_err<=(others=>'0');
       LEDs<=(others=>'1');
       ham_out<=(others=>'0');
       button_count<=0;
       LEDs_temp<=(others=>'0');
     else
       if(button_int='1') then              --inject error on word that is being processed at the moment when button is pressed
         case button_count is               --bit that is flipped depends on button_count
           when 0 =>                       
             if (LEDs_int(0)='1') then
               LEDs_err<= not LEDs_int or "00000001";
               button_count<=button_count+1;
             else
               LEDs_err<=not LEDs_int and "11111110";
               button_count<=button_count+1;
             end if;
           when 1 =>
             if (LEDs_int(1)='1') then
               LEDs_err<=not LEDs_int or "00000010";
               button_count<=button_count+1;
             else
               LEDs_err<=not LEDs_int and "11111101";
               button_count<=button_count+1;
             end if;
           when 2 =>
             if (LEDs_int(2)='1') then
               LEDs_err<=not LEDs_int or "00000100";
               button_count<=button_count+1;
             else
               LEDs_err<=not LEDs_int and "11111011";
               button_count<=button_count+1;
             end if;
           when 3 =>
             if (LEDs_int(3)='1') then
               LEDs_err<=not LEDs_int or "00001000";
               button_count<=button_count+1;
             else
               LEDs_err<=not LEDs_int and "11110111";
               button_count<=button_count+1;
             end if;
           when 4 =>
             if (LEDs_int(4)='1') then
               LEDs_err<=not LEDs_int or "00010000";
               button_count<=button_count+1;
             else
               LEDs_err<=not LEDs_int and "11101111";
               button_count<=button_count+1;
             end if;
           when 5 =>
             if (LEDs_int(5)='1') then
               LEDs_err<=not LEDs_int or "00100000";
               button_count<=button_count+1;
             else
               LEDs_err<=not LEDs_int and "11011111";
               button_count<=button_count+1;
             end if;
           when 6 =>
             if (LEDs_int(6)='1') then
               LEDs_err<=not LEDs_int or "01000000";
               button_count<=button_count+1;
             else
               LEDs_err<=not LEDs_int and "10111111";
               button_count<=button_count+1;
             end if;
           when 7 =>
             if (LEDs_int(7)='1') then
               LEDs_err<=not LEDs_int or "10000000";
               button_count<=0;
             else
               LEDs_err<=not LEDs_int and "01111111";
               button_count<=0;
             end if;
           end case;
           LEDs_temp<=LEDs_int; 
          elsif(button='1') then
            ham_out<=LEDs_err;      --send the error injected word back to the MSS as long as button is pressed
            LEDs<=LEDs_temp;        --display correct hamming encoded word as long as button is pressed
          else                      --if button is not pressed display and send the hamming encoded word
            ham_out<=not LEDs_int;  
            LEDs<=LEDs_disp;
          end if;
        end if;
    end if;
    end process;
   -- architecture body
end architecture_display_ham;
