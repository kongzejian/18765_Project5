module top_tb;

  // Declare inputs as reg and outputs as wire
  reg CK;
  reg TDI;
  reg TMS;
  reg TCK;
  reg TRST;
  wire TDO;
  reg g89_in,g94_in,g98_in,g102_in,g107_in,g301_in,g306_in,g310_in,g314_in,g319_in,g557_in,g558_in,g559_in,g560_in,g561_in,
  g562_in,g563_in,g564_in,g705_in,g639_in,g567_in,g45_in,g42_in,g39_in,g702_in,g32_in,g38_in,g46_in,g36_in,g47_in,g40_in,
  g37_in,g41_in,g22_in,g44_in,g23_in;
  wire g2584_out,g3222_out,g3600_out,g4307_out,g4321_out,g4422_out,g4809_out,g5137_out,g5468_out,g5469_out,g5692_out,g6282_out,
  g6284_out,g6360_out,g6362_out,g6364_out,g6366_out,g6368_out,g6370_out,g6372_out,g6374_out,g6728_out,g1290_out,g4121_out,g4108_out,
  g4106_out,g4103_out,g1293_out,g4099_out,g4102_out,g4109_out,g4100_out,g4112_out,g4105_out,g4101_out,g4110_out,g4104_out,g4107_out,g4098_out;

  // Instantiate the DUT (Design Under Test)
  Top uut (
    CK, TDI, TDO, TMS, TCK, TRST, CK, g89_in,g94_in,g98_in,g102_in,g107_in,g301_in,g306_in,g310_in,g314_in,g319_in,g557_in,g558_in,g559_in,g560_in,g561_in,
  g562_in,g563_in,g564_in,g705_in,g639_in,g567_in,g45_in,g42_in,g39_in,g702_in,g32_in,g38_in,g46_in,g36_in,g47_in,g40_in,
  g37_in,g41_in,g22_in,g44_in,g23_in,g2584_out,g3222_out,g3600_out,g4307_out,g4321_out,g4422_out,g4809_out,g5137_out,g5468_out,g5469_out,g5692_out,g6282_out,
  g6284_out,g6360_out,g6362_out,g6364_out,g6366_out,g6368_out,g6370_out,g6372_out,g6374_out,g6728_out,g1290_out,g4121_out,g4108_out,
  g4106_out,g4103_out,g1293_out,g4099_out,g4102_out,g4109_out,g4100_out,g4112_out,g4105_out,g4101_out,g4110_out,g4104_out,g4107_out,g4098_out
  );

  // Generate clock signal
  initial begin
    CK = 0;
    forever #5 CK = ~CK; // Toggle clock every 5 ns
  end

    initial begin
    TCK = 0;
    forever #5 TCK = ~TCK; // Toggle clock every 5 ns
  end

  // Initialize and simulate other inputs
  initial begin
    // Initialize signals
    TDI = 0;
    TMS = 0;
    TCK = 0;
    TRST = 1; // Active high reset

    // Wait for some time
    #10;
    
    // Apply stimulus
    TRST = 0; // Deactivate reset
    #10 TMS = 0; 
    #10 TMS = 1;
    #10 TMS = 1; 
    #10 TMS = 0 TDI = 0;  //shift ir
    #10 TDI = 1;
    #10 TMS = 1
    #10 TMS = 1;
    #10 TMS = 1;
    #10 TMS = 0;
    #10 TMS = 0; // shift dr
    #10 TDI = 1;
    #10 TDI = 0;
    #10 TDI = 0;
    #10 TDI = 1;
    #10 TMS = 1;
    #10 TMS = 1;
    #10 TMS = 1;

    // Finish simulation
    #50 $finish;
  end

endmodule