open_project -project {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\designer\trans_maker_ham3\trans_maker_ham3_fp\trans_maker_ham3.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\designer\trans_maker_ham3\trans_maker_ham3.map} \
    -header {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\designer\trans_maker_ham3\trans_maker_ham3.hdr} \
    -spm {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\designer\trans_maker_ham3\trans_maker_ham3.spm} \
    -dca {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\designer\trans_maker_ham3\trans_maker_ham3.dca}
export_single_ppd \
    -name {M2S010} \
    -file {C:\Users\user\Documents\ISISA\optical_transmission\transmitter_maker_ham3\designer\trans_maker_ham3\trans_maker_ham3.ppd}

save_project
close_project
