gedit ALU_tb.v
gedit ALU.v
gedit ALU_OR_XOR_AND_5bit.v 
gedit ALU_ADD_5bit.v 
gedit config.json

cd ~/openlane2/designs/alu


iverilog -o alu2op.vvp ALU_tb.v ALU.v ALU_ADD_5bit.v ALU_OR_XOR_AND_5bit.v

vvp alu2op.vvp

gtkwave alu_test.vcd


iverilog -o top.vvp top_tb.v top.v controller.v ALU.v ALU_ADD_5bit.v ALU_OR_XOR_AND_5bit.v
vvp top.vvp
gtkwave top_test.vcd


iverilog -o controller.vvp controller_tb.v controller.v
vvp controller.vvp
gtkwave controller_test.vcd



openlane config.json

openlane config_alu.json

openlane config_top.json

cd runs

RTL Synthesis summary: 
		06-yosys-synthesis/reports
		gedit stat.rpt
		

RTL synthesised design figure:
		cd ..
		xdot hierarchy.dot
		xdot primitive_techmap.dot
		

RTL Floorplan:
		cd ..
		13-openroad-floorplan
		gedit openroad-floorplan.log
		
		
RTL Power report: 
		cd ..
		cd 54-openroad-stapostpnr/nom_tt_025C_1v80
		gedit power.rpt


GDS Layout: 
		cd ..
		cd ..
		final/gds
		klayout ALU.gds
		
Heatmap:
		cd final/odb
		openroad -gui
		
		from menu load odb



	(A | B) ^ (A & B)
___________________________________
	A = 10101
   	B = 11011
A | B 	  = 11111
A & B 	  = 10001
result xor= 01110

CF=ZF=SF= 0


	A ADD B
___________________________

A   =  01101;  // decimal 13  
B   =  00011;  // decimal 3 
Res =  10000   // decimal 16

CF = 0
SF = 1 ; as the MSB is 1
ZF = 0

