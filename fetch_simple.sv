module fetch_simple (
    input logic clk, 
    input logic reset, 
    input logic [31:0] instruction_data,
    output logic [31:0] instruction_address
    );


    // Program Counter 
    logic [31:0] pc;
    // Instruction 
    logic [31:0] instruction;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 32'b0;
        end else begin
            pc <= pc + 4; // Increment PC by 4 for next instruction
        end
    end


    // fetch
    always_comb begin
        // fetch instruction
        instruction_address = pc;
        instruction = instruction_data;
    end


    // Debugging output
    always_ff @(posedge clk) begin
        $display("PC: %0h, Instruction: %0h", pc, instruction);
    end 

endmodule
