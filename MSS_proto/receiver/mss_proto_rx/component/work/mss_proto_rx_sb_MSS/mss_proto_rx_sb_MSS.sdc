set_component mss_proto_rx_sb_MSS
# Microsemi Corp.
# Date: 2023-Jan-15 16:38:54
#

create_clock -period 40 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
