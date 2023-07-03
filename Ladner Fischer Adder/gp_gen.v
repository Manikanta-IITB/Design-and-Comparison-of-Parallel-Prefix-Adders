`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2023 22:19:31
// Design Name: 
// Module Name: gp_gen
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


module gp_gen(gu,gl,pu,pl,g,p);

input gu,gl,pu,pl;
output g,p;

assign g = gu | (pu & gl);
assign p = pu & pl;

endmodule
