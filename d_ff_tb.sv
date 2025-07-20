`timescale 1ns / 1ps

module tb_d_ff;

    logic clk;
    logic din;
    logic clr;
    logic q;
    logic qbar;

    // Instantiate the D Flip-Flop module
    d_ff dut (
        .din(din),
        .clk(clk),
        .clear_b(clr),
        .q(q),
        .qbar(qbar)
    );
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\t clk clr din => q qbar");
        $monitor("%0t\t %b   %b   %b  => %b   %b", $time, clk, clr, din, q, qbar);

        clr = 0; din = 0; #10;  
        clr = 1; din = 1; #10;  
        din = 0; #10;           
        clr = 0; #10;           
        clr = 1; din = 1; #10;  

        $finish;
    end

endmodule
