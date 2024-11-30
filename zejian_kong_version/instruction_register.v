module instruction_register(
  reset, clockir, shiftir, updateir, tdi, tdo, out1, out2
);

  input clockir, shiftir, updateir, tdi, reset;
  output tdo, out1, out2;
  wire q1;
  wire clockir_and_shiftir;
  dff DFF_1(q1, clockir_and_shiftir, tdi);
  dff DFF_2(tdo, clockir_and_shiftir, q1); 
  and AND_1(clockir_and_shiftir, clockir, shiftir);
  //dff(q, clock, data)
  dff_r DFF_3(out1, updateir, reset, q1);
  dff_r DFF_4(out2, updateir, reset, tdo);

  
endmodule