`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 02:56:30 PM
// Design Name: 
// Module Name: fourBitAdder_tb
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


module muxAdder_tb();
    reg [3:0] A, B;
    reg S;
    wire [6:0] disp;
    
    
    muxAdder uut(.A(A), .B(B), .S(S), .disp(disp));
    
    
    initial begin
        A = 4'b0000; B=4'b0000;S = 0;
        #10
        A = 4'b0001; B=4'b0000;S = 0;
        #10
        A = 4'b0010; B=4'b0000;S = 0;
        #10
        A = 4'b0011; B=4'b0000;S = 0;
        #10
        A = 4'b0100; B=4'b0000;S = 0;
        #10
        A = 4'b0101; B=4'b0000;S = 0;
        #10
        A = 4'b1100; B=4'b0001;S = 0;
        #10
        A = 4'b1101; B=4'b0001;S = 0;
        #10
        A = 4'b1110; B=4'b0001;S = 0;
        #10
        A = 4'b1111; B=4'b0001;S = 0;
        #10
        A = 4'b0010; B=4'b0010;S = 0;
        #10
        A = 4'b0011; B=4'b0010;S = 0;
        #10
        A = 4'b0100; B=4'b0010;S = 0;
        #10
        A = 4'b0101; B=4'b0010;S = 0;
        #10
        A = 4'b0110; B=4'b0010;S = 0;
        #10
        A = 4'b0000; B=4'b0000;S = 1;
        #10
        A = 4'b0001; B=4'b0000;S = 1;
        #10
        A = 4'b0010; B=4'b0000;S = 1;
        #10
        A = 4'b0011; B=4'b0000;S = 1;
        #10
        A = 4'b0100; B=4'b0000;S = 1;
        #10
        A = 4'b0101; B=4'b0000;S = 1;
        #10
        A = 4'b1100; B=4'b0001;S = 1;
        #10
        A = 4'b1101; B=4'b0001;S = 1;
        #10
        A = 4'b1110; B=4'b0001;S = 1;
        #10
        A = 4'b1111; B=4'b0001;S = 1;
        #10
        A = 4'b0010; B=4'b0010;S = 1;
        #10
        A = 4'b0011; B=4'b0010;S = 1;
        #10
        A = 4'b0100; B=4'b0010;S = 1;
        #10
        A = 4'b0101; B=4'b0010; S = 1;
        #10
        A = 4'b0110; B=4'b0010;S = 1;
        #10
        A = 4'b0111; B=4'b0010;S = 1;
        #10
        A = 4'b1101; B=4'b0010;S = 1;
        #10
        A = 4'b1110; B=4'b0010;S = 1;
    end

endmodule

