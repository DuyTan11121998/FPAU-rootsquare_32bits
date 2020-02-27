////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : division.v		                                          //
// Description  : division floating 32 bits                          		  //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Thursday November 28,2019                                   //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module division(S,A,B);
output	[31:0]S;
input	[31:0]A,B;

//Extract floating-point A and B
wire	signA,signB,signS;
wire	[7:0]expA,expB,expS;
wire	[23:0]fracA,fracB,fracS;

assign	signA=A[31];
assign	signB=B[31];
assign	expA=A[30:23];
assign	expB=B[30:23];
assign	fracA={1'b1,A[22:0]};
assign	fracB={1'b1,B[22:0]};

//Signal 
wire	[7:0]tc_expB,temp_expS;
wire	[7:0]expS_before_normal;

wire	[24:0]fracS_before_normal;

//Sign S
assign	signS = signA ^ signB;

//Additon 2 exponent
tc8	complimentB(.out(tc_expB),.in(expB));
adder8	sub_expA_expB(temp_expS,expA,tc_expB);
adder8	add_expS_127(expS_before_normal,temp_expS,8'd127);

//Multiplier frac A and frac B
div	div_two_frac(fracS_before_normal,{1'b0,fracA},{1'b0,fracB});

//Normalize the frac answer
normalize	normalize_ans(.exp_out(expS),.frac_out(fracS),
			      .exp_in(expS_before_normal),.frac_in(fracS_before_normal));

//Export S
resultS_div	export_S_value(.S(S),.A({signA,expA,fracA[22:0]}),.B({signB,expB,fracB[22:0]}),.ansS({signS,expS,fracS[22:0]}));
		
endmodule
