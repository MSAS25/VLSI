module ALU (
    input wire [4:0] A, B,
    input wire OP,
    output reg [4:0] result,
    output wire CF,
    output wire SF,
    output wire ZF
);

    wire [4:0] R_OR_XOR_AND, R_ADD;
    wire CF_ADD;

    // Instantiate operation modules
    ALU_OR_XOR_AND_5bit OXA1 (.A(A), .B(B), .result(R_OR_XOR_AND));
    ALU_ADD_5bit ADD1 (.A(A), .B(B), .result(R_ADD), .CF(CF_ADD));

    always @(*) begin
        case (OP)
            1'b0: result = R_OR_XOR_AND;
            1'b1: result = R_ADD;
            default: result = 5'b00000;
        endcase
    end

    assign CF = (OP == 1'b1) ? CF_ADD : 1'b0;
    assign SF = result[4];
    assign ZF = ~|result;

endmodule
