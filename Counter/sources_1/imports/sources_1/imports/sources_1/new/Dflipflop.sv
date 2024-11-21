`timescale 1ns / 1ps

module Dflipflop(
    input D,clk, R,
    output Q,Qb
    );
    
    wire Qm,Qmb;
    
    Dlatch master(.D(D), .R(R), .clk(clk), .Q(Qm), .Qb(Qmb));
    Dlatch slave(.D(Qm), .R(R), .clk(~clk), .Q(Q), .Qb(Qb));
endmodule
