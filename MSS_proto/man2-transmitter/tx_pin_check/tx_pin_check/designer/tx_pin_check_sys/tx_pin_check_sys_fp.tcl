new_project \
         -name {tx_pin_check_sys} \
         -location {C:\Projects\ISISA\Project-VILTRA\MSS_proto\man2-transmitter\tx_pin_check\tx_pin_check\designer\tx_pin_check_sys\tx_pin_check_sys_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
