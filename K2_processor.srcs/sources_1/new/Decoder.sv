`timescale 1ns / 1ps

module Decoder(
    input D1,D0,
    output logic [3:0]Dout
    );
    logic [1:0]D;
    assign D={D1,D0};
    always@(*)
    begin
    
    case(D)
        4'b00: Dout = 4'b0001;
        4'b01: Dout = 4'b0010;
        4'b10: Dout = 4'b0100;
        4'b11: Dout = 4'b1000;
        
        default Dout = 4'bxxxx;
        
        endcase
        
        end
    
endmodule
