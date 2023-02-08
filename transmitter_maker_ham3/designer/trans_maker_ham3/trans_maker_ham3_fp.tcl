new_project \
         -name {trans_maker_ham3} \
         -location {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\designer\trans_maker_ham3\trans_maker_ham3_fp} \
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
