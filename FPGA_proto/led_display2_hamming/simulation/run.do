quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/user/Documents/ISISA/optical_transmission/led_display2_hamming"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microchip/Libero_SoC_v2022.2/Designer/lib/modelsimpro/precompiled/vlog/SmartFusion2"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/disp2_ham.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/disp2_ham_test.vhd"

vsim -L SmartFusion2 -L presynth  -t 1fs presynth.disp2_ham_test
add wave /disp2_ham_test/*
run 1000ns
