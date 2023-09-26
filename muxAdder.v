`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 01:36:42 PM
// Design Name: 
// Module Name: 2to1mux8bitAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module muxAdder(A, B, S, disp);
    input [3:0] A, B;
    input S;
    output [6:0] disp;
    
    //internal variables
    wire [3:0]SUM;
    wire CI;
    wire Cout;
    wire [3:0] val;
    assign CI = 0;
    
    fourBit uut0(.A(A), .B(B), .CI (CI), .SUM (SUM), .CO (Cout));
    mux uut1(.S(S), .Cout(Cout), .SUM(SUM), .val(val));
    
    sevenSeg uut2(.SUM(val), .display(disp));
    
endmodule

module oneBit(
    input A,
    input B,
    input CI,
    output  SUM,
    output  CO
    );
    
   assign CO = CI & (A | B) | (A & B);
   assign SUM = (CI ^ B ^ A) | (A & B & CI); 
endmodule

module fourBit(
    input [3:0] A,
    input [3:0] B,
    input CI,
    output [3:0] SUM,
    output CO
    );
    
    wire [3:0] cOut;
    
    oneBit add0(.A(A[0]), .B(B[0]), .CI (CI), .SUM (SUM[0]), .CO (cOut[0]));
    oneBit add1(.A(A[1]), .B(B[1]), .CI (cOut[0]), .SUM (SUM[1]), .CO (cOut[1]));
    oneBit add2(.A(A[2]), .B(B[2]), .CI (cOut[1]), .SUM (SUM[2]), .CO (cOut[2]));
    oneBit add3(.A(A[3]), .B(B[3]), .CI (cOut[2]), .SUM (SUM[3]), .CO (CO));
    
endmodule


module sevenSeg(SUM, display);
    input [3:0] SUM;
    output [6:0] display;
    reg [6:0] disp;
    
    always @ (SUM)
       begin
         case (SUM)
            4'b0000: disp = 7'b1000000; //0
            4'b0001: disp = 7'b1111001; //1
            4'b0010: disp = 7'b0100100; //2
            4'b0011: disp = 7'b0110000;//3
            4'b0100: disp = 7'b0011001; //4
            4'b0101: disp = 7'b0010010; //5
            4'b0110: disp = 7'b0000010; //6
            4'b0111: disp = 7'b1111000; //7
            4'b1000: disp = 7'b0000000; //8
            4'b1001: disp = 7'b0011000; //9
            4'b1010: disp = 7'b1000000; //10
            4'b1011: disp = 7'b1000000; //11
            4'b1100: disp = 7'b1000000; //12
            4'b1101: disp = 7'b1000000; //13
            4'b1110: disp = 7'b1000000; //14
            4'b1111: disp = 7'b1000000; //15
         endcase
       end
     
     assign display = disp;

endmodule

module mux(input S, input Cout, input [3:0] SUM, output reg [3:0] val);
        always @ (S, Cout)
        if(S)
            begin
             if (!Cout)
                val = 4'b0000;
             else
                val = 4'b0001;   
            end
        else
            val = SUM;
endmodule
