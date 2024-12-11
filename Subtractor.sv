module subtractor(input logic [5:0]A ,B , cin , output logic [5:0] difference, cout );

logic [5:0] B_comp ;
logic [5:0] sum;
logic c1, c2, c3, c4, c5, c6; 

assign B_comp=~B+6'b000001;


full_adder inst1(A[0],B_comp[0], cin, sum[0], c1);
full_adder inst2(A[1],B_comp[1], c1, sum[1], c2);
full_adder inst3(A[2],B_comp[2], c2, sum[2], c3);
full_adder inst4(A[3],B_comp[3], c3, sum[3], c4);
full_adder inst5(A[4],B_comp[4], c4, sum[4], c5);
full_adder inst6(A[5],B_comp[5], c5, sum[5], c6);

assign difference= sum;
assign cout=c6;

endmodule

module tb_subtractor;
    
    logic [5:0] A, B;
    logic cin;
    logic [5:0] difference;
    logic cout;

    
    subtractor uut (
        .A(A),
        .B(B),
        .cin(cin),
        .difference(difference),
        .cout(cout)
    );

    initial begin
        A = 6'b011110; 
        B = 6'b000011; 
        cin = 0;
        #10;
        $display("A = %b, B = %b, Difference = %b, Cout = %b", A, B, difference, cout);
        
        
        A = 6'b100100; 
        B = 6'b001011; 
        cin = 1;
        #10;
        $display("A = %b, B = %b, Difference = %b, Cout = %b", A, B, difference, cout);
        
       
        A = 6'b001110; 
        B = 6'b011110; 
        cin = 0;
        #10;
        $display("A = %b, B = %b, Difference = %b, Cout = %b", A, B, difference, cout);
        
        
        A = 6'b000000; // 0
        B = 6'b000000; // 0
        cin = 0;
        #10;
        $display("A = %b, B = %b, Difference = %b, Cout = %b", A, B, difference, cout);
    end
endmodule
