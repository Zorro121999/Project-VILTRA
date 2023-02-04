set_component mss_proto_rx_sb_FABOSC_0_OSC
# Microsemi Corp.
# Date: 2023-Jan-15 16:39:02
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
