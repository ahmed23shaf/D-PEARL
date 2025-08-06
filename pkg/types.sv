package rl_types;

    parameter int NUM_SYMBOLS = 4
    parameter int SEQ_LEN = 5;
    parameter int MAX_DELAY = 31;

    parameter int SYMBOL_WIDTH = $clog2(NUM_SYMBOLS);
    parameter int DELAY_WIDTH = $clog2(MAX_DELAY);

    typedef struct packed {
        logic   hor;    // Either Left or Right
        logic   diag;   // Top left or bottom right
        logic   ver;    // Top or bottom
    } edge_vec;

endpackage : rl_types