source "scripts/innovus_setting.tcl"

restoreDesign [format "%s%s%s" "saves/" $my_toplevel ".opted.enc.dat"] $my_toplevel

source "scripts/innovus_modes.tcl"

setExtractRCMode -engine postRoute

connectGlobalNets

addFiller -cell $FILLCAP_CELL -prefix Fill -fitGap -merge true -diffCellViol true
verifyGeometry
addFiller -cell $FILLCAP_CELL -prefix Fill -fitGap -fixDRC -merge true -diffCellViol true
verifyGeometry
addFiller -cell $FILLCAP_CELL -prefix Fill -fitGap -fixDRC -merge true -diffCellViol true
verifyGeometry -report $env(REPORT_DIR)/geometry.rpt

connectGlobalNets

verifyConnectivity -type all -noAntenna -report $env(REPORT_DIR)/connectivity.rpt
verify_drc -report $env(REPORT_DIR)/drc.rpt

set_analysis_view -setup {fastView} -hold {slowView}
timeDesign -numPaths 500 -expandedViews -postRoute
timeDesign -numPaths 500 -expandedViews -postRoute -hold
timeDesign -numPaths 500 -expandedViews -postRoute -drvReports
set_analysis_view -setup {slowView} -hold {fastView}
timeDesign -numPaths 500 -expandedViews -postRoute
timeDesign -numPaths 500 -expandedViews -postRoute -hold
timeDesign -numPaths 500 -expandedViews -postRoute -drvReports
set_analysis_view -setup {fastView} -hold {fastView}
timeDesign -numPaths 500 -postRoute
timeDesign -numPaths 500 -postRoute -hold
timeDesign -numPaths 500 -postRoute -drvReports

#defOut -routing -floorplan final.def

streamOut $env(PNR_OUT_DIR)/innovus.gdsii -mapFile "files/tsmc065.map" -libName DesignLib -merge [format "%s %s" "/ece498hk/libs/TSMC65GP_RFMIM__1P0V_2P5V__1p9m_6X1Z1U_ALRDL/stdcell_dig/fb_tsmc065gp_rvt_lvt/aci/sc-ad10/gds2/tsmc65_rvt_sc_adv10.gds2" $env(SRAM_GDS)] -stripes 1 -mode ALL

saveNetlist $env(PNR_OUT_DIR)/$my_toplevel.pnr.v -includePhysicalCell $INCPHY_CELL -excludeLeafCell -excludeCellInst $EXCPHY_CELL

write_sdf -version 3.0 -min_view fastView -recompute_delay_calc -recompute_parallel_arcs -min_period_edges posedge -setuphold split -splitsetuphold $env(PNR_OUT_DIR)/$my_toplevel.pnr.sdf

saveDesign [format "%s%s%s" "saves/" $my_toplevel ".finished.enc"]

win
