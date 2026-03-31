module level_counter(
    input count,
    input reset,
    output reg [7:0] value
);
    
    always @(count, reset) begin
        if (reset) begin
            value <= 'b0;
        end else if (count) begin
            value <= value + 1;
        end
    end
    
endmodule
module edge_counter(
    input count,
    input reset,
    output reg [7:0] value
);
    
    always @(posedge count, posedge reset) begin
        if (reset) begin
            value <= 'b0;
        end else if (count) begin
            value <= value + 1;
        end
    end
    
endmodule
module test();

    integer i;
    reg count;
    reg reset;
    wire [7:0] edge_count;
    wire [7:0] level_count;

    edge_counter edge_uut(
        .count(count),
        .reset(reset),
        .value(edge_count)
    );

    level_counter level_uut(
        .count(count),
        .reset(reset),
        .value(level_count)
    );

    initial begin
        $dumpvars(0,test);
        reset = 1;
        count = 0;
        #1;
        reset = 0;
        #1;
        for (i = 0; i < 20; i = i + 1) begin
            #5 count = ~count;
        end
        $finish;
    end

endmodule