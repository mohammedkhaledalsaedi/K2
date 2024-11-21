`timescale 1ns / 1ps

module Dreg_tb_sev(

  input wire [9:0] SW,
  input wire CLK100MHZ,    // using the same name as pin names
  input wire CPU_RESETN,
  output wire CA, CB, CC, CD, CE, CF, CG, DP,
  output wire [7:0] AN,   
  input wire BTNC
);
wire [3:0]D1, D2;
wire [3:0]Q1, Q2;
wire R,clk;
assign Q1 = 4'b0000;
assign Q2 = 4'b0000;
assign D1 = SW[3:0];
assign D2 = SW[7:4];
assign R =SW[8];
assign clk = BTNC;

sev_seg_top ssdt(
    .t({4'b0000,4'b0000, Q1, Q2}),
    .CLK100MHZ(CLK100MHZ),
    .CPU_RESETN(CPU_RESETN),
    .CA(CA),
    .CB(CB),
    .CC(CC),
    .CD(CD),
    .CE(CE),
    .CF(CF),
    .CG(CG),
    .AN(AN)
);


Dregister dut(
.D(D1),
.R(R),
.clk(clk),
.Q(Q1)
);

Dregisterbeha dut2(
    .D(D1),
    .R(R),
    .clk(clk),
    .Q(Q2)
);



//initial begin 
//clk = 0;
//forever #1 clk = ~clk;
//end
//initial begin 
//R = 1;  D1 = 4'b0000; D2 = 4'b0000; #10;
//R = 1;  D1 = 4'b0001; D2 =4'b0001; #10;
//R = 1;  D1 = 4'b0010; D2 = 4'b0010; #10;
//R = 0;  D1 = 4'b1010; D2 = 4'b1010; #10;
//$finish;
//end

endmodule
