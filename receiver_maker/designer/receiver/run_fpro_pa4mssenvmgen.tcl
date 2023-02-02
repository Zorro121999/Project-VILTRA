set_device \
    -fam SmartFusion2 \
    -die PA4M1000_N \
    -pkg tq144
set_input_cfg \
	-path {C:/Projects/ISISA/viltra-neu/Project-VILTRA/receiver_maker/component/work/receiver_sb_MSS/ENVM.cfg}
set_output_efc \
    -path {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker\designer\receiver\receiver.efc}
set_proj_dir \
    -path {C:\Projects\ISISA\viltra-neu\Project-VILTRA\receiver_maker}
set_is_relative_path \
    -value {FALSE}
set_root_path_dir \
    -path {}
gen_prg -use_init false
