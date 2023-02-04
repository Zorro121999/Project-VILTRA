new_project \
         -name {mss_proto_rx} \
         -location {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\designer\mss_proto_rx\mss_proto_rx_fp} \
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
