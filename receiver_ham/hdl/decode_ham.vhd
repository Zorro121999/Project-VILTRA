--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: decode_ham.vhd
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

entity decode_ham is
port (
    --<port_name> : <direction> <type>;
	clk : IN  std_logic; 
    reset : IN std_logic;
    rd : IN std_logic;
    pulse : IN std_logic_vector(7 downto 0);
    LED_correct : OUT std_logic;
    LED_detect : OUT std_logic;
    LEDs : OUT std_logic_vector(7 downto 0)  
);
end decode_ham;
architecture architecture_decode_ham of decode_ham is
   -- signal, component etc. declarations
	signal LEDs_int : std_logic_vector(7 downto 0) :="00000000"; 
	--signal LEDs_disp : std_logic_vector(7 downto 0) :="00000000"; 
    signal rd_int : std_logic :='0';
    signal dffr1 : std_logic := '0';
    signal dffr2 : std_logic := '0';
    signal decoded : std_logic_vector(3 downto 0); 
    signal bit_correct : std_logic_vector(7 downto 0) := "00000000";
    

begin
   EP : process(clk, reset)          --detect moment when new pulse is supposed to be read in
	begin
	if (reset = '0') then
		dffr1 <= '0';
	elsif(clk'event and clk = '1') then
		dffr1 <= rd;
		dffr2 <= dffr1;
	end if;
  end process;

  rd_int <= dffr2 and (not dffr1); 
  
  dec : process(clk,reset)
  begin
  if(rising_edge(clk)) then
    if(reset = '0') then 
      --LEDs<=(others=>'1');
      LEDs_int<=(others=>'1');
      decoded<=(others=>'1');
    elsif(rd_int='1') then
      LEDs_int<=  pulse;
    else
      decoded(0)<=LEDs_int(0) xor LEDs_int(1) xor LEDs_int(2) xor LEDs_int(3) xor LEDs_int(4) xor LEDs_int(5) xor LEDs_int(6) xor LEDs_int(7);
      decoded(1)<=LEDs_int(1) xor LEDs_int(2) xor LEDs_int(3) xor LEDs_int(6);
      decoded(2)<=LEDs_int(0) xor LEDs_int(2) xor LEDs_int(3) xor LEDs_int(5);
      decoded(3)<=LEDs_int(0) xor LEDs_int(1) xor LEDs_int(3) xor LEDs_int(4);    --hamming decode the 4bit word
    end if;
  end if;
  end process;
  
  disp : process(clk,reset)
  begin
  if(rising_edge(clk)) then
    if(reset='0') then
      LEDs<=(others=>'1');
      --LEDs_int<=(others=>'1');
      --LEDs_disp<=(others=>'1');
      LED_correct<='0';
      LED_detect<='0';
    else
      case decoded is                       --display corrected words
        when "0000" => 
          LEDs<=not LEDs_int;
          bit_correct<="00000000";
          LED_correct<='0';
          LED_detect<='0';
        when "0001" =>                     --correct words according to the decoded value
          if(LEDs_int(7)='0') then
            bit_correct<="10000000";
            LEDs<=not (LEDs_int or bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          else
            bit_correct<="01111111";
            LEDs<=not(LEDs_int and bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          end if;
        when "0011" =>
          if(LEDs_int(6)='0') then
            bit_correct<="01000000";
            LEDs<=not(LEDs_int or bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          else
            bit_correct<="10111111";
            LEDs<=not(LEDs_int and bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          end if;
        when "0101" =>
          if(LEDs_int(5)='0') then
            bit_correct<="00100000";
            LEDs<=not(LEDs_int or bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          else
            bit_correct<="11011111";
            LEDs<=not(LEDs_int and bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          end if;
        when "0111" =>
          if(LEDs_int(4)='0') then
            bit_correct<="00000100";
            LEDs<=not(LEDs_int or bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          else 
            bit_correct<="11111011";
            LEDs<=not(LEDs_int and bit_correct);
            LED_correct<='1';
            LED_detect<='0';
        end if;
        when "1001" =>
          if(LEDs_int(3)='0') then
            bit_correct<="00010000";
            LEDs<=not(LEDs_int or bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          else
            bit_correct<="11101111";
            LEDs<=not(LEDs_int and bit_correct);
            LED_correct<='1';
            LED_detect<='0';
        end if;
        when "1011" =>
          if(LEDs_int(2)='0') then
            bit_correct<="00000010";
            LEDs<=not(LEDs_int or bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          else 
            bit_correct<="11111101";
            LEDs<=not(LEDs_int and bit_correct);
            LED_correct<='1';
            LED_detect<='0';
        end if;
        when "1101" =>
          if(LEDs_int(1)='0') then
            bit_correct<="00000001";
            LEDs<=not(LEDs_int or bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          else
            bit_correct<="11111110";
            LEDs<=not(LEDs_int and bit_correct);
            LED_correct<='1';
            LED_detect<='0';
        end if;
        when "1111" =>
          if(LEDs_int(0)='0') then
            bit_correct<="00001000";
            LEDs<=not(LEDs_int or bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          else
            bit_correct<="11110111";
            LEDs<=not(LEDs_int and bit_correct);
            LED_correct<='1';
            LED_detect<='0';
          end if;
        when others =>
          LEDs<=(others=>'1');
          LED_correct<='1';
          LED_detect<='1';
      end case;
    end if;
  end if;
  end process;
  --LEDs<=LEDs_disp;
  
   
end architecture_decode_ham;
