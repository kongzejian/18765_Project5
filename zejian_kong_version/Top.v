module Top(
  CK, TDI, TDO, TMS, TCK, TRST, CK, g89_in,g94_in,g98_in,g102_in,g107_in,g301_in,g306_in,g310_in,g314_in,g319_in,g557_in,g558_in,g559_in,g560_in,g561_in,
  g562_in,g563_in,g564_in,g705_in,g639_in,g567_in,g45_in,g42_in,g39_in,g702_in,g32_in,g38_in,g46_in,g36_in,g47_in,g40_in,
  g37_in,g41_in,g22_in,g44_in,g23_in,g2584_out,g3222_out,g3600_out,g4307_out,g4321_out,g4422_out,g4809_out,g5137_out,g5468_out,g5469_out,g5692_out,g6282_out,
  g6284_out,g6360_out,g6362_out,g6364_out,g6366_out,g6368_out,g6370_out,g6372_out,g6374_out,g6728_out,g1290_out,g4121_out,g4108_out,
  g4106_out,g4103_out,g1293_out,g4099_out,g4102_out,g4109_out,g4100_out,g4112_out,g4105_out,g4101_out,g4110_out,g4104_out,g4107_out,g4098_out
);

  input CK, TDI, TMS, TCK, TRST;
  input g89_in,g94_in,g98_in,g102_in,g107_in,g301_in,g306_in,g310_in,g314_in,g319_in,g557_in,g558_in,g559_in,g560_in,g561_in,
  g562_in,g563_in,g564_in,g705_in,g639_in,g567_in,g45_in,g42_in,g39_in,g702_in,g32_in,g38_in,g46_in,g36_in,g47_in,g40_in,
  g37_in,g41_in,g22_in,g44_in,g23_in;
  output TDO;
  output g2584_out,g3222_out,g3600_out,g4307_out,g4321_out,g4422_out,g4809_out,g5137_out,g5468_out,g5469_out,g5692_out,g6282_out,
  g6284_out,g6360_out,g6362_out,g6364_out,g6366_out,g6368_out,g6370_out,g6372_out,g6374_out,g6728_out,g1290_out,g4121_out,g4108_out,
  g4106_out,g4103_out,g1293_out,g4099_out,g4102_out,g4109_out,g4100_out,g4112_out,g4105_out,g4101_out,g4110_out,g4104_out,g4107_out,g4098_out;

  wire clockdr, shiftdr, updatedr, clockir, shiftir, updateir, select, bs_en;
  wire ir1, ir2, bypass_en, boundary_scan_en, internal_scan_en;
  wire bypass_tdo, boundary_scan_tdo, internal_scan_tdo, instruction_register_tdo, test_data_registers_tdo, tdo_mux;
  wire clockdr_bs, updatedr_bs, shiftdr_bs;
  wire shift_interal_scan, shift_by_pass;
  wire boundary_cell_tdi,boundary_cell_1_tdo,boundary_cell_2_tdo,boundary_cell_3_tdo,boundary_cell_4_tdo,boundary_cell_5_tdo,
  boundary_cell_6_tdo,boundary_cell_7_tdo,boundary_cell_8_tdo,boundary_cell_9_tdo,boundary_cell_10_tdo,boundary_cell_11_tdo,
  boundary_cell_12_tdo,boundary_cell_13_tdo,boundary_cell_14_tdo,boundary_cell_15_tdo,boundary_cell_16_tdo,boundary_cell_17_tdo,
  boundary_cell_18_tdo,boundary_cell_19_tdo,boundary_cell_20_tdo,boundary_cell_21_tdo,boundary_cell_22_tdo,boundary_cell_23_tdo,
  boundary_cell_24_tdo,boundary_cell_25_tdo,boundary_cell_26_tdo,boundary_cell_27_tdo,boundary_cell_28_tdo,boundary_cell_29_tdo,
  boundary_cell_30_tdo,boundary_cell_31_tdo,boundary_cell_32_tdo,boundary_cell_33_tdo,boundary_cell_34_tdo,boundary_cell_35_tdo,
  boundary_cell_36_tdo,boundary_cell_37_tdo,boundary_cell_38_tdo,boundary_cell_39_tdo,boundary_cell_40_tdo,boundary_cell_41_tdo,
  boundary_cell_42_tdo,boundary_cell_43_tdo,boundary_cell_44_tdo,boundary_cell_45_tdo,boundary_cell_46_tdo,boundary_cell_47_tdo,
  boundary_cell_48_tdo,boundary_cell_49_tdo,boundary_cell_50_tdo,boundary_cell_51_tdo,boundary_cell_52_tdo,boundary_cell_53_tdo,
  boundary_cell_54_tdo,boundary_cell_55_tdo,boundary_cell_56_tdo,boundary_cell_57_tdo,boundary_cell_58_tdo,boundary_cell_59_tdo,
  boundary_cell_60_tdo,boundary_cell_61_tdo,boundary_cell_62_tdo,boundary_cell_63_tdo,boundary_cell_64_tdo,boundary_cell_65_tdo,
  boundary_cell_66_tdo,boundary_cell_67_tdo,boundary_cell_68_tdo,boundary_cell_69_tdo,boundary_cell_70_tdo,boundary_cell_71_tdo,
  boundary_cell_72_tdo,boundary_cell_73_tdo,boundary_cell_74_tdo,boundary_cell_75_tdo;

  and AND_1(clockdr_bs, clockdr, boundary_scan_en);
  and AND_2(updatedr_bs, updatedr, boundary_scan_en);
  and AND_3(shiftdr_bs, shiftdr, boundary_scan_en);
  and AND_4(shift_interal_scan, shiftdr, internal_scan_en);
  and AND_5(shift_by_pass, shiftdr, bypass_en);


  tapcontroller u_tapcontroller(TCK, TRST, TMS, clockdr, shiftdr, updatedr, clockir,shiftir, updateir, select, bs_en);
  instruction_register u_nstruction_register(clockir, shiftir, updateir, TDI, instruction_register_tdo, ir1, ir2);
  instruction_decoder u_instruction_decoder(ir1, ir2, bypass_en, boundary_scan_en, internal_scan_en);
  scanff Bypass_Reg(TCK, 1'b0, TDI, shift_by_pass, bypass_tdo);
  MUX_4_to_1 u_MUX_4_to_1(ir1, ir2, bypass_tdo, boundary_scan_tdo, internal_scan_tdo, test_data_registers_tdo);
  u_mux2 MUX2_2(tdo_mux, test_data_registers_tdo, instruction_register_tdo, select);
  dff DFF_1(out1, TCK, TDO);

  wire g102,g107,g1290,g1293,g22,g23,g2584,g301,g306,g310,g314,g319,g32,
  g3222,g36,g3600,g37,g38,g39,g40,g4098,g4099,g41,g4100,g4101,g4102,g4103,
  g4104,g4105,g4106,g4107,g4108,g4109,g4110,g4112,g4121,g42,g4307,g4321,g44,
  g4422,g45,g46,g47,g4809,g5137,g5468,g5469,g557,g558,g559,g560,g561,g562,g563,
  g564,g567,g5692,g6282,g6284,g6360,g6362,g6364,g6366,g6368,g6370,g6372,g6374,
  g639,g6728,g702,g705,g89,g94,g98;

  s9234_scan s9234_scan_u (CK,g102,g107,g1290,g1293,g22,g23,g2584,g301,g306,g310,g314,g319,g32,
  g3222,g36,g3600,g37,g38,g39,g40,g4098,g4099,g41,g4100,g4101,g4102,g4103,
  g4104,g4105,g4106,g4107,g4108,g4109,g4110,g4112,g4121,g42,g4307,g4321,g44,
  g4422,g45,g46,g47,g4809,g5137,g5468,g5469,g557,g558,g559,g560,g561,g562,g563,
  g564,g567,g5692,g6282,g6284,g6360,g6362,g6364,g6366,g6368,g6370,g6372,g6374,
  g639,g6728,g702,g705,g89,g94,g98,internal_scan,TDI,internal_scan_tdo);

  boundary_cell boundary_cell_1(g89_in, boundary_cell_tdi, clockdr_bs, updatedr_bs, boundary_cell_1_tdo, shiftdr_bs, bs_en, g89);
  boundary_cell boundary_cell_2(g94_in, boundary_cell_1_tdo, clockdr_bs, updatedr_bs, boundary_cell_2_tdo, shiftdr_bs, bs_en, g94);
  boundary_cell boundary_cell_3(g98_in, boundary_cell_2_tdo, clockdr_bs, updatedr_bs, boundary_cell_3_tdo, shiftdr_bs, bs_en, g98);
  boundary_cell boundary_cell_4(g102_in, boundary_cell_3_tdo, clockdr_bs, updatedr_bs, boundary_cell_4_tdo, shiftdr_bs, bs_en, g102);
  boundary_cell boundary_cell_5(g107_in, boundary_cell_4_tdo, clockdr_bs, updatedr_bs, boundary_cell_5_tdo, shiftdr_bs, bs_en, g107);
  boundary_cell boundary_cell_6(g301_in, boundary_cell_5_tdo, clockdr_bs, updatedr_bs, boundary_cell_6_tdo, shiftdr_bs, bs_en, g301);
  boundary_cell boundary_cell_7(g306_in, boundary_cell_6_tdo, clockdr_bs, updatedr_bs, boundary_cell_7_tdo, shiftdr_bs, bs_en, g306);
  boundary_cell boundary_cell_8(g310_in, boundary_cell_7_tdo, clockdr_bs, updatedr_bs, boundary_cell_8_tdo, shiftdr_bs, bs_en, g310);
  boundary_cell boundary_cell_9(g314_in, boundary_cell_8_tdo, clockdr_bs, updatedr_bs, boundary_cell_9_tdo, shiftdr_bs, bs_en, g314);
  boundary_cell boundary_cell_10(g319_in, boundary_cell_9_tdo, clockdr_bs, updatedr_bs, boundary_cell_10_tdo, shiftdr_bs, bs_en, g319);
  boundary_cell boundary_cell_11(g557_in, boundary_cell_10_tdo, clockdr_bs, updatedr_bs, boundary_cell_11_tdo, shiftdr_bs, bs_en, g557);
  boundary_cell boundary_cell_12(g558_in, boundary_cell_11_tdo, clockdr_bs, updatedr_bs, boundary_cell_12_tdo, shiftdr_bs, bs_en, g558);
  boundary_cell boundary_cell_13(g559_in, boundary_cell_12_tdo, clockdr_bs, updatedr_bs, boundary_cell_13_tdo, shiftdr_bs, bs_en, g559);
  boundary_cell boundary_cell_14(g560_in, boundary_cell_13_tdo, clockdr_bs, updatedr_bs, boundary_cell_14_tdo, shiftdr_bs, bs_en, g560);
  boundary_cell boundary_cell_15(g561_in, boundary_cell_14_tdo, clockdr_bs, updatedr_bs, boundary_cell_15_tdo, shiftdr_bs, bs_en, g561);
  boundary_cell boundary_cell_16(g562_in, boundary_cell_15_tdo, clockdr_bs, updatedr_bs, boundary_cell_16_tdo, shiftdr_bs, bs_en, g562);
  boundary_cell boundary_cell_17(g563_in, boundary_cell_16_tdo, clockdr_bs, updatedr_bs, boundary_cell_17_tdo, shiftdr_bs, bs_en, g563);
  boundary_cell boundary_cell_18(g564_in, boundary_cell_17_tdo, clockdr_bs, updatedr_bs, boundary_cell_18_tdo, shiftdr_bs, bs_en, g564);
  boundary_cell boundary_cell_19(g705_in, boundary_cell_18_tdo, clockdr_bs, updatedr_bs, boundary_cell_19_tdo, shiftdr_bs, bs_en, g705);
  boundary_cell boundary_cell_20(g639_in, boundary_cell_19_tdo, clockdr_bs, updatedr_bs, boundary_cell_20_tdo, shiftdr_bs, bs_en, g639);
  boundary_cell boundary_cell_21(g567_in, boundary_cell_20_tdo, clockdr_bs, updatedr_bs, boundary_cell_21_tdo, shiftdr_bs, bs_en, g567);
  boundary_cell boundary_cell_22(g45_in, boundary_cell_21_tdo, clockdr_bs, updatedr_bs, boundary_cell_22_tdo, shiftdr_bs, bs_en, g45);
  boundary_cell boundary_cell_23(g42_in, boundary_cell_22_tdo, clockdr_bs, updatedr_bs, boundary_cell_23_tdo, shiftdr_bs, bs_en, g42);
  boundary_cell boundary_cell_24(g39_in, boundary_cell_23_tdo, clockdr_bs, updatedr_bs, boundary_cell_24_tdo, shiftdr_bs, bs_en, g39);
  boundary_cell boundary_cell_25(g702_in, boundary_cell_24_tdo, clockdr_bs, updatedr_bs, boundary_cell_25_tdo, shiftdr_bs, bs_en, g702);
  boundary_cell boundary_cell_26(g32_in, boundary_cell_25_tdo, clockdr_bs, updatedr_bs, boundary_cell_26_tdo, shiftdr_bs, bs_en, g32);
  boundary_cell boundary_cell_27(g38_in, boundary_cell_26_tdo, clockdr_bs, updatedr_bs, boundary_cell_27_tdo, shiftdr_bs, bs_en, g38);
  boundary_cell boundary_cell_28(g46_in, boundary_cell_27_tdo, clockdr_bs, updatedr_bs, boundary_cell_28_tdo, shiftdr_bs, bs_en, g46);
  boundary_cell boundary_cell_29(g36_in, boundary_cell_28_tdo, clockdr_bs, updatedr_bs, boundary_cell_29_tdo, shiftdr_bs, bs_en, g36);
  boundary_cell boundary_cell_30(g47_in, boundary_cell_29_tdo, clockdr_bs, updatedr_bs, boundary_cell_30_tdo, shiftdr_bs, bs_en, g47);
  boundary_cell boundary_cell_31(g40_in, boundary_cell_30_tdo, clockdr_bs, updatedr_bs, boundary_cell_31_tdo, shiftdr_bs, bs_en, g40);
  boundary_cell boundary_cell_32(g37_in, boundary_cell_31_tdo, clockdr_bs, updatedr_bs, boundary_cell_32_tdo, shiftdr_bs, bs_en, g37);
  boundary_cell boundary_cell_33(g41_in, boundary_cell_32_tdo, clockdr_bs, updatedr_bs, boundary_cell_33_tdo, shiftdr_bs, bs_en, g41);
  boundary_cell boundary_cell_34(g22_in, boundary_cell_33_tdo, clockdr_bs, updatedr_bs, boundary_cell_34_tdo, shiftdr_bs, bs_en, g22);
  boundary_cell boundary_cell_35(g44_in, boundary_cell_34_tdo, clockdr_bs, updatedr_bs, boundary_cell_35_tdo, shiftdr_bs, bs_en, g44);
  boundary_cell boundary_cell_36(g23_in, boundary_cell_35_tdo, clockdr_bs, updatedr_bs, boundary_cell_36_tdo, shiftdr_bs, bs_en, g23);
  boundary_cell boundary_cell_37(g2584, boundary_cell_36_tdo ,clockdr_bs, updatedr_bs, boundary_cell_37_tdo, shiftdr_bs, bs_en, g2584_out);
  boundary_cell boundary_cell_38(g3222, boundary_cell_37_tdo ,clockdr_bs, updatedr_bs, boundary_cell_38_tdo, shiftdr_bs, bs_en, g3222_out);
  boundary_cell boundary_cell_39(g3600, boundary_cell_38_tdo ,clockdr_bs, updatedr_bs, boundary_cell_39_tdo, shiftdr_bs, bs_en, g3600_out);
  boundary_cell boundary_cell_40(g4307, boundary_cell_39_tdo ,clockdr_bs, updatedr_bs, boundary_cell_40_tdo, shiftdr_bs, bs_en, g4307_out);
  boundary_cell boundary_cell_41(g4321, boundary_cell_40_tdo ,clockdr_bs, updatedr_bs, boundary_cell_41_tdo, shiftdr_bs, bs_en, g4321_out);
  boundary_cell boundary_cell_42(g4422, boundary_cell_41_tdo ,clockdr_bs, updatedr_bs, boundary_cell_42_tdo, shiftdr_bs, bs_en, g4422_out);
  boundary_cell boundary_cell_43(g4809, boundary_cell_42_tdo ,clockdr_bs, updatedr_bs, boundary_cell_43_tdo, shiftdr_bs, bs_en, g4809_out);
  boundary_cell boundary_cell_44(g5137, boundary_cell_43_tdo ,clockdr_bs, updatedr_bs, boundary_cell_44_tdo, shiftdr_bs, bs_en, g5137_out);
  boundary_cell boundary_cell_45(g5468, boundary_cell_44_tdo ,clockdr_bs, updatedr_bs, boundary_cell_45_tdo, shiftdr_bs, bs_en, g5468_out);
  boundary_cell boundary_cell_46(g5469, boundary_cell_45_tdo ,clockdr_bs, updatedr_bs, boundary_cell_46_tdo, shiftdr_bs, bs_en, g5469_out);
  boundary_cell boundary_cell_47(g5692, boundary_cell_46_tdo ,clockdr_bs, updatedr_bs, boundary_cell_47_tdo, shiftdr_bs, bs_en, g5692_out);
  boundary_cell boundary_cell_48(g6282, boundary_cell_47_tdo ,clockdr_bs, updatedr_bs, boundary_cell_48_tdo, shiftdr_bs, bs_en, g6282_out);
  boundary_cell boundary_cell_49(g6284, boundary_cell_48_tdo ,clockdr_bs, updatedr_bs, boundary_cell_49_tdo, shiftdr_bs, bs_en, g6284_out);
  boundary_cell boundary_cell_50(g6360, boundary_cell_49_tdo ,clockdr_bs, updatedr_bs, boundary_cell_50_tdo, shiftdr_bs, bs_en, g6360_out);
  boundary_cell boundary_cell_51(g6362, boundary_cell_50_tdo ,clockdr_bs, updatedr_bs, boundary_cell_51_tdo, shiftdr_bs, bs_en, g6362_out);
  boundary_cell boundary_cell_52(g6364, boundary_cell_51_tdo ,clockdr_bs, updatedr_bs, boundary_cell_52_tdo, shiftdr_bs, bs_en, g6364_out);
  boundary_cell boundary_cell_53(g6366, boundary_cell_52_tdo ,clockdr_bs, updatedr_bs, boundary_cell_53_tdo, shiftdr_bs, bs_en, g6366_out);
  boundary_cell boundary_cell_54(g6368, boundary_cell_53_tdo ,clockdr_bs, updatedr_bs, boundary_cell_54_tdo, shiftdr_bs, bs_en, g6368_out);
  boundary_cell boundary_cell_55(g6370, boundary_cell_54_tdo ,clockdr_bs, updatedr_bs, boundary_cell_55_tdo, shiftdr_bs, bs_en, g6370_out);
  boundary_cell boundary_cell_56(g6372, boundary_cell_55_tdo ,clockdr_bs, updatedr_bs, boundary_cell_56_tdo, shiftdr_bs, bs_en, g6372_out);
  boundary_cell boundary_cell_57(g6374, boundary_cell_56_tdo ,clockdr_bs, updatedr_bs, boundary_cell_57_tdo, shiftdr_bs, bs_en, g6374_out);
  boundary_cell boundary_cell_58(g6728, boundary_cell_57_tdo ,clockdr_bs, updatedr_bs, boundary_cell_58_tdo, shiftdr_bs, bs_en, g6728_out);
  boundary_cell boundary_cell_59(g1290, boundary_cell_58_tdo ,clockdr_bs, updatedr_bs, boundary_cell_59_tdo, shiftdr_bs, bs_en, g1290_out);
  boundary_cell boundary_cell_60(g4121, boundary_cell_59_tdo ,clockdr_bs, updatedr_bs, boundary_cell_60_tdo, shiftdr_bs, bs_en, g4121_out);
  boundary_cell boundary_cell_61(g4108, boundary_cell_60_tdo ,clockdr_bs, updatedr_bs, boundary_cell_61_tdo, shiftdr_bs, bs_en, g4108_out);
  boundary_cell boundary_cell_62(g4106, boundary_cell_61_tdo ,clockdr_bs, updatedr_bs, boundary_cell_62_tdo, shiftdr_bs, bs_en, g4106_out);
  boundary_cell boundary_cell_63(g4103, boundary_cell_62_tdo ,clockdr_bs, updatedr_bs, boundary_cell_63_tdo, shiftdr_bs, bs_en, g4103_out);
  boundary_cell boundary_cell_64(g1293, boundary_cell_63_tdo ,clockdr_bs, updatedr_bs, boundary_cell_64_tdo, shiftdr_bs, bs_en, g1293_out);
  boundary_cell boundary_cell_65(g4099, boundary_cell_64_tdo ,clockdr_bs, updatedr_bs, boundary_cell_65_tdo, shiftdr_bs, bs_en, g4099_out);
  boundary_cell boundary_cell_66(g4102, boundary_cell_65_tdo ,clockdr_bs, updatedr_bs, boundary_cell_66_tdo, shiftdr_bs, bs_en, g4102_out);
  boundary_cell boundary_cell_67(g4109, boundary_cell_66_tdo ,clockdr_bs, updatedr_bs, boundary_cell_67_tdo, shiftdr_bs, bs_en, g4109_out);
  boundary_cell boundary_cell_68(g4100, boundary_cell_67_tdo ,clockdr_bs, updatedr_bs, boundary_cell_68_tdo, shiftdr_bs, bs_en, g4100_out);
  boundary_cell boundary_cell_69(g4112, boundary_cell_68_tdo ,clockdr_bs, updatedr_bs, boundary_cell_69_tdo, shiftdr_bs, bs_en, g4112_out);
  boundary_cell boundary_cell_70(g4105, boundary_cell_69_tdo ,clockdr_bs, updatedr_bs, boundary_cell_70_tdo, shiftdr_bs, bs_en, g4105_out);
  boundary_cell boundary_cell_71(g4101, boundary_cell_70_tdo ,clockdr_bs, updatedr_bs, boundary_cell_71_tdo, shiftdr_bs, bs_en, g4101_out);
  boundary_cell boundary_cell_72(g4110, boundary_cell_71_tdo ,clockdr_bs, updatedr_bs, boundary_cell_72_tdo, shiftdr_bs, bs_en, g4110_out);
  boundary_cell boundary_cell_73(g4104, boundary_cell_72_tdo ,clockdr_bs, updatedr_bs, boundary_cell_73_tdo, shiftdr_bs, bs_en, g4104_out);
  boundary_cell boundary_cell_74(g4107, boundary_cell_73_tdo ,clockdr_bs, updatedr_bs, boundary_cell_74_tdo, shiftdr_bs, bs_en, g4107_out);
  boundary_cell boundary_cell_75(g4098, boundary_cell_74_tdo ,clockdr_bs, updatedr_bs, boundary_cell_75_tdo, shiftdr_bs, bs_en, g4098_out);


endmodule


