

module tapcontroller_tb;

   // Inputs
   reg TCK, TRST, TMS;

   // Outputs
   wire clockdr, shiftdr, updatedr, clockir, shiftir, updateir, select, bs_en;

   // Instantiate the Unit Under Test (UUT)
   tapcontroller uut(TCK, TRST, TMS, clockdr, shiftdr, updatedr, clockir,shiftir, updateir, select, bs_en);
   

   // Clock generation
   initial begin
      TCK = 0;
      TMS = 0;
      forever #5 TCK = ~TCK; // 10ns clock period
   end

   // Test sequence
   initial begin
      // Reset the TAP controller
      TRST = 1; // Assert reset
      #20 TRST = 0; // Deassert reset
      $display("Reset complete");

      // Sequence of TMS transitions to navigate the TAP state machine
      // Navigate to Shift-DR
      #10 TMS = 1; // run test or idle -> select dr scan
      #10 TMS = 0; // elect dr scan -> cpature fdr
      #10; // 等待1时间单位，确保组合逻辑更新完成

      $display("Entering Capture-DR");
      $display("capturedr: %b, expected: 1", clockdr);

      #10


      $display("Entering Shift-DR");
      $display("shiftdr: %b, expected: 1", shiftdr);

      #10 TMS = 1; // Shift-DR -> Exit1-DR
      #10 TMS = 1; // Exit1-DR -> Update-DR
      #1; // 等待1时间单位，确保组合逻辑更新完成

      $display("Entering Update-DR");
      $display("updatedr: %b, expected: 1", updatedr);

      #10 TMS = 1; 
      #10 TMS = 1; 
      #10 TMS = 0;
      #1; 

      $display("Entering capture-IR");
      #1 $display("capture ir: %b, expected: 1", clockir);
      #10 TMS = 0;
      #1; 
      $display("Entering shift-IR");
      $display("shift ir: %b, expected: 1", shiftir);


      #10 TMS = 1; 
      #10 TMS = 1;

      $display("Entering Update-IR");
      $display("updateir: %b, expected: 1", updateir);


      // Finish simulation
      #50 $stop;
   end

endmodule
