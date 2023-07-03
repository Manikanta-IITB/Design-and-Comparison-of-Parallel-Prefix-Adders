`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2023 01:33:38
// Design Name: 
// Module Name: KSadder_tb
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


module KSadder_tb;
reg [15:0] A,B;
reg Cin,clk;
wire [15:0] Sum;
wire Cout;


KSadder DUT(A,B,Cin,clk,Sum,Cout);


always #5 clk = ~ clk;

initial
begin
clk=1'b0;
#10 A=16'h0000; B=16'h1111; Cin=1'b0;
#10 A=16'h1111; B=16'h0000; Cin=1'b0;
#10 A=16'h0101; B=16'h0000; Cin=1'b1;
#10 A=16'hffff; B=16'hffff; Cin=1'b0;
#10 A=16'hffff; B=16'hffff; Cin=1'b1;
#10 A=16'hffff; B=16'h0000; Cin=1'b0;
#10 A=16'hffff; B=16'h0000; Cin=1'b1;
#500 $finish;
end

endmodule
