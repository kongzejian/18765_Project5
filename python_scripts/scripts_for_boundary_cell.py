inputs = "g89,g94,g98,g102,g107,g301,g306,g310,g314,g319,g557,g558,g559,g560,g561,g562,g563,g564,g705,g639,g567,g45,g42,g39,g702,g32,g38,g46,g36,g47,g40,g37,g41,g22,g44,g23"
outputs = "g2584,g3222,g3600,g4307,g4321,g4422,g4809,g5137,g5468,g5469,g5692,g6282,g6284,g6360,g6362,g6364,g6366,g6368,g6370,g6372,g6374,g6728,g1290,g4121,g4108,g4106,g4103,g1293,g4099,g4102,g4109,g4100,g4112,g4105,g4101,g4110,g4104,g4107,g4098"
inputs_list = inputs.split(',')
outputs_list = outputs.split(',')
with open("boundary_cells", "w") as file:
    file.write("Inputs:\n")
    for index in range(len(inputs_list)):
        file.write(inputs_list[index]+"_in")
        if index != len(inputs_list) - 1:
            file.write(",")
        else:
            file.write("\n")
    file.write("Outputs:\n")
    for index in range(len(outputs_list)):
        file.write(outputs_list[index]+"_out")
        if index != len(outputs_list) - 1:
            file.write(",")
        else:
            file.write("\n")
    boundary_cell_index = 0
    signals = []
    pre_tdo = ""
    for index in range(len(inputs_list)):
        boundary_cell_index += 1
        TDO = "boundary_cell_" + str(boundary_cell_index) + "_tdo"
        if boundary_cell_index == 1:
            TDI = "boundary_cell_tdi"
            pre_tdo = TDO
        else:
            TDI = pre_tdo
            pre_tdo = TDO
        signals.append(TDI)
        boundary_cell_string = "boundary_cell boundary_cell_"+str(boundary_cell_index)+"("
        boundary_cell_string += inputs_list[index]+"_in, "
        boundary_cell_string += TDI
        boundary_cell_string += ", clockdr_bs, updatedr_bs, "
        boundary_cell_string += TDO
        boundary_cell_string += ", shiftdr_bs, bs_en, "
        boundary_cell_string += inputs_list[index]+");"
        file.write(boundary_cell_string+"\n")
    for index in range(len(outputs_list)):
        boundary_cell_index += 1
        TDO = "boundary_cell_" + str(boundary_cell_index) + "_tdo"
        TDI = pre_tdo
        pre_tdo = TDO
        signals.append(TDI)
        boundary_cell_string = "boundary_cell boundary_cell_"+str(boundary_cell_index)+"("
        boundary_cell_string += outputs_list[index]+", "
        boundary_cell_string += TDI
        boundary_cell_string += " ,clockdr_bs, updatedr_bs, "
        boundary_cell_string += TDO
        boundary_cell_string += ", shiftdr_bs, bs_en, "
        boundary_cell_string += outputs_list[index]+"_out);"
        file.write(boundary_cell_string+"\n")
        if index == len(outputs_list) - 1:
            signals.append(TDO)
    for signal_index in range(len(signals)):
        if signal_index == len(signals) - 1:
            file.write(signals[signal_index])
        else:
            file.write(signals[signal_index]+",")
    #boundary_cell(Systemdata, TDI, Clock, Update, TDO, Shift_or_Load, Test_or_Normal, out);