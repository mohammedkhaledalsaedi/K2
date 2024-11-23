`timescale 1ns / 1ps
localparam n=8;
localparam N=9;
localparam N2 = 50000000;

module K2_Processor_FPGA(
 input wire [15:0] SW,
 output wire [7:0] LED,
  input wire CLK100MHZ,    // using the same name as pin names
  input wire CPU_RESETN,
  output wire CA, CB, CC, CD, CE, CF, CG, DP,
  output wire [7:0] AN,   
  input wire BTNC
);

wire R,clk,clk2;
wire [7:0] Q;
wire [n-1:0] RA,RB,R0;
wire [3:0] counter;
assign R = SW[0];
assign clk = CLK100MHZ;
assign Q = LED[7:0];

nmodclock #(.N(N2)) oneHZclk(
.R(R),
.clk(clk),
.Q(clk2)
);

K2_Processor #(.n(n), .N(N))K2(
    .clk(clk2),
    .R(R),
    .ins(Q),
    .RA_OUT(RA),
    .RB_OUT(RB),
    .R0_OUT(R0),
    .counter(counter)
);

sev_seg_top ssdt(
    .t({4'b1111,counter, R0, RB, RA}),
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

endmodule
