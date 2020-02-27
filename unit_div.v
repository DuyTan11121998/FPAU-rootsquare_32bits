////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : unit_div.v		                                          //
// Description  : Unit of division floating 32 bits                           //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Thursday November 28,2019                                   //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module unit_div(A0,Q1,A1,Q2,B);
    output [24:0]Q1,A0;
    input  [24:0]Q2,B,A1;

    wire [24:0]tcB;
    wire [24:0]B1;

    tc25 tc_25bits(tcB,B); 
    assign Q1[24:1]=Q2[23:0];
    assign Q1[0]=A1[24]?0:1;
    assign B1=A1[24]?B:tcB;
    adder25 block0(.S(A0),.A({A1[23:0],Q1[24]}),.B(B1));
endmodule