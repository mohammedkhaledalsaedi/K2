`timescale 1ns / 1ps

module K2_Processor_TB;
localparam n=8;
localparam N=9;
logic clk,R;
logic [7:0] Q;
logic [n-1:0] RA,RB,R0;

K2_Processor #(.n(n), .N(N))K2(
    .clk(clk),
    .R(R),
    .ins(Q),
    .RA_OUT(RA),
    .RB_OUT(RB),
    .R0_OUT(R0)
    );
    
initial begin 
clk = 0;

forever #1 clk = ~clk;
end
initial begin 
R = 0;
#2 
R = 1;    
#1000
$finish;
end

endmodule
