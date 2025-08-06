create_constraint_mode -name constraint_default -sdc_files $env(SYN_OUT_DIR)/$my_toplevel.gate.sdc

#create_rc_corner -name rctypical -cap_table files/tsmc65.capTbl
create_rc_corner -name rctypical -qx_tech_file files/qrc.tch

create_library_set -name slowLib -timing [list "$env(TSMC_LIB_SLOW)" "$env(SRAM_LIB_SLOW)"]
create_delay_corner -name slowDC -library_set slowLib -rc_corner rctypical
create_analysis_view -name slowView -constraint_mode constraint_default -delay_corner slowDC

create_library_set -name typLib -timing [list "$env(TSMC_LIB_TYP)" "$env(SRAM_LIB_TYP)"]
create_delay_corner -name typDC -library_set typLib -rc_corner rctypical
create_analysis_view -name typView -constraint_mode constraint_default -delay_corner typDC

create_library_set -name fastLib -timing [list "$env(TSMC_LIB_FAST)" "$env(SRAM_LIB_FAST)"]
create_delay_corner -name fastDC -library_set fastLib -rc_corner rctypical
create_analysis_view -name fastView -constraint_mode constraint_default -delay_corner fastDC

set_analysis_view -setup {fastView} -hold {fastView}
#set_analysis_view -setup {slowView} -hold {fastView}
