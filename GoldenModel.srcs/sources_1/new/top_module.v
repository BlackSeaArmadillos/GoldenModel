`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2022 05:44:00 PM
// Design Name: 
// Module Name: top_module
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

module top_module(
        input [`I_BITS-1:0] instruction_top,
        
        input clk_top,
        input rst_top,
        
        output [`A_BITS-1:0] pc_top
    );
    
    wire [`D_BITS-1:0] data_out__RAM_in_top;
    wire [`A_BITS-1:0] addr_top;
    wire read_top;
    wire write_top;
    wire [`D_BITS-1:0] RAM_out__data_in_top;
    
    golden_model golden_model_dut(
        .instruction(instruction_top),
        .data_input(RAM_out__data_in_top),
        .clk(clk_top),
        .rst(rst_top),
        .pc(pc_top),
        
        .data_output(data_out__RAM_in_top),
        .addr(addr_top),
        .read(read_top),
        .write(write_top)
    );
    
    RAM RAM_dut(
        .RAM_input(data_out__RAM_in_top),
        .addr(addr_top),
        .clk(clk_top),
        .rst(rst_top),
        
        .read(read_top),
        .write(write_top),
        
        .RAM_output(RAM_out__data_in_top)
    );
endmodule
