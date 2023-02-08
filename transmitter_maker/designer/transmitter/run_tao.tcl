set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\component\work\transmitter_sb\transmitter_sb.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\component\work\transmitter\transmitter.vhd}
set_top_level {transmitter}
map_netlist
check_constraints {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\designer\transmitter\synthesis.fdc}
