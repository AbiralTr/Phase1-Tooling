module unclocked_ro_mem_tb;

    // Parameters
    parameter ADDR_WIDTH = 32;
    parameter DATA_WIDTH = 32;
    parameter MEM_DEPTH = 1024;

    // Testbench signals
    logic [ADDR_WIDTH-1:0] addr;
    logic [DATA_WIDTH-1:0] data_out;

    // Instantiate the unclocked read-only memory
    unclocked_ro_mem #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .MEM_DEPTH_BYTES(MEM_DEPTH),
        .INIT_FILE("init.mem")
    ) uut (
        .addr(addr),
        .data_out(data_out)
    );

    // Test procedure
    initial begin
        // Test all addresses
        for (int i = 0; i < MEM_DEPTH; i+=4) begin
            addr = i;
            #5; // wait for combinational logic to settle
            $display("Address: %0d, Data Out: %08h", addr, data_out);
        end
        $finish;
    end
endmodule