`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2022 05:51:17 PM
// Design Name: 
// Module Name: RAM
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
`define D_BITS      32
`define A_BITS      10
`define I_BITS      16
`define R_SIZE      8

module RAM(
    input [`D_BITS-1:0] RAM_input,
    input [`A_BITS-1:0] addr,
    input clk,
    input rst,
    
    input read,
    input write,
    
    output [`D_BITS-1:0] RAM_output
    );
    
    reg [`D_BITS-1:0] RAM_mem [0:31];
    
    assign RAM_output = RAM_mem[addr];
    
    always@(posedge clk) begin
        if(write) begin
            RAM_mem[addr] <= RAM_input;
        end
        else begin
        
        end
    end
    
endmodule
