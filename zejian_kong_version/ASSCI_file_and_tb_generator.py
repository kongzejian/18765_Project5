cycle = 0
import copy
def command_generator(TDI, TMS,TRST, file,TDO="X",measured_values="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", mode =1):
    global cycle
    global tb
    output =""
    output+="    CYCLE = " + str(cycle) + ";\n"
    if mode == 1:
        output+="    force   \"ibus\" \"00"+str(TDI)+str(TMS)+str(TRST)+'1'
        output+="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\" 0;\n"
        output+="    force   \"ibus\" \"01"+str(TDI)+str(TMS)+str(TRST)+'1'
    elif mode == 0:
        output += "    force   \"ibus\" \"00" + str(TDI) + str(TMS) + str(TRST) + '0'
        output += "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\" 0;\n"
        output += "    force   \"ibus\" \"10" + str(TDI) + str(TMS) + str(TRST) + '0'
    tb += "#1 TCK = 0;\n"
    tb += "CK = 0;\n"
    if mode == 1:
        tb += "mode = 1;\n"
    else:
        tb += "mode = 0;\n"
    tb += "TDI = "+str(TDI)+";\n"
    tb += "TMS = " + str(TMS) + ";\n"
    tb += "TRST = " + str(TRST) + ";\n"

    if mode == 1:
        tb += "#1 TCK = 1;\n"
        tb += "CK = 0;\n"
    else:
        tb += "#1 TCK = 0;\n"
        tb += "CK = 1;\n"
    tb += "TDI = " + str(TDI) + ";\n"
    tb += "TMS = " + str(TMS) + ";\n"
    tb += "TRST = " + str(TRST) + ";\n"


    output+="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\" 1;\n"
    output+="    measure \"obus\" "
    output+= "\""+str(TDO)+measured_values+"\""
    output+= " 2;\n"
    output+="\n"
    cycle +=1
    file.write(output)

idle_to_capture_ir = "110"
shift_ir_to_capture_dr = "1110"
shift_dr_to_capture_ir = "11110"
shift_dr_to_idle = "111110"
reset_to_capture_ir = "0110"

def programe_ir(command ,file):
    if command == "internal scan":
        command_generator(1, 0, 0, file)
        command_generator(1, 0, 0, file)
    elif command == "boundary scan":
        command_generator(0, 0, 0, file)
        command_generator(1, 0, 0, file)
def state_transition(state, file):
    global cycle
    state = list(state)
    for tms in state:
        command_generator("X", tms, 0, file)

all_patterns = []
pattern_index = 0
with open("source.txt", "r") as source_file:
    line_count = 1
    for line in source_file:
        if ":" not in line:
            continue
        else:
            string_list = line.split()
            if line_count == 212:
                line_count = 1
                hash_table["boundary_in"].extend(reversed(list(string_list[5])))  # shift in primary input data
                hash_table["boundary_out"].extend(reversed(list(string_list[6])))
                hash_table["scan_out"].append(string_list[4])
                all_patterns.append(copy.deepcopy(hash_table))
                pattern_index += 1
            else:
                if line_count == 1:
                    hash_table = {
                        "scan_in": [],
                        "boundary_in": [],
                        "scan_out": [],
                        "boundary_out": [],
                    }

                hash_table["scan_in"].append(string_list[3])  # shift in scan chain data
                if pattern_index != 0 and string_list[4] != "X":
                    all_patterns[pattern_index - 1]["scan_out"].append(string_list[4])
                line_count += 1
tb = ""
with open("control_files","w") as file:
    #reset
    command_generator("X",0,1,file)
    #idle->capture ir
    state_transition(reset_to_capture_ir, file)
    for test_pattern_index in range(len(all_patterns)):
        if test_pattern_index == 0:
            programe_ir("boundary scan", file)
            state_transition(shift_ir_to_capture_dr, file)
            for shift_data in all_patterns[test_pattern_index]["boundary_in"]:
                print(shift_data)
                command_generator(shift_data, 0, 0, file)
            state_transition(shift_dr_to_capture_ir, file)
            programe_ir("internal scan", file)
            state_transition(shift_ir_to_capture_dr, file)
            for shift_data in all_patterns[test_pattern_index]["scan_in"]:
                command_generator(shift_data, 0, 0, file)
            state_transition(shift_dr_to_idle, file)
            # normal mode
            command_generator('X', '1', '0', file, TDO="X", measured_values="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                              mode=0)
            state_transition(idle_to_capture_ir, file)
        else:
            programe_ir("boundary scan", file)
            state_transition(shift_ir_to_capture_dr, file)
            for shift_data_index in range(len(all_patterns[test_pattern_index-1]["boundary_out"])):
                if shift_data_index <= 2:
                    command_generator("0", 0, 0, file,
                                      TDO=all_patterns[test_pattern_index]["boundary_out"][shift_data_index])
                else:
                    command_generator(all_patterns[test_pattern_index]["boundary_in"][shift_data_index -3], 0, 0, file,TDO=all_patterns[test_pattern_index]["boundary_out"][shift_data_index])
            state_transition(shift_dr_to_capture_ir, file)
            programe_ir("internal scan", file)
            state_transition(shift_ir_to_capture_dr, file)
            for shift_data, scan_out_data in zip(all_patterns[test_pattern_index]["scan_in"], all_patterns[test_pattern_index-1]["scan_out"]):
                command_generator(shift_data, 0, 0, file,TDO=scan_out_data)
            state_transition(shift_dr_to_idle, file)
            # normal mode
            command_generator('X', '1', '0', file, TDO="X", measured_values="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                              mode=0)
            state_transition(idle_to_capture_ir, file)
with open("tb","w") as o:
    o.write(tb)
with open("final_tb","w") as o:
    with open("tb","r") as i:
        for line in i:
            if 'X' in line:
                continue
            else:
                o.write(line)











