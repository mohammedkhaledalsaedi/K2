`timescale 1ns / 1ps

module Dlatch_tb;

logic [3:0]D;
logic R,clk;
logic [3:0]Q;




Dregister dut(
.D(D),
.R(R),
.clk(clk),
.Q(Q)
);

initial begin 
clk = 0;
forever #1 clk = ~clk;
end
initial begin 
R = 1;  D = 4'b0000; #2;
R = 1;  D = 4'b0001; #2;
R = 1;  D = D; #2;
R = 0;  D = D; #10;
$finish;
end

endmodule
