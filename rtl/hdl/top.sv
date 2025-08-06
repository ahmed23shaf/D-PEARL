module top (
    input   logic                   top_clk,
    input   logic                   top_reset,

    output  logic                   led
);

            logic                   CLK;
            logic                   GWEN;
            logic   [3:0]           WEN;
            logic   [11:0]          A;
            logic   [31:0]          D;
            logic   [31:0]          Q;

            logic                   CEN;  //chip enable
            logic                   RETN; //retention i.e. not reset
            logic   [2:0]           EMA;  //speed, read the manual

    example_sram example_sram_(
        .*
    );

            logic   [31:0]          counter;

    always_ff @( posedge top_clk ) begin
        if (top_reset) begin
            counter <= '0;
        end else begin
            counter <= counter + 'd1;
        end
    end

    always_comb begin
        CLK = top_clk;
        WEN = {4{counter[12]}};  //active low
        GWEN = counter[12];      //active low
        A = counter[11:0];
        D = counter;
        CEN = 1'b0;              //active low
        RETN = ~top_reset;       //active high
        EMA = '0;                //read the manual

        led = ^Q;
    end

endmodule
