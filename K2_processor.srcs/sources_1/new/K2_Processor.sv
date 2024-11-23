`timescale 1ns / 1ps

//K2 Processor module, parametrized to n bits, and has N instructions in the ROM
module K2_Processor#(parameter n,N)(
    input clk,R,        // Clock and Reset as inputs
    output [7:0]ins,    // instrucion loaded from the instruction memory
    output [n-1:0] RA_OUT,RB_OUT,R0_OUT, // Registers RA,RB, and R0
    output  [3:0] counter           //The program counter value

    );

    wire J,JC,D1,D0,Sreg,S2,S1,S0;  // The control bits
    wire [3:0] imm;                 // The immediate value from the instruction
    wire cout;                      //The carry from the ALU
    wire [n-1:0] muxout, muxout2;   // output of the two multiplexers
    wire [n-1:0] ALU;               // the sum from the ALU
    wire carry;                     // Carry from the ALU ANDed with the jump if carry flag
    wire jump;                      // JUmp command that enables the load on the counter
    
    
// Program counter module
nbitcounter#(.n(n), .N(N)) Program_Counter(
        .clk(clk),
        .R(R),
        .load(jump),
        .D(imm),
        .Q(counter)
        );
        
        
// Insruction memory ROM
// ROM = Fibbonacci program
// ROM2 = Data memory test program
// ROM3 = Jump if zero test program
ROM Instruction_Memory(
        .a(counter),
        .b(ins)
        );    

//Assigning each control bit flag to its respective bit from the instruction
assign J = ins[7];
assign JC = ins[6];
assign D1= ins[5];
assign D0 = ins[4];
assign Sreg= ins[3];
assign S2= ins[2];
assign S1= ins[1];
assign S0 = ins[0];
assign imm ={1'b0,S2,S1,S0};


// the decoder and its output
wire [3:0]Dout;
Decoder Decoder(
    .D1(D1),
    .D0(D0),
    .Dout(Dout)
    );
    
    
// the data memory and its output
wire [7:0] dataout;
Datamemory Data_Memory(
    .clk(clk),
    .imm(imm),
    .en(Dout[3]&(~(J|JC))),
    .RA(RA_OUT),
    .dataout(dataout)
    );
    
    
// The first multiplexer that selects between the immediate value and the sum from the ALU
mux #(.n(n))MUX1(
    .Sreg(Sreg),
    .imm(imm),
    .ALU(ALU),
    .muxout(muxout)
    );
    
    
// The second multiplexer that selects between the output of the first mux and
// the output of the data memory
mux2 #(.n(n))MUX2(
    .Sreg(Sreg&J),
    .imm(dataout),
    .ALU(muxout),
    .muxout(muxout2)
    
    );
    
//    wire [3:0] RA_OUT,RB_OUT,R0_OUT;

// Registers RA,RB,And R0
Dregisterbeha#(.n(n)) RA(
    .D(muxout2),
    .en(Dout[0]),
    .clk(clk),
    .R(R),
    .Q(RA_OUT)
    );
Dregisterbeha#(.n(n)) RB(
    .D(muxout2),
    .en(Dout[1]),
    .clk(clk),
    .R(R),
    .Q(RB_OUT)
    ); 
Dregisterbeha#(.n(n)) R0(
    .D(RA_OUT),
    .en(Dout[2]),
    .clk(clk),
    .R(R),
    .Q(R0_OUT)
    );
    
    
//The ALU
ALU #(.n(n))K2ALU(
    .a(RA_OUT),
    .b(RB_OUT),
    .s(S2),
    .sum(ALU),
    .cout(cout)
    );


//The carry register
wire C;
Dregisterbeha#(.n(1)) CoutDFF(
    .D(cout),
    .en(1),
    .clk(clk),
    .R(R),
    .Q(C)
    );
    

// zero = when the output of the ALU = 0
// zero_flag = after 'zero' is enabled, the Zero register stores it's value
// JZ = enables the jump if zero only when the J flag is enabled
    
wire zero_flag,zero,JZ;
assign zero = (ALU == 8'b00000000); 

Dregisterbeha#(.n(1)) ZeroDFF(
    .D(zero),
    .en(1),
    .clk(clk),
    .R(R),
    .Q(zero_flag)
    );
    
// Enables the jump only if either both 
// carry and jump if carry flag are on OR the jump flag is on OR the zero flag is on
// AND the Sreg flag is off
assign carry = C&JC;
assign JZ = zero_flag&J;
assign jump = (JZ | carry | J)&(~Sreg);
    
    
    

    
endmodule
