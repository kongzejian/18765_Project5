module dff_tb;
    reg data, clock, reset;
    wire q;

    dff_r uut (
        .data(data),
        .clock(clock),
        .reset(reset),
        .q(q)
    );

    initial begin
        
        clock = 0;
        reset = 1;

        
        forever #5 clock = ~clock;
    end

    initial begin
        
        #10 reset = 0; 
        #10 data = 1;  
        #20 data = 0;  
        #30 $stop;    
    end
endmodule


module dff_r (
    input wire data,        
    input wire clock,      
    input wire reset,       
    output wire q           
);
    wire reset_data;

    assign reset_data = reset ? 1'b0 : data;

    dff u1 (
        q,
        clock,
        reset_data
    );

endmodule


primitive dff(q, clock, data);
   output q; reg q;
   input  clock, data;

   table
      // obtain output on rising edge of clock
      // clock data q q+
      (01) 0 : ? : 0 ;
      (01) 1 : ? : 1 ;
      (0?) 1 : 1 : 1 ;
      (0?) 0 : 0 : 0 ;
      // ignore negative edge of clock
      F ? : ? : - ;
      // ignore data changes on steady clock
      ? (??) : ? : - ;
   endtable
endprimitive // dff