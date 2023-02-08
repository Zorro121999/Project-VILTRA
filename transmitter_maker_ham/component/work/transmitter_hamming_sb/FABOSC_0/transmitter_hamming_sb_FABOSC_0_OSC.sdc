set_component transmitter_hamming_sb_FABOSC_0_OSC
# Microsemi Corp.
# Date: 2023-Feb-07 08:46:02
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
