set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3_muxptob3.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3_iaddr_reg.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp_pcie_hotreset.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\hdl\APB_slave_vhdl.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\hdl\display_noham.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\hdl\trans_slave_noham.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\work\transmitter_sb\CCC_0\transmitter_sb_CCC_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\work\transmitter_sb\FABOSC_0\transmitter_sb_FABOSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\work\transmitter_sb_MSS\transmitter_sb_MSS.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\components.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\work\transmitter_sb\transmitter_sb.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\component\work\transmitter\transmitter.vhd}
set_top_level {transmitter}
map_netlist
check_constraints {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Projects\ISISA\viltra-neu\Project-VILTRA\transmitter_maker\designer\transmitter\synthesis.fdc}
