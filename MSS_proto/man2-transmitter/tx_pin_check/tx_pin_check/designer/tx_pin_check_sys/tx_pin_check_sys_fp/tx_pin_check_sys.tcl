open_project -project {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\designer\tx_pin_check_sys\tx_pin_check_sys_fp\tx_pin_check_sys.pro}
enable_device -name {M2S010} -enable 1
set_programming_file -name {M2S010} -file {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\designer\tx_pin_check_sys\tx_pin_check_sys.ppd}
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
save_project
close_project
