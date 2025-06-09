module ALU_OR_XOR_AND_5bit (
    input wire [4:0] A, B,
    output wire [4:0] result
);
    assign result = (A | B) ^ (A & B);
endmodule
