open_project -project {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\receiver_with_ham\receiver_with_ham_fp\receiver_with_ham.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\receiver_with_ham\receiver_with_ham.map} \
    -header {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\receiver_with_ham\receiver_with_ham.hdr} \
    -spm {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\receiver_with_ham\receiver_with_ham.spm} \
    -dca {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\receiver_with_ham\receiver_with_ham.dca}
export_single_ppd \
    -name {M2S010} \
    -file {C:\Users\user\Documents\ISISA\optical_transmission\receiver_ham\designer\receiver_with_ham\receiver_with_ham.ppd}

save_project
close_project
