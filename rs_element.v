////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : rs_element.v		                                          //
// Description  : Element Root Square of 2 floating point 32bits              //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Tuesday December 10,2019                                    //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module rs_element(out,in);
    input   [31:0]in;
    output  [31:0]out;

    wire [31:0]s0,s1,s2,s3,s4,s5,s6,s7,s8;
    unit count1(s0,in,32'h3F800000);
    unit count2(s1,in,s0);
    unit count3(s2,in,s1);
    unit count4(s3,in,s2);
    unit count5(s4,in,s3);
    unit count6(s5,in,s4);
    unit count7(s6,in,s5);
    unit count8(s7,in,s6);
    unit count9(s8,in,s7);
    unit count10(out,in,s8);
endmodule

module unit(out,in,pre_out);
    input   [31:0]in,pre_out;
    output  [31:0]out;

    wire [31:0]s0,s1,s2;

    division div(s0,in,pre_out);
    add_sub sub(s1,s0,pre_out,1'b1);

    division div1(s2,s1,32'h40000000);
    add_sub  add(out,s2,pre_out,1'b0);
endmodule