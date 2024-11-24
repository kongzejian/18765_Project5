module instruction_register(
  reset, clockir, shiftir, updateir, tdi, tdo, out1, out2
);

  input clockir, shiftir, updateir, tdi, reset;
  output tdo, out1, out2;
  wire q1;
  wire clockir_and_shiftir;
  //scanff(CK, D, SI, SE, Q)
  scanff DFF_0(clockir_and_shiftir, 1'b0, tdi, 1'b1, q1); 
  scanff DFF_1(clockir_and_shiftir, 1'b0, q1, 1'b1, tdo);
  and AND_1(clockir_and_shiftir, clockir, shiftir);
  //dff(q, clock, data)
  dff_r DFF_2(out1, updateir, reset, q1);
  dff_r DFF_3(out2, updateir, reset, tdo);

  
endmodule