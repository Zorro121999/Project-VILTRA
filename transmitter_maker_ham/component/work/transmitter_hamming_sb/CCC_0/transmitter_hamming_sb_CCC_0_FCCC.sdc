set_component transmitter_hamming_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2023-Feb-07 08:46:00
#

create_clock -period 10 [ get_pins { CCC_INST/CLK0_PAD } ]
create_generated_clock -multiply_by 4 -divide_by 4 -source [ get_pins { CCC_INST/CLK0_PAD } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
