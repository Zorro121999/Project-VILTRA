set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3_muxptob3.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3_iaddr_reg.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp_pcie_hotreset.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\work\trans_maker_ham3_sb\CCC_0\trans_maker_ham3_sb_CCC_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\work\trans_maker_ham3_sb\FABOSC_0\trans_maker_ham3_sb_FABOSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\work\trans_maker_ham3_sb_MSS\trans_maker_ham3_sb_MSS.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\hdl\APB_slave_vhdl_ham.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\hdl\display_ham.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\hdl\trans_slave_ham.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\components.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\work\trans_maker_ham3_sb\trans_maker_ham3_sb.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\component\work\trans_maker_ham3\trans_maker_ham3.vhd}
set_top_level {trans_maker_ham3}
map_netlist
check_constraints {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\designer\trans_maker_ham3\synthesis.fdc}
