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

`define LD          7'b00010xx
`define LDC         7'b00011xx
`define STR         7'b00100xx

`define JMP         7'b0011xxx
`define JMPR        7'b0100xxx
`define JMPc        7'b0110xxx
`define JMPRc       7'b0111xxx
`define HALT        16'b1111111111111111


module golden_model(
    input [`I_BITS-1:0] instruction,
    input [`D_BITS-1:0] data_input,
    
    input clk,
    input rst,
    
    output reg [31:0] data_output,
    output reg [`A_BITS-1:0] addr,
    output reg read,
    output reg write,
    output reg [`A_BITS-1:0] pc
    );
    
    reg [`D_BITS-1:0] register [0:`R_SIZE-1];
    
    always@(posedge clk) begin
        if(rst) begin
            // Reset the processor. RAM data will become 0
        end
        else begin
            casex(instruction[15:9]) 
// ==========================================================================================================================            
                `NOP:       begin
                                read <= 0;
                                write <= 0;
                                pc <= pc + 1;
                            end
// ==========================================================================================================================                            
                `ADD:       begin
                                register[instruction[8:6]] = register[instruction[5:3]] + register[instruction[2:0]];
                                read <= 0;
                                write <= 0;
                                pc <= pc + 1;
                            end
// ==========================================================================================================================                            
                `SUB:       begin
                                register[instruction[8:6]] = register[instruction[5:3]] - register[instruction[2:0]];
                                read <= 0;
                                write <= 0;
                                pc <= pc + 1;
                            end
// ==========================================================================================================================                            
                `AND:       begin
                                register[instruction[8:6]] = register[instruction[5:3]] & register[instruction[2:0]];
                                read <= 0;
                                write <= 0;
                                pc <= pc + 1;
                            end
// ==========================================================================================================================                            
                `OR:        begin
                                register[instruction[8:6]] = register[instruction[5:3]] | register[instruction[2:0]];
                                read <= 0;
                                write <= 0;
                                pc <= pc + 1;
                            end
// ==========================================================================================================================                            
                `LD:        begin
                                read <= 1;
                                write <= 0;
                                pc <= pc + 1;
                                addr <= register[instruction[2:0]];
                                register[instruction[10:8]] <= data_input;
                            end
// ==========================================================================================================================                            
                `LDC:       begin
                                read <= 0;
                                write <= 0;
                                pc <= pc + 1;
                                register[instruction[10:8]] <= instruction[7:0];
                            end
// ==========================================================================================================================                            
                `STR:       begin
                                read <= 0;
                                write <= 1;
                                addr <= register[instruction[10:8]];
                                data_output <= register[instruction[2:0]];
                            end
// ==========================================================================================================================                            
                `JMP:       begin
                
                            end
// ==========================================================================================================================                            
                `JMPR:      begin
                
                            end
// ==========================================================================================================================                            
                `JMPc:      begin
                
                            end
// ==========================================================================================================================                            
                `JMPRc:     begin
                
                            end
// ==========================================================================================================================                            
                `HALT:      begin
                
                            end
            endcase
        end
    end
    
    
    always@(posedge clk) begin
        if(rst) begin
            pc <= 0;
            read <= 0;
            write <= 0;
        end
        else begin
            pc <= pc + 1;
        end
    end
    
endmodule
