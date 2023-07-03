`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2023 01:23:20
// Design Name: 
// Module Name: KSadder
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

module KSadder(A,B,Cin,clk,Sum,Cout);
input [15:0] A,B;
input clk,Cin;
output reg [15:0] Sum;
output reg Cout;

wire [15:0] G1,P1;
wire [15:1] G2,P2;
wire [15:2] G3,P3;
wire [15:4] G4,P4;
wire [15:8] G5;

reg [15:0] P1_1,P1_2,P1_3,P1_4,P1_5,G1_1;
reg [15:1] P2_2,G2_2;
reg [15:2] G3_3,P3_3;
reg [15:4] G4_4,P4_4;
reg [15:0] G5_5;
reg G1_2,G1_3,G1_4,G2_3,P2_3,P2_4,G2_4;
reg [3:2]G3_4;
reg cin1,cin2,cin3,cin4,cin5;



//==============1st block ========================//
assign G1[0]= (A[0] & B[0]) | (Cin & (A[0]| B[0])),
       G1[15:1]= A[15:1] & B[15:1];
assign P1= A ^ B;
       
always@(posedge clk)
begin
P1_1 <= P1;
G1_1 <= G1;
cin1 <= Cin;
end

//==============2nd block ================//
assign G2[15:1]=G1_1[15:1] | (P1_1[15:1] & G1_1[14:0]);

assign P2[15:1]=P1_1[15:1] & P1_1[14:0];
       
always@(posedge clk)
begin 
P2_2 <= P2;
G2_2 <= G2;
P1_2 <= P1_1;
G1_2 <= G1_1[0];
cin2 <= cin1;
end

//================= 3rd stage ==================//

assign G3[2]=G2_2[2] | (P2_2[2] & G1_2),
	   G3[15:3]=G2_2[15:3] | (P2_2[15:3] & G2_2[13:1]);
	    
assign P3[2]=P2_2[2] & P1_2[0],
       P3[15:3]=P2_2[15:3] & P2_2[13:1];

always@(posedge clk)
begin
G3_3 <= G3;
P3_3 <= P3;
P1_3 <= P1_2;
G1_3 <= G1_2;
P2_3 <= P2_2[1];
G2_3 <= G2_2[1];
cin3 <= cin2;
end
	
//=================== 4th stage ======================//
assign G4[4]=G3_3[4] | (P3_3[4] & G1_3),
       G4[5]=G3_3[5] | (P3_3[5] & G2_3),
	   G4[15:6]=G3_3[15:6] | (P3_3[15:6] & G3_3[11:2]);
	    
assign P4[4]=P3_3[4] & P1_3[0],
       P4[5]=P3_3[5] & P2_3,
       P4[15:6]=P3_3[15:6] & P3_3[11:2];
	  
always@(posedge clk)
begin
P4_4 <= P4;
G4_4 <= G4;

G1_4 <= G1_3;
P1_4 <= P1_3;
P2_4 <= P2_3;
G2_4 <= G2_3;
G3_4 <= G3_3[3:2];
cin4 <= cin3;
end
						  

//================= 5th stage ================//

assign G5[8]=G4_4[8] | (P4_4[8] & G1_4),
	   G5[9]=G4_4[9] | (P4_4[9] & G2_4),
	   G5[10]=G4_4[10] | (P4_4[10] & G3_4[2]),
	   G5[11]=G4_4[11] | (P4_4[11] & G3_4[3]),
	   G5[15:12]=G4_4[15:12] | (P4_4[15:12] & G4_4[7:4]);
	   
	   
always@(posedge clk)
begin
G5_5[15:8] <= G5;
G5_5[7:4] <= G4_4[7:4];
G5_5[3:2] <= G3_4[3:2];



G5_5[1] <= G2_4;
G5_5[0] <= G1_4;

P1_5 <= P1_4;
cin5 <= cin4;
end

// ============ 6th stage ==============//
always@(posedge clk)
begin
Cout <= G5_5[15];
Sum[0] <= P1_5[0]^cin5;
Sum [15:1] <= P1_5[15:1]^G5_5[14:0];
end

endmodule
