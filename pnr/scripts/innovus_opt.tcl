source "scripts/innovus_setting.tcl"

restoreDesign $env(OPT_ENC) $my_toplevel

source "scripts/innovus_modes.tcl"

setExtractRCMode -engine postRoute

optDesign -postRoute -drv -setup -hold

saveDesign [format "%s%s%s" "saves/" $my_toplevel ".opted.enc"]

saveNetlist $env(PNR_OUT_DIR)/$my_toplevel.pnr.v -includePhysicalCell $INCPHY_CELL -excludeLeafCell -excludeCellInst $EXCPHY_CELL

write_sdf -version 3.0 -min_view fastView -recompute_delay_calc -recompute_parallel_arcs -min_period_edges posedge -setuphold split -splitsetuphold $env(PNR_OUT_DIR)/$my_toplevel.pnr.sdf

win
