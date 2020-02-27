////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : rs_tb.v		                                              //
// Description  : Test Root Square of 2 floating point 32bits                 //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Tuesday December 10,2019                                    //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////
module rs_tb;
reg [31:0] in;

wire [31:0]S;

rs rs_tb(S,in);

initial begin
	 in=32'h3DCCCCCD;
#100
    in=32'h464A0C00;
#100
    in=32'h42F6D2F2; 
#100
    in=32'h7f800000;
#100
    in=32'hC0875C29;  
#100
    in=32'h44A40A3D;
#100
    in=32'h7fffffff;
#100
    in=32'hff800000;
#100
    in=32'h3DFBE76D;
#100
    in=32'hC0875C29;
    
end

endmodule
