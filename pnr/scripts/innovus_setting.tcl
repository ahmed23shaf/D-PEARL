set_message -no_limit
setMultiCpuUsage -localCpu 4
setLibraryUnit -time 1ns
setLibraryUnit -cap 1pf

# suppressed message
suppressMessage EMS-42
suppressMessage LEFPARS-2502
# NAMESCASESENSITIVE statement is obsolete
suppressMessage LEFPARS-2007
# USEMINSPACING PIN statement is obsolete
suppressMessage LEFPARS-2009
# turn-via is obsolete
suppressMessage LEFPARS-2021
# DIRECTION statement in VIARULE is obsolete
suppressMessage LEFPARS-2022
# Pin '' in macro '' has no ANTENNAGATEAREA value defined
suppressMessage IMPLF-200
# No function defined for cell FILLCAP
suppressMessage TECHLIB-302
# Pin 'VSS' of cell '' is defined in LEF but not in the timing library
suppressMessage IMPVL-159
# Layer M10 specified in the cap table is ignored
suppressMessage IMPEXT-2760
# Via VIA9 specified in the cap table is ignored
suppressMessage IMPEXT-2771
# Basic Cap table for layer M10 is ignored
suppressMessage IMPEXT-2710
# Analysis mode has changed.
suppressMessage IMPOPT-3195
# 'clock' has been applied on hierarchical pin
suppressMessage TCLCMD-1531
# ViaGen have same direction but only orthogonal via is allowed
suppressMessage IMPPP-532
# Clock '' has a source defined at module port
suppressMessage IMPCCOPT-2248
# The SDC clock '' has source pin '', which is an input pin
suppressMessage IMPCCOPT-4144
# Routing configuration for top nets in clock tree '': preferred layers M3-M4 are outside NanoRoute configured layer range
suppressMessage IMPCCOPT-1361
# Instance clkbuf_ (clkbuf) has no static power
suppressMessage VOLTUS_POWR-2152

set init_lef_file "$env(TECH_LEF) $env(LIB_LEF) $env(SRAM_LEF)"

set my_toplevel         top
set init_verilog        $env(SYN_OUT_DIR)/$my_toplevel.gate.v
set init_top_cell 		$my_toplevel
set init_design_netlisttype {Verilog}
set init_design_settop {1}

set extract_shrink_factor {1.0}

set init_pwr_net "VDD"
set init_gnd_net "VSS"

set init_assign_buffer {0}

set init_mmmc_file scripts/innovus_timing.tcl
