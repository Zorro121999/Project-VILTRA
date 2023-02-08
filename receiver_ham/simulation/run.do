quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/user/Documents/ISISA/optical_transmission/receiver_ham"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microchip/Libero_SoC_v2022.2/Designer/lib/modelsimpro/precompiled/vlog/SmartFusion2"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/decode_ham.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/test_decode_ham.vhd"

vsim -L SmartFusion2 -L presynth  -t 1fs presynth.test_decode_ham
add wave /test_decode_ham/*
run 1000ns
