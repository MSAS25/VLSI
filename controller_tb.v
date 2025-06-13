`timescale 1ns/1ps
module controller_tb;

    reg clk, reset;
    wire [4:0] A, B;
    wire OP;

    controller uut (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .OP(OP)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("controller_test.vcd");
        $dumpvars(0, controller_tb);

        reset = 1;    #15;
        reset = 0;    #70;
        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b", $time, A, B, OP);
    end
endmodule
