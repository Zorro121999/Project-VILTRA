set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3_muxptob3.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3_iaddr_reg.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\coreapb3.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp_pcie_hotreset.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\work\receiver_sb\CCC_0\receiver_sb_CCC_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\work\receiver_sb\FABOSC_0\receiver_sb_FABOSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\work\receiver_sb_MSS\receiver_sb_MSS.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\hdl\APB_slave_vhdl.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\hdl\display_noham.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\hdl\trans_slave_noham.vhd}
read_vhdl -mode vhdl_2008 -lib COREAPB3_LIB {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\Actel\DirectCore\CoreAPB3\4.1.100\rtl\vhdl\core\components.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\work\receiver_sb\receiver_sb.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\component\work\receiver\receiver.vhd}
set_top_level {receiver}
map_netlist
check_constraints {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\designer\receiver\synthesis.fdc}
