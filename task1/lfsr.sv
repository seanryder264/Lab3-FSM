module lfsr(
    input   logic       clk,
    input   logic       rst,
    input   logic       en,
    output  logic [3:0] data_out
);

logic [4:1] sreg;

always_ff @ (posedge clk, posedge rst)
    if (en)
        if (rst)
            sreg <= 4'b1;
        else 
            sreg <= {sreg[3:1], sreg[4] ^ sreg[3]};
    else
        sreg <= sreg;

assign data_out[3:0] = sreg;
endmodule
