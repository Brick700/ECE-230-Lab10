module JK_Flip_Flop(
    input J, K,
    input Clk,
    output Q,
    output NotQ
);

    wire D;
    assign D = (~K & Q) | (J & ~Q); //Combinatorial logic

    //Apply logic to D Flip Flop to make JK work
    D_Flip_Flop dff(
        .D(D),
        .Clk(Clk),
        .Q(Q),
        .NotQ(NotQ)
    );

endmodule