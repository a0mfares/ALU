# ALU
CIE 239 Project

module multiplier_6bit( input logic [5:0] A, [5:0] B, output logic [11:0] product);
logic [5:0] p_product[5:0];
logic [11:0] sum;
logic C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11;

