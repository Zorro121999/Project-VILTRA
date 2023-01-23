set_component transmitter_sb_FABOSC_0_OSC
# Microsemi Corp.
# Date: 2023-Jan-23 17:39:27
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
