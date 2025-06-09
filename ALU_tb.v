`timescale 1ns/1ps
module ALU_tb;

    reg [4:0] A, B;
    reg OP;
    wire [4:0] R;
    wire CF, SF, ZF;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .result(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );

    initial begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0, ALU_tb);

        A = 5'b10101; B = 5'b11011; OP = 1'b0; #10;  // OR_XOR_AND
        A = 5'b01101; B = 5'b00011; OP = 1'b1; #10;  // ADD

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b ZF=%b SF=%b",
                  $time, A, B, OP, R, CF, ZF, SF);
    end

endmodule
