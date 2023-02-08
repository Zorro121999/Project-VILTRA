set_component receiver_with_ham_sb_MSS
# Microsemi Corp.
# Date: 2023-Feb-07 22:58:25
#

create_clock -period 40 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
