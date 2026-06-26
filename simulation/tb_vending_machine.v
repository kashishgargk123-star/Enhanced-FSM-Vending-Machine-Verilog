`timescale 1ns/1ps

module tb_vending_machine;

reg clk;
reg reset;
reg coin5;
reg coin10;
reg cancel;

wire dispense;
wire refund;
wire change;

// DUT
vending_machine uut(
    .clk(clk),
    .reset(reset),
    .coin5(coin5),
    .coin10(coin10),
    .cancel(cancel),
    .dispense(dispense),
    .refund(refund),
    .change(change)
);

// Clock Generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("vending_machine.vcd");
    $dumpvars(0,tb_vending_machine);

    $display("Time\tReset\t₹5\t₹10\tCancel\tDispense\tRefund\tChange");

    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t\t%b\t%b",
             $time,reset,coin5,coin10,cancel,
             dispense,refund,change);

    clk=0;
    reset=1;
    coin5=0;
    coin10=0;
    cancel=0;

    // Reset
   
    #10 reset=0;
 
    // Test 1
    // ₹10 Coin
    #10;
    coin10=1;

    #10;
    coin10=0;

    // Test 2
    // ₹5 + ₹5
   
    #20;
    coin5=1;

    #10;
    coin5=0;

    #20;
    coin5=1;

    #10;
    coin5=0;

  
    // Test 3
    // ₹5 + ₹10
    
    #20;
    coin5=1;

    #10;
    coin5=0;

    #20;
    coin10=1;

    #10;
    coin10=0;

   
    // Test 4
    // Cancel Transaction
    
    #20;
    coin5=1;

    #10;
    coin5=0;

    #20;
    cancel=1;

    #10;
    cancel=0;

   
    // Test 5
    // Idle
    
    #40;

    $display("-----------------------------------");
    $display("Simulation Completed Successfully");
    $display("-----------------------------------");

    $finish;

end

endmodule
