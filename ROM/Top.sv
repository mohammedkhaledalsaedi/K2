`timescale 1ns / 1ps

module Top(
    input wire [9:0] SW,
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN   

    ); 
//wire [3:0] result; 
//wire cout;
wire [3:0]a;
wire [3:0]b;

assign a = SW[3:0];
//assign b = SW[7:4];
//assign s0 = SW[8];
//assign s1 = SW[9];

//ALU alu(
//    .a(a),
//    .b(b),
//    .s0(s0),
//    .s1(s1),
//    .result(result),
//    .cout(cout)
//);

sev_seg_top ssdt(
    .t(4'b0000, 4'b0000, b, a),
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



ROM G1(
.b(b), .a(a)

);



endmodule
