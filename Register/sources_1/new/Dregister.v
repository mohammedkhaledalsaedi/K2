`timescale 1ns / 1ps

module Dregister(
    input [3:0] D,
    input clk, R,
    output [3:0] Q

    );
    
    wire [3:0] Qb;
    
    Dflipflop FF0(.D(D[0]), .clk(clk), .R(R), .Q(Q[0]), .Qb(Qb[0]));
    Dflipflop FF1(.D(D[1]), .clk(clk), .R(R), .Q(Q[1]), .Qb(Qb[1]));
    Dflipflop FF2(.D(D[2]), .clk(clk), .R(R), .Q(Q[2]), .Qb(Qb[2]));
    Dflipflop FF3(.D(D[3]), .clk(clk), .R(R), .Q(Q[3]), .Qb(Qb[3]));
endmodule
