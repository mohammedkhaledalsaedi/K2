`timescale 1ns / 1ps

module Dregisterbeha(
    input [3:0] D, 
    input clk, R,
    output reg [3:0] Q
    );
    
    always_ff@(negedge clk, negedge R)
        begin
            if (R == 0) Q<=0;
            else Q=D;
        end
endmodule
