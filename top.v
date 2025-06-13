module top
(
    input wire clk, reset,
    output wire [4:0] result,
    output wire gt_zero
);
    wire [4:0] A, B;
    wire OP;
    wire [4:0] R_result;
    wire R_C, R_SF, R_ZF;

    controller controller1 (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .OP(OP)
    );

    ALU datapath1 (
        .A(A),
        .B(B),
        .OP(OP),
        .result(R_result),
        .CF(R_C),
        .SF(R_SF),
        .ZF(R_ZF)
    );

    assign result = R_result;
    assign gt_zero = ~R_ZF;

endmodule
