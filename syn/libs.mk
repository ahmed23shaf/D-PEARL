export TSMC65RF=/ece498hk/libs/T65GP_RFMIM_2fF_1P0V_2P5V_1p9m_6X1Z1U_AdbLRDL_OA61_PDK
export TSMC65RF_PDK_IC6=/ece498hk/libs/T65GP_RFMIM_2fF_1P0V_2P5V_1p9m_6X1Z1U_ALRDL_OA61_PDK
export DCROOT=/software/Synopsys-2021_x86_64/syn/R-2020.09-SP4

PDK_HOME					= $(TSMC65RF_PDK_IC6)/stdcell_dig/fb_tsmc065gp_rvt_lvt

export TSMC_DB_DIR			= $(PDK_HOME)/aci/sc-ad10/synopsys

export TSMC_SLOW_NAME		= scadv10_cln65gp_rvt_ss_0p9v_m40c
export TSMC_TYP_NAME		= scadv10_cln65gp_rvt_tt_1p0v_25c
export TSMC_FAST_NAME		= scadv10_cln65gp_rvt_ff_1p1v_m40c
export TSMC_LIB_SLOW		= $(TSMC_DB_DIR)/$(TSMC_SLOW_NAME).lib
export TSMC_LIB_TYP			= $(TSMC_DB_DIR)/$(TSMC_TYP_NAME).lib
export TSMC_LIB_FAST		= $(TSMC_DB_DIR)/$(TSMC_FAST_NAME).lib
export TSMC_DB_SLOW			= $(TSMC_DB_DIR)/$(TSMC_SLOW_NAME).db
export TSMC_DB_TYP			= $(TSMC_DB_DIR)/$(TSMC_TYP_NAME).db
export TSMC_DB_FAST			= $(TSMC_DB_DIR)/$(TSMC_FAST_NAME).db

export SRAM_SLOW_NAME		= example_sram_nldm_ss_0p90v_0p90v_m40c
export SRAM_TYP_NAME		= example_sram_nldm_tt_1p00v_1p00v_25c
export SRAM_FAST_NAME		= example_sram_nldm_ff_1p10v_1p10v_m40c
export SRAM_LIB_SLOW		= ../ip/example_sram/$(SRAM_SLOW_NAME)_syn.lib
export SRAM_LIB_TYP			= ../ip/example_sram/$(SRAM_TYP_NAME)_syn.lib
export SRAM_LIB_FAST		= ../ip/example_sram/$(SRAM_FAST_NAME)_syn.lib
export SRAM_DB_SLOW			= ../ip/example_sram/$(SRAM_SLOW_NAME).db
export SRAM_DB_TYP			= ../ip/example_sram/$(SRAM_TYP_NAME).db
export SRAM_DB_FAST			= ../ip/example_sram/$(SRAM_FAST_NAME).db
export SRAM_LEF				= ../ip/example_sram/example_sram.vclef
export SRAM_GDS             = ../ip/example_sram/example_sram.gds2

export LIB_LEF				= $(PDK_HOME)/aci/sc-ad10/lef/tsmc65_rvt_sc_adv10_macro.lef
export TECH_LEF				= $(PDK_HOME)/aci/sc-ad10/lef/tsmc_cln65_a10_6X2Z_tech.lef
export GDS_LIB				= $(PDK_HOME)/aci/sc-ad10/gds2/tsmc65_rvt_sc_adv10.gds2
export CDL_LIB				= $(PDK_HOME)/aci/sc-ad10/lvs_netlist/tsmc65_rvt_sc_adv10.cdl

export SYN_OUT_DIR			= ../syn/synout
export PNR_OUT_DIR			= ../pnr/pnrout

