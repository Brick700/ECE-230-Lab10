module T_Flip_Flop(
    input T,
    input Clk,
    output Q,
    output NotQ
);

//Same as JK, when T=1 toggle, T=0 hold
    JK_Flip_Flop jkff(
        .J(T),
        .K(T),
        .Clk(Clk),
        .Q(Q),
        .NotQ(NotQ)
    );

endmodule