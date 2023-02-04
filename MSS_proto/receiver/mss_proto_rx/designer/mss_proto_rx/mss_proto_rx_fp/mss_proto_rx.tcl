open_project -project {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\designer\mss_proto_rx\mss_proto_rx_fp\mss_proto_rx.pro}
enable_device -name {M2S010} -enable 1
set_programming_file -name {M2S010} -file {C:\Projects\ISISA\Project-VILTRA\MSS_proto\receiver\mss_proto_rx\designer\mss_proto_rx\mss_proto_rx.ppd}
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
save_project
close_project
