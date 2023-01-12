set_component transmitter_sb_MSS
# Microsemi Corp.
# Date: 2023-Jan-07 23:43:16
#

create_clock -period 80 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
