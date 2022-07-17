`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2022 05:44:29 PM
// Design Name: 
// Module Name: golden_model
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

`define R0          3'd0
`define R1          3'd1
`define R2          3'd2
`define R3          3'd3
`define R4          3'd4
`define R5          3'd5
`define R6          3'd6
`define R7          3'd7

`define NOP         16'd0
`define ADD         7'b0000001
`define SUB         7'b0000010
`define AND         7'b0000011
`define OR          7'b0000100

`define LOAD        5'b00010
`define LOADC       5'b00011
`define STORE       5'b00100

`define JMP         4'b0011
`define JMPR        4'b0100
`define JMPcond     4'b0110
`define JMPRcond    4'b0111
`define HALT        16'b1111111111111111


module golden_model(
    input [15:0] instruction,
    input [31:0] data_input,
    input clk,
    input rst,
    
    output [31:0] data_output
    );
    
    always@(posedge clk) begin
        if(rst) begin
            // Reset the processor. RAM data will become 0
        end
        else begin
            casex(instruction[15:9]) 
                `ADD:       ;
            endcase
        end
    end
    
    
endmodule
