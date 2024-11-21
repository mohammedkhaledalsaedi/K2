`timescale 1ns / 1ps

module Dreg_tb;

logic [3:0]D1, D2 ;
logic [3:0]Q1, Q2;
logic R,clk;




Dregister dut(
.D(D1),
.R(R),
.clk(clk),
.Q(Q1)
);

Dregisterbeha dut2(
    .D(D2),
    .R(R),
    .clk(clk),
    .Q(Q2)
);

initial begin 
clk = 0;
forever #1 clk = ~clk;
end
initial begin 
R = 1;  D1 = 4'b0000; D2 = 4'b0000; #10;
R = 1;  D1 = 4'b0001; D2 =4'b0001; #10;
R = 1;  D1 = 4'b0010; D2 = 4'b0010; #10;
R = 0;  D1 = 4'b1010; D2 = 4'b1010; #10;
$finish;
end

endmodule
