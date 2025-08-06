source dc_warn.tcl

set hdlin_ff_always_sync_set_reset true
set hdlin_ff_always_async_set_reset true
set hdlin_infer_multibit default_all
set hdlin_check_no_latch true
set hdlin_auto_save_templates true
# set power_enable_minpower true
set_host_options -max_cores 4
set_app_var report_default_significant_digits 6
set design_toplevel top

get_license DC-Ultra-Features
get_license DC-Ultra-Opt

set SynopsysInstall [getenv "DCROOT"]
set search_path [list . \
[format "%s%s" $SynopsysInstall /libraries/syn] \
[format "%s%s" $SynopsysInstall /dw/sim_ver] \
]

set symbol_library [list generic.sdb]
set synthetic_library [list dw_foundation.sldb]

define_design_lib WORK -path ./work

define_name_rules nameRules -restricted "!@#$%^&*()\\-" -case_insensitive

set cell_path [getenv TSMC_DB_DIR]
set search_path [concat $search_path $cell_path]

set alib_library_analysis_path ./

set verilogout_show_unconnected_pins "true"

set target_library [format "%s" [getenv TSMC_DB_FAST]]

set sram_library [getenv SRAM_DB_FAST]

set link_library [concat [concat [concat "*" $target_library] $synthetic_library] $sram_library]

set modules [glob -nocomplain ../rtl/hdl/*.sv]
foreach module $modules {
   puts "analyzing $module"
   analyze -library WORK -format sverilog "${module}"
}

elaborate $design_toplevel
current_design $design_toplevel

set_wire_load_model -name tsmc65_wl10

create_clock -period 1 -name sdc_top_clk top_clk
set_clock_uncertainty 0.3 sdc_top_clk

set_fix_hold sdc_top_clk

# set_input_delay
# set_output_delay

set_max_transition 2 led

set_load -pin_load 2 [all_outputs]

link

compile_ultra -gate_clock -retime

set current_design  $design_toplevel
change_names -rules verilog -hierarchy
change_names -rules nameRules -hierarchy

report_area                      > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.area.rpt"]
report_area -hier                > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.area_hierarchical.rpt"]
report_timing -delay max         > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.setup.rpt"]
report_timing -delay min         > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.hold.rpt"]
report_timing -max_path 50       > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.timing.rpt"]
report_timing_requirement        > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.timing_req.rpt"]
report_constraint                > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.constraint.rpt"]
report_attribute                 > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.attribute.rpt"]
report_constraint -all_violators > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.viol.rpt"]
check_design                     > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.check.rpt"]
report_hierarchy                 > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.hierarchy.rpt"]
report_resources                 > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.resources.rpt"]
report_reference                 > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.reference.rpt"]
report_cell                      > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.cell.rpt"]
report_power -verbose            > [format "%s%s%s%s" [getenv REPORT_DIR] "/" $design_toplevel ".gate.power.rpt"]

write_sdf [format "%s%s%s%s" [getenv SYN_OUT_DIR] "/" $design_toplevel ".gate.sdf"]
write_sdc [format "%s%s%s%s" [getenv SYN_OUT_DIR] "/" $design_toplevel ".gate.sdc"]

write -format verilog -hierarchy -output  [format "%s%s%s%s" [getenv SYN_OUT_DIR] "/" $design_toplevel ".gate.v"]

# start_gui

exit
