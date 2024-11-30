
//ir1, ir2 = 01(bypass) 10(boundary scan) 11(internal_scan)
module instruction_decoder(
  ir1, ir2, bypass_en, boundary_scan_en, internal_scan_en
);
  input ir1, ir2;
  output bypass_en, boundary_scan_en, internal_scan_en;
  
  wire not_ir1, nor_ir2;
  not NOT_1(not_ir1, ir1);
  not NOT_2(not_ir2, ir2);
  and ADN_1(bypass_en, not_ir1, ir2);
  and ADN_2(boundary_scan_en, ir1, not_ir2);
  and ADN_3(internal_scan_en, ir1, ir2);

endmodule