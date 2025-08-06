SHELL = /bin/bash -o pipefail
export TSMC65RF_PDK_IC6=/ece498hk/libs/T65GP_RFMIM_2fF_1P0V_2P5V_1p9m_6X1Z1U_ALRDL_OA61_PDK

TOP_TB_SRCS   := $(PWD)/hvl/top_tb.sv      $(PWD)/hvl/example_sram.v $(shell find $(PWD)/hdl/ -name '*.sv')
SYNTH_TB_SRCS := $(PWD)/hvl/top_tb_post.sv $(PWD)/hvl/example_sram.v $(PWD)/../syn/synout/top.gate.v $(TSMC65RF_PDK_IC6)/stdcell_dig/fb_tsmc065gp_rvt_lvt/aci/sc-ad10/verilog/tsmc65_rvt_sc_adv10.v
PNR_TB_SRCS   := $(PWD)/hvl/top_tb_post.sv $(PWD)/hvl/example_sram.v $(PWD)/../pnr/pnrout/top.pnr.v  $(TSMC65RF_PDK_IC6)/stdcell_dig/fb_tsmc065gp_rvt_lvt/aci/sc-ad10/verilog/tsmc65_rvt_sc_adv10.v $(PWD)/hvl/capacitors.sv

export VCS_ARCH_OVERRIDE=linux
VCS_FLAGS      = -full64 -lca -sverilog -timescale=1ps/1ps -debug_acc+all -kdb -debug_access -suppress=LCA_FEATURES_ENABLED -j4 +notimingcheck
VCS_FLAGS_POST = -full64 -lca -sverilog -timescale=1ps/1ps -debug_acc+all -kdb -debug_access -suppress=LCA_FEATURES_ENABLED +neg_tchk -negdelay +compsdf +mindelays +sdfverbose -j4 -fgp

vcs/top_tb: $(TOP_TB_SRCS)
	mkdir -p vcs
	cd vcs && vcs $(TOP_TB_SRCS) $(VCS_FLAGS) -l top_compile.log -o top_tb
	cd vcs && ./top_tb -l top_simulation.log

vcs/synth_tb: $(SYNTH_TB_SRCS)
	mkdir -p vcs
	cd vcs && vcs $(SYNTH_TB_SRCS) $(VCS_FLAGS_POST) +notimingcheck -l synth_compile.log -o synth_tb
	cd vcs && ./synth_tb -l synth_simulation.log

vcs/pnr_tb: $(PNR_TB_SRCS)
	mkdir -p vcs
	cd vcs && vcs $(PNR_TB_SRCS) $(VCS_FLAGS_POST) +notimingcheck -l synth_compile.log -o pnr_tb
	cd vcs && ./pnr_tb -l pnr_simulation.log

.PHONY: verdi
verdi:
	mkdir -p verdi
	cd verdi && $(VERDI_HOME)/bin/verdi -ssf $(PWD)/vcs/dump.fsdb

.PHONY: clean
clean:
	rm -rf vcs verdi
