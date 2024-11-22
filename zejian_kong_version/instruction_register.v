module instruction_register(
  clockir, shiftir, updateir, tdi, tdo, out1, out2
);

  input clockir, shiftir, updateir, tdi;
  output tdo, out1, out2;
  wire q1;
  //scanff(CK, D, SI, SE, Q)
  scanff DFF_0(clockir, 1'b0, tdi, shiftir, q1); 
  scanff DFF_1(clockir, 1'b0, q1, shiftir, tdo);

  //dff(q, clock, data)
  dff DFF_2(out1, updateir, q1);
  dff DFF_3(out2, updateir, tdo);
endmodule