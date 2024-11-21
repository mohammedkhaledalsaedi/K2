`timescale 1ns / 1ps


module ROM(
input wire [3:0]a, output reg [3:0]b
    );
wire [3:0] SW;
//assign a[3:0]=SW[3:0];

//assign a[3:0] = SW[7:4];
    

 
    always @(*)
    begin
    
    case (a)
    4'b0000: b = 4'b0001;
    4'b0001: b = 4'b0010;
    4'b0010: b = 4'b0011;
    4'b0011: b = 4'b0100;
    4'b0100: b = 4'b0101;
    4'b0101: b = 4'b0110;
    4'b0110: b = 4'b0111;
    4'b0111: b = 4'b1000;
    4'b1000: b = 4'b1001;
    4'b1001: b = 4'b1010;
    4'b1010: b = 4'b1011;
    4'b1011: b = 4'b1100;
    4'b1100: b = 4'b1101;
    4'b1101: b = 4'b1110;
    4'b1110: b = 4'b1111;
    4'b1111: b = 4'b0000;    
    default: b = 4'bxxxx;
    
    
    endcase
    
    
    end
endmodule
