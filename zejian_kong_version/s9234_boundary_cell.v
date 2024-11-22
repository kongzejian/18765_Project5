

module s9234_boundary_cell(
g89_in,g94_in,g98_in,g102_in,g107_in,g301_in,g306_in,g310_in,g314_in,
g319_in,g557_in,g558_in,g559_in,g560_in,g561_in,g562_in,g563_in,g564_in,
g705_in,g639_in,g567_in,g45_in,g42_in,g39_in,g702_in,g32_in,g38_in,g46_in,
g36_in,g47_in,g40_in,g37_in,g41_in,g22_in,g44_in,g23_in,Update,Shift_or_Load, Test_or_Normal,
g2584_out,g3222_out,g3600_out,g4307_out,g4321_out,g4422_out,g4809_out,g5137_out,
g5468_out,g5469_out,g5692_out,g6282_out,g6284_out,g6360_out,g6362_out,g6364_out,
g6366_out,g6368_out,g6370_out,g6372_out,g6374_out,g6728_out,g1290_out,g4121_out,
g4108_out,g4106_out,g4103_out,g1293_out,g4099_out,g4102_out,g4109_out,g4100_out,
g4112_out,g4105_out,g4101_out,g4110_out,g4104_out,g4107_out,g4098_out,
CK,scan_in,scan_en,scan_out
);

    input g89_in,g94_in,g98_in,g102_in,g107_in,g301_in,g306_in,g310_in,g314_in,
    g319_in,g557_in,g558_in,g559_in,g560_in,g561_in,g562_in,g563_in,g564_in,
    g705_in,g639_in,g567_in,g45_in,g42_in,g39_in,g702_in,g32_in,g38_in,g46_in,
    g36_in,g47_in,g40_in,g37_in,g41_in,g22_in,g44_in,g23_in, CK, scan_en, scan_in,Update,Shift_or_Load, Test_or_Normal;
    output g2584_out,g3222_out,g3600_out,g4307_out,g4321_out,g4422_out,g4809_out,g5137_out,
    g5468_out,g5469_out,g5692_out,g6282_out,g6284_out,g6360_out,g6362_out,g6364_out,
    g6366_out,g6368_out,g6370_out,g6372_out,g6374_out,g6728_out,g1290_out,g4121_out,
    g4108_out,g4106_out,g4103_out,g1293_out,g4099_out,g4102_out,g4109_out,g4100_out,
    g4112_out,g4105_out,g4101_out,g4110_out,g4104_out,g4107_out,g4098_out, scan_out;

    wire g102,g107,g1290,g1293,g22,g23,g2584,g301,g306,g310,g314,g319,g32,
    g3222,g36,g3600,g37,g38,g39,g40,g4098,g4099,g41,g4100,g4101,g4102,g4103,
    g4104,g4105,g4106,g4107,g4108,g4109,g4110,g4112,g4121,g42,g4307,g4321,g44,
    g4422,g45,g46,g47,g4809,g5137,g5468,g5469,g557,g558,g559,g560,g561,g562,g563,
    g564,g567,g5692,g6282,g6284,g6360,g6362,g6364,g6366,g6368,g6370,g6372,g6374,
    g639,g6728,g702,g705,g89,g94,g98;

    wire boundary_cell_tdi,boundary_cell_1_tdo,boundary_cell_2_tdo,boundary_cell_3_tdo,
    boundary_cell_4_tdo,boundary_cell_5_tdo,boundary_cell_6_tdo,boundary_cell_7_tdo,
    boundary_cell_8_tdo,boundary_cell_9_tdo,boundary_cell_10_tdo,boundary_cell_11_tdo,
    boundary_cell_12_tdo,boundary_cell_13_tdo,boundary_cell_14_tdo,boundary_cell_15_tdo,
    boundary_cell_16_tdo,boundary_cell_17_tdo,boundary_cell_18_tdo,boundary_cell_19_tdo,
    boundary_cell_20_tdo,boundary_cell_21_tdo,boundary_cell_22_tdo,boundary_cell_23_tdo,
    boundary_cell_24_tdo,boundary_cell_25_tdo,boundary_cell_26_tdo,boundary_cell_27_tdo,
    boundary_cell_28_tdo,boundary_cell_29_tdo,boundary_cell_30_tdo,boundary_cell_31_tdo,
    boundary_cell_32_tdo,boundary_cell_33_tdo,boundary_cell_34_tdo,boundary_cell_35_tdo,
    boundary_cell_36_tdo,boundary_cell_37_tdo,boundary_cell_38_tdo,boundary_cell_39_tdo,
    boundary_cell_40_tdo,boundary_cell_41_tdo,boundary_cell_42_tdo,boundary_cell_43_tdo,
    boundary_cell_44_tdo,boundary_cell_45_tdo,boundary_cell_46_tdo,boundary_cell_47_tdo,
    boundary_cell_48_tdo,boundary_cell_49_tdo,boundary_cell_50_tdo,boundary_cell_51_tdo,
    boundary_cell_52_tdo,boundary_cell_53_tdo,boundary_cell_54_tdo,boundary_cell_55_tdo,
    boundary_cell_56_tdo,boundary_cell_57_tdo,boundary_cell_58_tdo,boundary_cell_59_tdo,
    boundary_cell_60_tdo,boundary_cell_61_tdo,boundary_cell_62_tdo,boundary_cell_63_tdo,
    boundary_cell_64_tdo,boundary_cell_65_tdo,boundary_cell_66_tdo,boundary_cell_67_tdo,
    boundary_cell_68_tdo,boundary_cell_69_tdo,boundary_cell_70_tdo,boundary_cell_71_tdo,
    boundary_cell_72_tdo,boundary_cell_73_tdo,boundary_cell_74_tdo,boundary_cell_75_tdo,
    boundary_cell_tdo;

    assign boundary_cell_tdo = boundary_cell_75_tdo;

    s9234_scan s9234_scan_u (CK,g102,g107,g1290,g1293,g22,g23,g2584,g301,g306,g310,g314,g319,g32,
    g3222,g36,g3600,g37,g38,g39,g40,g4098,g4099,g41,g4100,g4101,g4102,g4103,
    g4104,g4105,g4106,g4107,g4108,g4109,g4110,g4112,g4121,g42,g4307,g4321,g44,
    g4422,g45,g46,g47,g4809,g5137,g5468,g5469,g557,g558,g559,g560,g561,g562,g563,
    g564,g567,g5692,g6282,g6284,g6360,g6362,g6364,g6366,g6368,g6370,g6372,g6374,
    g639,g6728,g702,g705,g89,g94,g98,scan_en, scan_in,scan_out);



    boundary_cell boundary_cell_1(g89_in, boundary_cell_tdi, CK, Update, boundary_cell_1_tdo, Shift_or_Load, Test_or_Normal, g89);
    boundary_cell boundary_cell_2(g94_in, boundary_cell_1_tdo, CK, Update, boundary_cell_2_tdo, Shift_or_Load, Test_or_Normal, g94);
    boundary_cell boundary_cell_3(g98_in, boundary_cell_2_tdo, CK, Update, boundary_cell_3_tdo, Shift_or_Load, Test_or_Normal, g98);
    boundary_cell boundary_cell_4(g102_in, boundary_cell_3_tdo, CK, Update, boundary_cell_4_tdo, Shift_or_Load, Test_or_Normal, g102);
    boundary_cell boundary_cell_5(g107_in, boundary_cell_4_tdo, CK, Update, boundary_cell_5_tdo, Shift_or_Load, Test_or_Normal, g107);
    boundary_cell boundary_cell_6(g301_in, boundary_cell_5_tdo, CK, Update, boundary_cell_6_tdo, Shift_or_Load, Test_or_Normal, g301);
    boundary_cell boundary_cell_7(g306_in, boundary_cell_6_tdo, CK, Update, boundary_cell_7_tdo, Shift_or_Load, Test_or_Normal, g306);
    boundary_cell boundary_cell_8(g310_in, boundary_cell_7_tdo, CK, Update, boundary_cell_8_tdo, Shift_or_Load, Test_or_Normal, g310);
    boundary_cell boundary_cell_9(g314_in, boundary_cell_8_tdo, CK, Update, boundary_cell_9_tdo, Shift_or_Load, Test_or_Normal, g314);
    boundary_cell boundary_cell_10(g319_in, boundary_cell_9_tdo, CK, Update, boundary_cell_10_tdo, Shift_or_Load, Test_or_Normal, g319);
    boundary_cell boundary_cell_11(g557_in, boundary_cell_10_tdo, CK, Update, boundary_cell_11_tdo, Shift_or_Load, Test_or_Normal, g557);
    boundary_cell boundary_cell_12(g558_in, boundary_cell_11_tdo, CK, Update, boundary_cell_12_tdo, Shift_or_Load, Test_or_Normal, g558);
    boundary_cell boundary_cell_13(g559_in, boundary_cell_12_tdo, CK, Update, boundary_cell_13_tdo, Shift_or_Load, Test_or_Normal, g559);
    boundary_cell boundary_cell_14(g560_in, boundary_cell_13_tdo, CK, Update, boundary_cell_14_tdo, Shift_or_Load, Test_or_Normal, g560);
    boundary_cell boundary_cell_15(g561_in, boundary_cell_14_tdo, CK, Update, boundary_cell_15_tdo, Shift_or_Load, Test_or_Normal, g561);
    boundary_cell boundary_cell_16(g562_in, boundary_cell_15_tdo, CK, Update, boundary_cell_16_tdo, Shift_or_Load, Test_or_Normal, g562);
    boundary_cell boundary_cell_17(g563_in, boundary_cell_16_tdo, CK, Update, boundary_cell_17_tdo, Shift_or_Load, Test_or_Normal, g563);
    boundary_cell boundary_cell_18(g564_in, boundary_cell_17_tdo, CK, Update, boundary_cell_18_tdo, Shift_or_Load, Test_or_Normal, g564);
    boundary_cell boundary_cell_19(g705_in, boundary_cell_18_tdo, CK, Update, boundary_cell_19_tdo, Shift_or_Load, Test_or_Normal, g705);
    boundary_cell boundary_cell_20(g639_in, boundary_cell_19_tdo, CK, Update, boundary_cell_20_tdo, Shift_or_Load, Test_or_Normal, g639);
    boundary_cell boundary_cell_21(g567_in, boundary_cell_20_tdo, CK, Update, boundary_cell_21_tdo, Shift_or_Load, Test_or_Normal, g567);
    boundary_cell boundary_cell_22(g45_in, boundary_cell_21_tdo, CK, Update, boundary_cell_22_tdo, Shift_or_Load, Test_or_Normal, g45);
    boundary_cell boundary_cell_23(g42_in, boundary_cell_22_tdo, CK, Update, boundary_cell_23_tdo, Shift_or_Load, Test_or_Normal, g42);
    boundary_cell boundary_cell_24(g39_in, boundary_cell_23_tdo, CK, Update, boundary_cell_24_tdo, Shift_or_Load, Test_or_Normal, g39);
    boundary_cell boundary_cell_25(g702_in, boundary_cell_24_tdo, CK, Update, boundary_cell_25_tdo, Shift_or_Load, Test_or_Normal, g702);
    boundary_cell boundary_cell_26(g32_in, boundary_cell_25_tdo, CK, Update, boundary_cell_26_tdo, Shift_or_Load, Test_or_Normal, g32);
    boundary_cell boundary_cell_27(g38_in, boundary_cell_26_tdo, CK, Update, boundary_cell_27_tdo, Shift_or_Load, Test_or_Normal, g38);
    boundary_cell boundary_cell_28(g46_in, boundary_cell_27_tdo, CK, Update, boundary_cell_28_tdo, Shift_or_Load, Test_or_Normal, g46);
    boundary_cell boundary_cell_29(g36_in, boundary_cell_28_tdo, CK, Update, boundary_cell_29_tdo, Shift_or_Load, Test_or_Normal, g36);
    boundary_cell boundary_cell_30(g47_in, boundary_cell_29_tdo, CK, Update, boundary_cell_30_tdo, Shift_or_Load, Test_or_Normal, g47);
    boundary_cell boundary_cell_31(g40_in, boundary_cell_30_tdo, CK, Update, boundary_cell_31_tdo, Shift_or_Load, Test_or_Normal, g40);
    boundary_cell boundary_cell_32(g37_in, boundary_cell_31_tdo, CK, Update, boundary_cell_32_tdo, Shift_or_Load, Test_or_Normal, g37);
    boundary_cell boundary_cell_33(g41_in, boundary_cell_32_tdo, CK, Update, boundary_cell_33_tdo, Shift_or_Load, Test_or_Normal, g41);
    boundary_cell boundary_cell_34(g22_in, boundary_cell_33_tdo, CK, Update, boundary_cell_34_tdo, Shift_or_Load, Test_or_Normal, g22);
    boundary_cell boundary_cell_35(g44_in, boundary_cell_34_tdo, CK, Update, boundary_cell_35_tdo, Shift_or_Load, Test_or_Normal, g44);
    boundary_cell boundary_cell_36(g23_in, boundary_cell_35_tdo, CK, Update, boundary_cell_36_tdo, Shift_or_Load, Test_or_Normal, g23);
    boundary_cell boundary_cell_37(g2584, boundary_cell_36_tdo ,CK, Update, boundary_cell_37_tdo, Shift_or_Load, Test_or_Normal, g2584_out);
    boundary_cell boundary_cell_38(g3222, boundary_cell_37_tdo ,CK, Update, boundary_cell_38_tdo, Shift_or_Load, Test_or_Normal, g3222_out);
    boundary_cell boundary_cell_39(g3600, boundary_cell_38_tdo ,CK, Update, boundary_cell_39_tdo, Shift_or_Load, Test_or_Normal, g3600_out);
    boundary_cell boundary_cell_40(g4307, boundary_cell_39_tdo ,CK, Update, boundary_cell_40_tdo, Shift_or_Load, Test_or_Normal, g4307_out);
    boundary_cell boundary_cell_41(g4321, boundary_cell_40_tdo ,CK, Update, boundary_cell_41_tdo, Shift_or_Load, Test_or_Normal, g4321_out);
    boundary_cell boundary_cell_42(g4422, boundary_cell_41_tdo ,CK, Update, boundary_cell_42_tdo, Shift_or_Load, Test_or_Normal, g4422_out);
    boundary_cell boundary_cell_43(g4809, boundary_cell_42_tdo ,CK, Update, boundary_cell_43_tdo, Shift_or_Load, Test_or_Normal, g4809_out);
    boundary_cell boundary_cell_44(g5137, boundary_cell_43_tdo ,CK, Update, boundary_cell_44_tdo, Shift_or_Load, Test_or_Normal, g5137_out);
    boundary_cell boundary_cell_45(g5468, boundary_cell_44_tdo ,CK, Update, boundary_cell_45_tdo, Shift_or_Load, Test_or_Normal, g5468_out);
    boundary_cell boundary_cell_46(g5469, boundary_cell_45_tdo ,CK, Update, boundary_cell_46_tdo, Shift_or_Load, Test_or_Normal, g5469_out);
    boundary_cell boundary_cell_47(g5692, boundary_cell_46_tdo ,CK, Update, boundary_cell_47_tdo, Shift_or_Load, Test_or_Normal, g5692_out);
    boundary_cell boundary_cell_48(g6282, boundary_cell_47_tdo ,CK, Update, boundary_cell_48_tdo, Shift_or_Load, Test_or_Normal, g6282_out);
    boundary_cell boundary_cell_49(g6284, boundary_cell_48_tdo ,CK, Update, boundary_cell_49_tdo, Shift_or_Load, Test_or_Normal, g6284_out);
    boundary_cell boundary_cell_50(g6360, boundary_cell_49_tdo ,CK, Update, boundary_cell_50_tdo, Shift_or_Load, Test_or_Normal, g6360_out);
    boundary_cell boundary_cell_51(g6362, boundary_cell_50_tdo ,CK, Update, boundary_cell_51_tdo, Shift_or_Load, Test_or_Normal, g6362_out);
    boundary_cell boundary_cell_52(g6364, boundary_cell_51_tdo ,CK, Update, boundary_cell_52_tdo, Shift_or_Load, Test_or_Normal, g6364_out);
    boundary_cell boundary_cell_53(g6366, boundary_cell_52_tdo ,CK, Update, boundary_cell_53_tdo, Shift_or_Load, Test_or_Normal, g6366_out);
    boundary_cell boundary_cell_54(g6368, boundary_cell_53_tdo ,CK, Update, boundary_cell_54_tdo, Shift_or_Load, Test_or_Normal, g6368_out);
    boundary_cell boundary_cell_55(g6370, boundary_cell_54_tdo ,CK, Update, boundary_cell_55_tdo, Shift_or_Load, Test_or_Normal, g6370_out);
    boundary_cell boundary_cell_56(g6372, boundary_cell_55_tdo ,CK, Update, boundary_cell_56_tdo, Shift_or_Load, Test_or_Normal, g6372_out);
    boundary_cell boundary_cell_57(g6374, boundary_cell_56_tdo ,CK, Update, boundary_cell_57_tdo, Shift_or_Load, Test_or_Normal, g6374_out);
    boundary_cell boundary_cell_58(g6728, boundary_cell_57_tdo ,CK, Update, boundary_cell_58_tdo, Shift_or_Load, Test_or_Normal, g6728_out);
    boundary_cell boundary_cell_59(g1290, boundary_cell_58_tdo ,CK, Update, boundary_cell_59_tdo, Shift_or_Load, Test_or_Normal, g1290_out);
    boundary_cell boundary_cell_60(g4121, boundary_cell_59_tdo ,CK, Update, boundary_cell_60_tdo, Shift_or_Load, Test_or_Normal, g4121_out);
    boundary_cell boundary_cell_61(g4108, boundary_cell_60_tdo ,CK, Update, boundary_cell_61_tdo, Shift_or_Load, Test_or_Normal, g4108_out);
    boundary_cell boundary_cell_62(g4106, boundary_cell_61_tdo ,CK, Update, boundary_cell_62_tdo, Shift_or_Load, Test_or_Normal, g4106_out);
    boundary_cell boundary_cell_63(g4103, boundary_cell_62_tdo ,CK, Update, boundary_cell_63_tdo, Shift_or_Load, Test_or_Normal, g4103_out);
    boundary_cell boundary_cell_64(g1293, boundary_cell_63_tdo ,CK, Update, boundary_cell_64_tdo, Shift_or_Load, Test_or_Normal, g1293_out);
    boundary_cell boundary_cell_65(g4099, boundary_cell_64_tdo ,CK, Update, boundary_cell_65_tdo, Shift_or_Load, Test_or_Normal, g4099_out);
    boundary_cell boundary_cell_66(g4102, boundary_cell_65_tdo ,CK, Update, boundary_cell_66_tdo, Shift_or_Load, Test_or_Normal, g4102_out);
    boundary_cell boundary_cell_67(g4109, boundary_cell_66_tdo ,CK, Update, boundary_cell_67_tdo, Shift_or_Load, Test_or_Normal, g4109_out);
    boundary_cell boundary_cell_68(g4100, boundary_cell_67_tdo ,CK, Update, boundary_cell_68_tdo, Shift_or_Load, Test_or_Normal, g4100_out);
    boundary_cell boundary_cell_69(g4112, boundary_cell_68_tdo ,CK, Update, boundary_cell_69_tdo, Shift_or_Load, Test_or_Normal, g4112_out);
    boundary_cell boundary_cell_70(g4105, boundary_cell_69_tdo ,CK, Update, boundary_cell_70_tdo, Shift_or_Load, Test_or_Normal, g4105_out);
    boundary_cell boundary_cell_71(g4101, boundary_cell_70_tdo ,CK, Update, boundary_cell_71_tdo, Shift_or_Load, Test_or_Normal, g4101_out);
    boundary_cell boundary_cell_72(g4110, boundary_cell_71_tdo ,CK, Update, boundary_cell_72_tdo, Shift_or_Load, Test_or_Normal, g4110_out);
    boundary_cell boundary_cell_73(g4104, boundary_cell_72_tdo ,CK, Update, boundary_cell_73_tdo, Shift_or_Load, Test_or_Normal, g4104_out);
    boundary_cell boundary_cell_74(g4107, boundary_cell_73_tdo ,CK, Update, boundary_cell_74_tdo, Shift_or_Load, Test_or_Normal, g4107_out);
    boundary_cell boundary_cell_75(g4098, boundary_cell_74_tdo ,CK, Update, boundary_cell_75_tdo, Shift_or_Load, Test_or_Normal, g4098_out);


endmodule



