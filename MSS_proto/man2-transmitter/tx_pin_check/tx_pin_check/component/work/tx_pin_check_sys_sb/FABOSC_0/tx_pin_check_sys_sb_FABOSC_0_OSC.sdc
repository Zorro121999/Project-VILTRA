set_component tx_pin_check_sys_sb_FABOSC_0_OSC
# Microsemi Corp.
# Date: 2023-Jan-14 10:20:20
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
