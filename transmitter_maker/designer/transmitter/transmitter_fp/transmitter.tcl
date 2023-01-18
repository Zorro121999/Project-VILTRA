open_project -project {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\designer\transmitter\transmitter_fp\transmitter.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\designer\transmitter\transmitter.map} \
    -header {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\designer\transmitter\transmitter.hdr} \
    -spm {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\designer\transmitter\transmitter.spm} \
    -dca {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\designer\transmitter\transmitter.dca}
export_single_ppd \
    -name {M2S010} \
    -file {C:\Users\user\Documents\ISISA\optical_transmission\Project-VILTRA\transmitter_maker\designer\transmitter\transmitter.ppd}

save_project
close_project
