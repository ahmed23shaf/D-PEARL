set name example_sram

read_lib  [format "%s%s" $name "_nldm_ff_1p10v_1p10v_0c_syn.lib"]
write_lib [format "%s%s" $name "_nldm_ff_1p10v_1p10v_0c"]
read_lib  [format "%s%s" $name "_nldm_ff_1p10v_1p10v_125c_syn.lib"]
write_lib [format "%s%s" $name "_nldm_ff_1p10v_1p10v_125c"]
read_lib  [format "%s%s" $name "_nldm_ff_1p10v_1p10v_m40c_syn.lib"]
write_lib [format "%s%s" $name "_nldm_ff_1p10v_1p10v_m40c"]
read_lib  [format "%s%s" $name "_nldm_ss_0p90v_0p90v_125c_syn.lib"]
write_lib [format "%s%s" $name "_nldm_ss_0p90v_0p90v_125c"]
read_lib  [format "%s%s" $name "_nldm_ss_0p90v_0p90v_m40c_syn.lib"]
write_lib [format "%s%s" $name "_nldm_ss_0p90v_0p90v_m40c"]
read_lib  [format "%s%s" $name "_nldm_tt_1p00v_1p00v_25c_syn.lib"]
write_lib [format "%s%s" $name "_nldm_tt_1p00v_1p00v_25c"]

exit