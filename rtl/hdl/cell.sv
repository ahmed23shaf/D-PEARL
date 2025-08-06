import rl_types::*;

module cell (
    input edge_vec in,

    // Traceback
    input logic    tb_shift_en,
    input edge_vec tb_left,
    input edge_vec tb_tl,
    input edge_vec tb_top,

    // Indel, Substituition delays
    input logic                   indel_shift_en,
    input logic [DELAY_WIDTH-1:0] indel_shift,
    
    input logic                   sub_shift_en,
    input logic [DELAY_WIDTH-1:0] sub_shift,

    output edge_vec out
);

    // TODO: Path reconstruction
    // IN:  in, tb_shift_en, tb_shift
    // OUT: tb

    // TODO: Saturating counter
    // IN: START (output of arrival OR)
    // OUT: ctr

    // TODO: other logic...

endmodule : cell
