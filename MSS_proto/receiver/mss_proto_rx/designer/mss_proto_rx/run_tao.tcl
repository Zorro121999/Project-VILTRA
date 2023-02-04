set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp_pcie_hotreset.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\component\Actel\DirectCore\CoreResetP\7.1.100\rtl\vhdl\core\coreresetp.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\component\work\mss_proto_rx_sb\CCC_0\mss_proto_rx_sb_CCC_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\component\work\mss_proto_rx_sb\FABOSC_0\mss_proto_rx_sb_FABOSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\component\work\mss_proto_rx_sb_MSS\mss_proto_rx_sb_MSS.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\component\work\mss_proto_rx_sb\mss_proto_rx_sb.vhd}
read_vhdl -mode vhdl_2008 {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\component\work\mss_proto_rx\mss_proto_rx.vhd}
set_top_level {mss_proto_rx}
map_netlist
check_constraints {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\designer\mss_proto_rx\synthesis.fdc}
