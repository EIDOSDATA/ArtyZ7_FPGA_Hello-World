# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\eidos\Vitis\workspace\Hello_World_ArtyZ7_system\_ide\scripts\systemdebugger_hello_world_artyz7_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\eidos\Vitis\workspace\Hello_World_ArtyZ7_system\_ide\scripts\systemdebugger_hello_world_artyz7_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/eidos/Vitis/workspace/hw_platform/export/hw_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/eidos/Vitis/workspace/Hello_World_ArtyZ7/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/eidos/Vitis/workspace/Hello_World_ArtyZ7/Debug/Hello_World_ArtyZ7.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
