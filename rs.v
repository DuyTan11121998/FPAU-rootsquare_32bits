////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : rs.v		                                                  //
// Description  :  Root Square of 2 floating point 32bits                     //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Tuesday December 10,2019                                    //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////
module rs(S,A);

output	[31:0]S;
input	[31:0]A;

wire  [31:0]S_temp;
wire  [24:0]frac_before_normalize;
wire  [23:0]fracS;
wire  [7:0]exp_temp,expS;

wire  sign;


rs_element rs(
    .out(S_temp),
    .in(A)
    );

assign frac_before_normalize={2'b01,S_temp[22:0]};
assign exp_temp =S_temp[30:23];
assign sign =S_temp[31];

//Normalize the frac answer
normalize	normalize_ans(.exp_out(expS),.frac_out(fracS),
			      .exp_in(exp_temp),.frac_in(frac_before_normalize));

//resultS_ex
resultS_rs	resultS_rs(.S(S),.A(A),.ansS({sign,expS,fracS[22:0]}));
endmodule