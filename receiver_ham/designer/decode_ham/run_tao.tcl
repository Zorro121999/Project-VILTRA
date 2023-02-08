set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\hdl\decode_ham.vhd}
set_top_level {decode_ham}
map_netlist
check_constraints {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\decode_ham\synthesis.fdc}
