`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2023 23:16:39
// Design Name: 
// Module Name: LFadder_tb
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

module LFadder_tb;
reg [15:0] A,B;
reg cin,clk;
wire [15:0] sum;
wire cout;


LFadder DUT(clk,A,B,cin,sum,cout);


always #5 clk = ~ clk;

initial
begin
clk=1'b0;
#10 A=16'h0000; B=16'h1111; cin=1'b0;
#10 A=16'h1111; B=16'h0000; cin=1'b0;
#10 A=16'h0101; B=16'h0000; cin=1'b1;
#10 A=16'hffff; B=16'hffff; cin=1'b0;
#10 A=16'hffff; B=16'hffff; cin=1'b1;
#10 A=16'hffff; B=16'h0000; cin=1'b0;
#10 A=16'hffff; B=16'h0000; cin=1'b1;
#500 $finish;
end

endmodule
