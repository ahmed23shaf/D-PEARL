include ../syn/libs.mk

export REPORT_DIR			= timingReports
export LOG_DIR				= logs

ifneq      ("$(wildcard saves/top.opted.enc.dat)","")
    export OPT_ENC =    saves/top.opted.enc.dat
else
    export OPT_ENC =    saves/top.routed.enc.dat
endif
ifneq      ("$(wildcard saves/top.finished.enc.dat)","")
    export RES_ENC =    saves/top.finished.enc.dat
else ifneq ("$(wildcard saves/top.opted.enc.dat)","")
    export RES_ENC =    saves/top.opted.enc.dat
else ifneq ("$(wildcard saves/top.routed.enc.dat)","")
    export RES_ENC =    saves/top.routed.enc.dat
else ifneq ("$(wildcard saves/top.placed.enc.dat)","")
    export RES_ENC =    saves/top.placed.enc.dat
endif

.PHONY: pnr
pnr:
	$(MAKE) place <<< 'exit'
	$(MAKE) route <<< 'exit'
	$(MAKE) opt <<< 'exit'
	# $(MAKE) opt <<< 'exit'
	$(MAKE) finish

.PHONY: place
place:
	$(MAKE) clean
	$(MAKE) pre_run
	-innovus -init scripts/innovus_place.tcl |& tee $(LOG_DIR)/top_pnr_place.log
	rm -rf $(REPORT_DIR)
	rm -f  $(PNR_OUT_DIR)/top.pnr.v
	rm -f  $(PNR_OUT_DIR)/top.pnr.sdf
	$(MAKE) post_run

.PHONY: route
route:
	$(MAKE) pre_run
	-innovus -init scripts/innovus_route.tcl |& tee $(LOG_DIR)/top_pnr_route.log
	rm -rf $(REPORT_DIR)
	rm -f  $(PNR_OUT_DIR)/top.pnr.v
	rm -f  $(PNR_OUT_DIR)/top.pnr.sdf
	$(MAKE) post_run

.PHONY: opt
opt:
	$(MAKE) pre_run
	-innovus -init scripts/innovus_opt.tcl |& tee $(LOG_DIR)/top_pnr_opt.log
	$(MAKE) post_run

.PHONY: finish
finish:
	$(MAKE) pre_run
	-innovus -init scripts/innovus_finish.tcl |& tee $(LOG_DIR)/top_pnr_finish.log
	rm -rf VoltusPowerAnalysisResults
	$(MAKE) post_run

.PHONY: restore
restore:
	$(MAKE) pre_run
	-innovus -init scripts/innovus_restore.tcl |& tee $(LOG_DIR)/top_pnr_restore.log
	$(MAKE) post_run

.PHONY: pre_run
pre_run:
	mkdir -p $(REPORT_DIR) $(LOG_DIR) saves

.PHONY: post_run
post_run:
	rm -rf .cadence
	rm -rf .viaViol.*
	rm -f  .nfs*
	rm -f  *.cmd*
	rm -f  *.log*
	rm -f  *.rpt*
	rm -f  AAE_sensitivity.file
	rm -f  rc_model.bin

.PHONY: clean
clean: post_run
	rm -rf $(PNR_OUT_DIR)
	rm -rf $(REPORT_DIR)
	rm -rf $(LOG_DIR)
	rm -rf saves
	rm -rf VoltusPowerAnalysisResults
