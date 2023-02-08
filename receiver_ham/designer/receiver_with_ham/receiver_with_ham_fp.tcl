new_project \
         -name {receiver_with_ham} \
         -location {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\receiver_with_ham\receiver_with_ham_fp} \
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
