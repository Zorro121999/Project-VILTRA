new_project \
         -name {transmitter} \
         -location {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\designer\transmitter\transmitter_fp} \
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
