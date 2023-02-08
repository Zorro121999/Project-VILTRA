--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: APB_slave_vhdl_ham.vhd
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

entity APB_slave_vhdl_ham is
port (
    --<port_name> : <direction> <type>;
       PCLK : in  STD_LOGIC;
		PENABLE : in  STD_LOGIC;
		PSEL : in  STD_LOGIC;
		PRESETN : in  STD_LOGIC;
		PWRITE : in  STD_LOGIC;
		PWDATA : in  STD_LOGIC_VECTOR (31 downto 0);
        PADDR : in  STD_LOGIC_VECTOR (31 downto 0);
        ham_in : in STD_LOGIC_VECTOR(7 downto 0);
        PRDATA : out STD_LOGIC_VECTOR(31 downto 0);
        data_out : out STD_LOGIC_VECTOR(7 downto 0);
		PREADY : out  STD_LOGIC;
        RD_EN  : out STD_LOGIC
    --<other_ports>;
);
end APB_slave_vhdl_ham;
architecture architecture_APB_slave_vhdl_ham of APB_slave_vhdl_ham is
   -- signal, component etc. declarations
	CONSTANT DATA_WIDTH : INTEGER := 32;
    CONSTANT ADDRESS_OFFSET_WIDTH : INTEGER := 8;

    TYPE registerWord_T IS ARRAY (DATA_WIDTH - 1 DOWNTO 0) OF STD_LOGIC;
    TYPE memoryMappedRegister_T IS ARRAY (0 TO (ADDRESS_OFFSET_WIDTH ** 2) - 1) OF STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
    -- Signal Definitions
    SIGNAL Memory_Mapped_Registers : memoryMappedRegister_T;
    SIGNAL Memory_Mapped_Registers_read : memoryMappedRegister_T;
    
    --signal ham_int : std_logic_vector(7 downto 0);
    --signal read_register : std_logic_vector(31 downto 0);

begin

     -- Can's solution
      Single_Process : PROCESS (PCLK, PRESETn) IS
        VARIABLE PRDATA_V : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
        VARIABLE PREADY_V : STD_LOGIC;
        --VARIABLE PSLVERR_V : STD_LOGIC;
    BEGIN
        IF PRESETn = '0' THEN
            Memory_Mapped_Registers <= (OTHERS => (OTHERS => '0'));
            Memory_Mapped_Registers_read <= (others => (others => '0'));
            PRDATA_V := (OTHERS => '0');
            PREADY_V := '0';
            rd_en <= '0';
            --PSLVERR_V := '0';
        ELSE
            IF rising_edge(PCLK) THEN
                PRDATA_V := (OTHERS => '0');
                PREADY_V := '0';
                rd_en <= '0';
                --PSLVERR_V := '0';
                IF PSEL = '1' THEN
                    IF PENABLE = '1' THEN
                        PREADY_V := '1';
                        IF PWRITE = '1' THEN
                            Memory_Mapped_Registers(TO_INTEGER(unsigned(PADDR(ADDRESS_OFFSET_WIDTH - 1 DOWNTO 0)))) <= PWDATA;
                            rd_en<='1';
                        ELSE -- PWRITE = '0'
                            PRDATA_V := Memory_Mapped_Registers_read(TO_INTEGER(unsigned(PADDR(ADDRESS_OFFSET_WIDTH - 1 DOWNTO 0))));
                        END IF;
                    END IF;
                ELSE
                    Memory_Mapped_Registers_read(TO_INTEGER(unsigned(PADDR(ADDRESS_OFFSET_WIDTH - 1 DOWNTO 0))))<=x"000000"&ham_in;
                END IF;
            END IF;
        END IF;
        PRDATA <= PRDATA_V;
        PREADY <= PREADY_V;
        --PSLVERR <= PSLVERR_V;
    END PROCESS Single_Process;
    data_out<=Memory_Mapped_Registers(TO_INTEGER(unsigned(PADDR(ADDRESS_OFFSET_WIDTH - 1 DOWNTO 0))))(7 downto 0);
    --ham_int<=ham_in;
    
   
   -- architecture body
end architecture_APB_slave_vhdl_ham;
