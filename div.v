////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : div.v		                                                  //
// Description  : module division floating 32 bits                            //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Thursday November 28,2019                                   //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module div(S,A,B);
output	[24:0]S;
input	[24:0]A,B;

wire 	[24:0]cplB;
wire	[24:0]A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25;
wire	[24:0]B1;
wire	[24:0]Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25;

//Compliment of B 
tc25	two_complimentB(.out(cplB),.in(B));
	
//Intineraly
assign Q25 ={A[0],{24{1'b0}}};
assign A25 = {1'b0,A[24:1]};
assign B1 = A[24]?B:cplB;
adder25 block25( .S ( A24 ) ,.A( {A25[23:0],Q25[24]} ),.B( B1 ) );

//Stage24
unit_div block24(A23,Q24,A24,Q25,B);
unit_div block23(A22,Q23,A23,Q24,B);
unit_div block22(A21,Q22,A22,Q23,B);
unit_div block21(A20,Q21,A21,Q22,B);
unit_div block20(A19,Q20,A20,Q21,B);
unit_div block19(A18,Q19,A19,Q20,B);
unit_div block18(A17,Q18,A18,Q19,B);
unit_div block17(A16,Q17,A17,Q18,B);
unit_div block16(A15,Q16,A16,Q17,B);
unit_div block15(A14,Q15,A15,Q16,B);
unit_div block14(A13,Q14,A14,Q15,B);
unit_div block13(A12,Q13,A13,Q14,B);
unit_div block12(A11,Q12,A12,Q13,B);
unit_div block11(A10,Q11,A11,Q12,B);
unit_div block10(A9,Q10,A10,Q11,B);
unit_div block9(A8,Q9,A9,Q10,B);
unit_div block8(A7,Q8,A8,Q9,B);
unit_div block7(A6,Q7,A7,Q8,B);
unit_div block6(A5,Q6,A6,Q7,B);
unit_div block5(A4,Q5,A5,Q6,B);
unit_div block4(A3,Q4,A4,Q5,B);
unit_div block3(A2,Q3,A3,Q4,B);
unit_div block2(A1,Q2,A2,Q3,B);
unit_div block1(A0,Q1,A1,Q2,B);

assign S = {Q1[24:1],1'b0};

endmodule

