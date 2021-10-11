onerror {quit -f}
vlib work
vlog -work work DataPath.vo
vlog -work work DataPath.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DataPath_vlg_vec_tst
vcd file -direction DataPath.msim.vcd
vcd add -internal DataPath_vlg_vec_tst/*
vcd add -internal DataPath_vlg_vec_tst/i1/*
add wave /*
run -all
