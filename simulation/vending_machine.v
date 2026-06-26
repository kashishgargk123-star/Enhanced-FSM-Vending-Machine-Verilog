module vending_machine(
    input clk,
    input reset,
    input coin5,
    input coin10,
    input cancel,

    output reg dispense,
    output reg refund,
    output reg change
);


// State Declaration
parameter S0        = 3'b000;
parameter S5        = 3'b001;
parameter DISPENSE  = 3'b010;
parameter CHANGE    = 3'b011;
parameter REFUND    = 3'b100;

reg [2:0] state, next_state;


// State Register

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
        state <= next_state;
end


// Next State Logic

always @(*)
begin

    case(state)

        // Initial State
      
        S0:
        begin
            if(coin10)
                next_state = DISPENSE;

            else if(coin5)
                next_state = S5;

            else
                next_state = S0;
        end

    
        // ₹5 Collected
        
        S5:
        begin
            if(cancel)
                next_state = REFUND;

            else if(coin10)
                next_state = CHANGE;

            else if(coin5)
                next_state = DISPENSE;

            else
                next_state = S5;
        end

        
        // Dispense Product
        
        DISPENSE:
        begin
            next_state = S0;
        end

    
        // Dispense + Change
    
        CHANGE:
        begin
            next_state = S0;
        end

        
        // Refund Money
        
        REFUND:
        begin
            next_state = S0;
        end

        default:
            next_state = S0;

    endcase

end


// Output Logic

always @(*)
begin

    dispense = 0;
    refund   = 0;
    change   = 0;

    case(state)

        DISPENSE:
        begin
            dispense = 1;
        end

        CHANGE:
        begin
            dispense = 1;
            change = 1;
        end

        REFUND:
        begin
            refund = 1;
        end

        default:
        begin
            dispense = 0;
            refund = 0;
            change = 0;
        end

    endcase

end

endmodule
