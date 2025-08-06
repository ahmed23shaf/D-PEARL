import rl_types::*;

module seq_buffer (
    input logic                     shift_en,
    input logic [SYMBOL_WIDTH-1:0]  symbol_in,

    output logic [SYMBOL_WIDTH-1:0] seq[SEQ_LEN]
);
    // SIPO logic

endmodule : seq_buffer