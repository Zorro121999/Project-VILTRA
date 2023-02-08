set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3_muxptob3.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3_iaddr_reg.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp_pcie_hotreset.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\hdl\APB_slave_vhdl.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\hdl\decode_ham.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\hdl\receiver_slave_vhdl.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\work\receiver_with_ham_sb\CCC_0\receiver_with_ham_sb_CCC_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\work\receiver_with_ham_sb\FABOSC_0\receiver_with_ham_sb_FABOSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\work\receiver_with_ham_sb_MSS\receiver_with_ham_sb_MSS.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\components.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\work\receiver_with_ham_sb\receiver_with_ham_sb.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\component\work\receiver_with_ham\receiver_with_ham.vhd}
set_top_level {receiver_with_ham}
map_netlist
check_constraints {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\receiver_with_ham\synthesis.fdc}
