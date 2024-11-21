`timescale 1ns / 1ps

module counter_tb;

logic [3:0] D2;
logic [3:0] Q2,Q1;
logic R,clk,load,sub;

//Dregister dut(
//.D(D1),
//.R(R),
//.clk(clk),
//.Q(Q1)
//);

counter dut2(
    .D(D2),
    .R(R),
    .load(load),
    .sub(sub),
    .clk(clk),
    .Q(Q1)
);


nbitcounter dut1(
    .D(D2),
    .R(R),
    .load(load),
    .sub(sub),
    .clk(clk),
    .Q(Q2)
);
initial begin 
clk = 0;

forever #1 clk = ~clk;
end
initial begin 
R = 1;   D2 = 0; load = 1; sub = 0; #3;
R = 1;   D2 =D2+4; load = 0;sub = 1; #3;
R = 1;   D2 = D2+4; load = 0; #10;
R = 1;   D2 = D2+4; load = 0; #10;
R = 1;   D2 = D2+4; load = 0;sub = 0; #10;
R = 1;   D2 = D2+4; load = 0; #10;
R = 1;   D2 = D2+4; load = 1; #10;
$finish;
end

endmodule