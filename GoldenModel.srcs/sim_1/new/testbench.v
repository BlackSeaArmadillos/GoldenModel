`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2022 05:46:01 PM
// Design Name: 
// Module Name: testbench
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

`define LD          5'b00010
`define LDC         5'b00011
`define STR         5'b00100

`define JMP         4'b0011
`define JMPR        4'b0100
`define JMPc        4'b0110
`define JMPRc       4'b0111
`define HALT        16'b1111111111111111

`define RESERVED    5'd0

module testbench();

wire [`A_BITS-1:0] pc_t;

reg clk_t;
reg rst_t;
reg [`I_BITS-1: 0] instruction_t;
reg [`I_BITS-1:0] instr_mem_t[0:10];


integer i;

initial begin
    clk_t = 0;
    forever #2 clk_t = ~clk_t;
end


initial begin
    rst_t = 0;
    rst_t = 1;
    
    for(i = 0; i < 10; i = i+1) begin
        instr_mem_t[i] <= 0;
    end
    #10;
    
    rst_t = 0;
    
    instr_mem_t[2] <= {`LDC, `R0, 8'd3};
    instr_mem_t[4] <= {`LDC, `R1, 8'd8};
    instr_mem_t[6] <= {`ADD, `R2, `R1, `R0};
    instr_mem_t[8] <= {`STR, `R0, `RESERVED, `R2};
//    instr_mem_t[9] <= {`LDC, `R4, 8'd3};
    
    
    #80;
    
    $stop();
end

always@(*) begin
    instruction_t = instr_mem_t[pc_t];
end

top_module top_module_dut(
    .instruction_top(instruction_t),
    .clk_top(clk_t),
    .rst_top(rst_t),
    
    .pc_top(pc_t)
);
endmodule
