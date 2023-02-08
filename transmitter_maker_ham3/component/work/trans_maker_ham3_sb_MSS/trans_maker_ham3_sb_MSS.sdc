set_component trans_maker_ham3_sb_MSS
# Microsemi Corp.
# Date: 2023-Feb-03 14:23:08
#

create_clock -period 40 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
