//a parameterized CLA architecture. Work in progress

module cla #(parameter N = 4) (
    input  logic [N-1:0] a,b,
    input  logic         cin,
    output logic [N-1:0] sum,
    output logic         cout
);

    logic [N-1:0] g, p;
    logic [N:0]   c;  //c[0] = cin, c[N] = cout

    assign g = a & b;
    assign p = a ^ b;

    assign c[0] = cin;

    //Generate carry look-ahead logic
    genvar i, j;
    generate
        for (i = 1; i <= N; i = i + 1) begin : carry_gen
            logic term;
            assign term = g[i-1];
            for (j = i-2; j >= 0; j = j - 1) begin : inner
                assign term = term | ( (&p[i-1:j+1]) & g[j] );
            end
            assign c[i] = term | ( &p[i-1:0] & cin );
        end
    endgenerate

    //Sum bits
    assign sum  = p ^ c[N-1:0];
    assign cout = c[N];

endmodule

