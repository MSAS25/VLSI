ALU:
iverilog -o alu2op.vvp ALU_tb.v ALU.v ALU_ADD_5bit.v ALU_OR_XOR_AND_5bit.v
vvp alu2op.vvp
gtkwave alu_test.vcd

top:
iverilog -o top.vvp top_tb.v top.v controller.v ALU.v ALU_ADD_5bit.v ALU_OR_XOR_AND_5bit.v
vvp top.vvp
gtkwave top_test.vcd

controller:
iverilog -o controller.vvp controller_tb.v controller.v
vvp controller.vvp
gtkwave controller_test.vcd
