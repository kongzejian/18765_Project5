module dff(q, clock, data);
   output reg q;
   input clock;
   input data;
   always @(posedge clock) begin
      q <= data;
   end
endmodule

module dff_r(q, clock, reset, data);
   output reg q;
   input clock;
   input data;
   input reset;
   always @(posedge clock or posedge reset) begin
      if(reset) q <= 0;
      else q <= data;
   end
endmodule

module scanff(CK, D, SI, SE, Q);
   input CK, D, SI, SE;
   output Q;
   wire   a;

   dff u_dff(Q, CK, a);
   u_mux2 u_mux(a, D, SI, SE);

endmodule // scanff

module scanff(CK, D, SI, SE, Q);
   input CK, D, SI, SE;
   output Q;
   wire   a;

   dff u_dff(Q, CK, a);
   u_mux2 u_mux(a, D, SI, SE);

endmodule // scanff



module u_mux2(out, in0, in1, sel);
   output out;
   input in0, in1, sel;

   wire  nsel, w1, w0;
   not NOT0(nsel, sel);

   and AND0(w0, nsel, in0);
   and AND1(w1, sel, in1);

   or OR0(out, w1, w0);
endmodule // u_mux2

module MUX_4_to_1(
  ir1, ir2, bypass_tdo, boundary_scan_tdo, internal_scan_tdo, TDO
);
  input ir1, ir2, bypass_tdo, boundary_scan_tdo, internal_scan_tdo;
  output TDO;
  wire mux_out1, mux_out2;
  u_mux2 MUX2_1(mux_out1, 1'b0, boundary_scan_tdo, ir1); //out, in0, in1, select
  u_mux2 MUX2_2(mux_out2, bypass_tdo, internal_scan_tdo, ir1);
  u_mux2 MUX2_3(TDO, mux_out1, mux_out2, ir2);
endmodule