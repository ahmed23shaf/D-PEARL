source "scripts/innovus_setting.tcl"

set POWERCAP_CELL  {FILLCAP16A10TR}
set WELLTAP_CELL   {FILLTIE2A10TR}
set TIEHILO_CELL   {TIEHIX1MA10TR TIELOX1MA10TR}

init_design

source "scripts/innovus_modes.tcl"

setDesignMode -topRoutingLayer M9

set core_height 708
set core_width 708

set core_lx [expr (1000-$core_width)/2]
set core_ly [expr ((1000-$core_height)/2)]
set core_ux [expr 1000-((1000-$core_width)/2)]
set core_uy [expr (1000-((1000-$core_height)/2))]

floorplan -b 0 0 1000 1000 74 74 926 926 $core_lx $core_ly $core_ux $core_uy

placeInstance top/example_sram_ [expr $core_lx + 50] [expr $core_ly + 450] MX

createPlaceBlockage -cover -inst top/example_sram_ -outerRingBySide 3.4 2 3.4 2

createRouteBlk -box {0 0 74 1000} -layer {M1 M2 M3 M4 M5 M6}
createRouteBlk -box {0 0 1000 74} -layer {M1 M2 M3 M4 M5 M6}
createRouteBlk -box {0 926 1000 1000} -layer {M1 M2 M3 M4 M5 M6}
createRouteBlk -box {926 0 1000 1000} -layer {M1 M2 M3 M4 M5 M6}

setPinAssignMode -pinEditInBatch true
source "./scripts/pins.tcl"
setPinAssignMode -pinEditInBatch false

connectGlobalNets

addRing \
	-offset {top 3 bottom 3 left 3 right 3} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M9 bottom M9 left M8 right M8} \
	-nets { VSS VDD }
addRing \
	-offset {top 3 bottom 3 left 3 right 3} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M7 bottom M7 left M8 right M8} \
	-nets { VSS VDD }
addRing \
	-offset {top 3 bottom 3 left 3 right 3} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M5 bottom M5 left M6 right M6} \
	-nets { VSS VDD }
addRing \
	-offset {top 3 bottom 3 left 3 right 3} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M3 bottom M3 left M4 right M4} \
	-nets { VSS VDD }
addRing \
	-offset {top 3 bottom 3 left 3 right 3} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M1 bottom M1 left M2 right M2} \
	-nets { VSS VDD }

addRing \
	-offset {top 31 bottom 31 left 31 right 31} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M9 bottom M9 left M8 right M8} \
	-nets { VSS VDD }
addRing \
	-offset {top 31 bottom 31 left 31 right 31} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M7 bottom M7 left M8 right M8} \
	-nets { VSS VDD }
addRing \
	-offset {top 31 bottom 31 left 31 right 31} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M5 bottom M5 left M6 right M6} \
	-nets { VSS VDD }
addRing \
	-offset {top 31 bottom 31 left 31 right 31} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M3 bottom M3 left M4 right M4} \
	-nets { VSS VDD }
addRing \
	-offset {top 31 bottom 31 left 31 right 31} \
	-spacing {top 3 bottom 3 left 3 right 3} \
	-width {top 11 bottom 11 left 11 right 11} \
	-layer {top M1 bottom M1 left M2 right M2} \
	-nets { VSS VDD }

addStripe \
	-width 8 \
	-spacing 2 \
	-set_to_set_distance 20 \
	-layer M8 \
	-direction vertical \
	-stacked_via_bottom_layer M6 \
	-switch_layer_over_obs false \
	-max_same_layer_jog_length 0 \
	-nets { VSS VDD }

addStripe \
	-width 2.3 \
	-spacing 3.7 \
	-set_to_set_distance 12 \
	-layer M7 \
	-direction horizontal \
	-switch_layer_over_obs 0 \
	-max_same_layer_jog_length 0 \
	-start_offset 1.85 \
	-merge_stripes_value auto \
	-nets { VSS VDD }

addStripe \
	-width 1 \
	-spacing 4 \
	-set_to_set_distance 10 \
	-layer M6 \
	-direction vertical \
	-switch_layer_over_obs 0 \
	-max_same_layer_jog_length 0 \
	-start_offset 1 \
	-merge_stripes_value auto \
	-nets { VSS VDD }

addStripe \
	-width 8 \
	-spacing 2 \
	-set_to_set_distance 20 \
	-layer M9 \
	-direction horizontal \
	-stacked_via_bottom_layer M8 \
	-switch_layer_over_obs false \
	-max_same_layer_jog_length 0 \
	-nets { VSS VDD }

sroute -allowJogging 0 -allowLayerChange 0 -crossoverViaLayerRange { M7 M1 } -layerChangeRange { M7 M1 } -nets { VSS VDD }

setEndCapMode -rightEdge $POWERCAP_CELL
setEndCapMode -leftEdge $POWERCAP_CELL
addEndCap -prefix PCap
addWellTap -cell $WELLTAP_CELL -cellInterval 20 -checkerBoard -prefix Tap

setDesignMode -topRoutingLayer M7

place_opt_design

addTieHiLo -cell $TIEHILO_CELL -createHierPort true -reportHierPort true

saveDesign [format "%s%s%s" "saves/" $my_toplevel ".placed.enc"]

saveNetlist $env(PNR_OUT_DIR)/$my_toplevel.pnr.v -includePhysicalCell $INCPHY_CELL -excludeLeafCell -excludeCellInst $EXCPHY_CELL

write_sdf -version 3.0 -min_view fastView -recompute_delay_calc -recompute_parallel_arcs -min_period_edges posedge -setuphold split -splitsetuphold $env(PNR_OUT_DIR)/$my_toplevel.pnr.sdf

win
