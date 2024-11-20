module boundary_cell(Systemdata, TDI, Clock, Update, TDO, Shift_or_Load, Test_or_Normal, out);
    input Systemdata, TDI, Clock, Update, Test_or_Normal, Shift_or_Load;
    output TDO, out;
    wire g1, g2, g3;
    MUX mux_1(g1, Systemdata, TDI, Shift_or_Load);
    MUX mux_2(out, Systemdata, g3, Test_or_Normal);
    dff DFF_1(g2, Clock, g1);
    dff DFF_2(g3, Update, g2);
    assign TDO = g2;
endmodule



