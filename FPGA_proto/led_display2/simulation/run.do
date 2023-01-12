quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/user/Documents/ISISA/optical_transmission/led_display2"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microchip/Libero_SoC_v2022.2/Designer/lib/modelsimpro/precompiled/vlog/SmartFusion2"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/led_counter.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/transmit_fabric_test.vhd"

vsim -L SmartFusion2 -L presynth  -t 1fs presynth.transmit_fabric_test
add wave /transmit_fabric_test/*
run 1000ns
