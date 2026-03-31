module D_Flip_Flop(
    input D,      //Data input - what were snapshotting
    input Clk,    //Clock - trigger the snapshot
    output reg Q, //Stored input
    output NotQ   //Oppositer of Q
);

    initial begin
        Q <= 0;           //Start Q at 0
    end

    always @(posedge Clk) //Only run with Clk goes from 0 to 1
        Q <= D;           //Store input of D

    assign NotQ = ~Q;  

    
endmodule