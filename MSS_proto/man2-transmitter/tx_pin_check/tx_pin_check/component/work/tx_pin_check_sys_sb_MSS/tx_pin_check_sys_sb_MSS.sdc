set_component tx_pin_check_sys_sb_MSS
# Microsemi Corp.
# Date: 2023-Jan-14 10:20:11
#

create_clock -period 40 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
