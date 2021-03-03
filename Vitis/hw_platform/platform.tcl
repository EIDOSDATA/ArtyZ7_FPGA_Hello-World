# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\eidos\Vitis\workspace\hw_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\eidos\Vitis\workspace\hw_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {hw_platform}\
-hw {C:\Users\eidos\Vivado\workspace\Hello_World_ArtyZ7\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {C:/Users/eidos/Vitis/workspace}

platform write
platform generate -domains 
platform active {hw_platform}
domain active {zynq_fsbl}
bsp reload
bsp config stdin "ps7_uart_0"
bsp reload
platform generate
platform clean
platform generate
bsp reload
