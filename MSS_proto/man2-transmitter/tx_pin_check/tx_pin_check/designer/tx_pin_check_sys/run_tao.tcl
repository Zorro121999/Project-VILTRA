set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp_pcie_hotreset.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\component\work\tx_pin_check_sys_sb\CCC_0\tx_pin_check_sys_sb_CCC_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\component\work\tx_pin_check_sys_sb\FABOSC_0\tx_pin_check_sys_sb_FABOSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\component\work\tx_pin_check_sys_sb_MSS\tx_pin_check_sys_sb_MSS.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\component\work\tx_pin_check_sys_sb\tx_pin_check_sys_sb.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\component\work\tx_pin_check_sys\tx_pin_check_sys.vhd}
set_top_level {tx_pin_check_sys}
map_netlist
check_constraints {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\designer\tx_pin_check_sys\synthesis.fdc}
