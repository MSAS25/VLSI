module controller
(
    input wire clk, reset,
    output reg [4:0] A, B,
    output reg OP
);

reg [2:0] pstate, nstate;
parameter [2:0] START = 3'b000,
                ONE   = 3'b001,
                TWO   = 3'b010,
                THREE = 3'b011,
                FINISH = 3'b100;

always @(posedge clk or posedge reset)
begin
    if (reset)
        pstate <= START;
    else
        pstate <= nstate;
end

always @(*)
begin
    A = 5'b00000;
    B = 5'b00000;
    OP = 1'b0;

    nstate = pstate;

    case (pstate)
        START:
            nstate = ONE;
        ONE:
        begin
            A = 5'b10101;
            B = 5'b11011;
            OP = 1'b0; // OR_XOR_AND, result = 01110, gt_zero = 1
            nstate = TWO;
        end
        TWO:
        begin
            A = 5'b01101;
            B = 5'b00011;
            OP = 1'b1; // ADD, result = 10000, gt_zero = 1
            nstate = THREE;
        end
        THREE:
        begin
            A = 5'b11111;
            B = 5'b00001;
            OP = 1'b1; // ADD, result = 00000, CF = 1, gt_zero = 0
            nstate = FINISH;
        end
        FINISH:
        begin    
            nstate = START;
        end
        default: nstate = START;
    endcase
end

endmodule
