module ALU_ADD_5bit (
    input wire [4:0] A, B,
    output wire [4:0] result,
    output wire CF
);
    wire [5:0] sum = A + B;
    assign result = sum[4:0];
    assign CF = sum[5];
endmodule
