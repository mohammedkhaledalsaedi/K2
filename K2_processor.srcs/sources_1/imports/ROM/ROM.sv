`timescale 1ns / 1ps


module ROM(//parameter n = 8
//input [n-1:0] a,
//output [n-1:0] b,

input logic [3:0]a, output logic [7:0]b
    );


 
    always @(*)
    begin
    
    case (a)
    4'b0000: b = 8'b00001000;
    4'b0001: b = 8'b00011001;
    4'b0010: b = 8'b00100000;
    4'b0011: b = 8'b00010000;
    4'b0100: b = 8'b01110000;
    4'b0101: b = 8'b00000000;
    4'b0110: b = 8'b00010100;
    4'b0111: b = 8'b00000100;
    4'b1000: b = 8'b10110010;

//    4'b1101: b = 8'b1110;
//    4'b1110: b = 8'b1111;
//    4'b1111: b = 8'b0000;    
    default: b = 8'bxxxx;
    
    
    endcase
    
    
    end
endmodule