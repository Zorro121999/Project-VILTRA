open_project -project {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\designer\receiver\receiver_fp\receiver.pro}
enable_device -name {M2S010} -enable 1
set_programming_file -name {M2S010} -file {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\designer\receiver\receiver.ppd}
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
save_project
close_project
