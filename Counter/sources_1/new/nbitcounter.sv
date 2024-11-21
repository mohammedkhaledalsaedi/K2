`timescale 1ns / 1ps

module nbitcounter#(parameter n = 4)(
    input [n-1:0] D,
    input clk, R,
    input load,
    input sub,
    output reg [n-1:0] Q

    );
    
    always_ff@(negedge clk, negedge R)
        begin  
            if (R == 0) Q<=0;
            else if (load == 1) Q<=D;
            else if (sub == 1) Q <= Q-1;
            else Q <= Q+1;
        end 
endmodule
