--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: APB_slave_vhdl.vhd
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

entity APB_slave_vhdl is
port (
    --<port_name> : <direction> <type>;
	    PCLK : in  STD_LOGIC;
		PENABLE : in  STD_LOGIC;
		PSEL : in  STD_LOGIC;
		PRESETN : in  STD_LOGIC;
		PWRITE : in  STD_LOGIC;
		PWDATA : in  STD_LOGIC_VECTOR (7 downto 0);
		PADDR : in  STD_LOGIC_VECTOR (7 downto 0);
		PREADY : out  STD_LOGIC;
        RD_EN  : out STD_LOGIC
		--PSLVERR : out  STD_LOGIC;
);
end APB_slave_vhdl;
architecture architecture_APB_slave_vhdl of APB_slave_vhdl is
   -- signal, component etc. declarations
	signal fsm : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal rd_enable : STD_LOGIC;

begin

   fab_slave_copy : process(pclk,presetn)
   begin
   if(rising_edge(pclk)) then
     if(presetn='0') then
       pready<='1';
       rd_enable<='1';
     else
       case fsm is
				when "00" =>
					if (PSEL='0') then --slave it not selected
						fsm <= "00";
					else
						if (PADDR = "00000100") then  --address where master puts data
							fsm <= "01";
							if (PWRITE='0') then    --if PWRITE is 1, the bus is ready for writing data
								rd_enable <= '1';
								PREADY <= '1';
							else
								rd_enable <= '0';  --signal goes low to indicate that is ready to get new data 
								PREADY <= '0';
							end if;
						else
							fsm <= "00";
						end if;
					end if; 
				when "01" =>
					rd_enable <= '1';
					if (PWRITE='1') then
						fsm <= "00";
						PREADY <= '1';
					else
						fsm <= "10";
						PREADY <= '0';
					end if;
                when "10" =>
					fsm <= "11";
                    PREADY <= '1';
				when others =>	
					fsm <= "00";
                    rd_enable <= '0';
				end case;
        end if;
		
	end if;
	end process;

	RD_EN <= rd_enable;
    
    --fab_slave_own : process(pclk,presetn)
    --begin
    --if(rising_edge(pclk)) then
      --if(presetn='0') then
        --pready<='1';
        --rd_enable<='0';
      --else
        --if(PSEL<='0') then
          --rd_enable<='0';
        --else
          --if(PADDR=x"00000000" and PWRITE='1') then --slave will read data when it is selected,
            --rd_enable<='1';                         --, the bus address where the data is located is selected
          --else                                      -- and a write transfer is indicated
            --rd_enable<='0';
          --end if;
        --end if;
       --end if;
    --end if;
end architecture_APB_slave_vhdl;
