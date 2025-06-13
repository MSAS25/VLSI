`timescale 1ns/1ps
module top_tb;

    reg clk, reset;
    wire [4:0] result;
    wire gt_zero;

    top uut (
        .clk(clk),
        .reset(reset),
        .result(result),
        .gt_zero(gt_zero)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("top_test.vcd");
        $dumpvars(0, top_tb);

        reset = 1;  #15;
        reset = 0;  #80;
        $finish;
    end

    initial begin
        $monitor("Time=%0t result=%b gt_zero=%b", $time, result, gt_zero);
    end
endmodule
