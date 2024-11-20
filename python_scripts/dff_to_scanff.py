# This program convert all flip flops to scan flip flops, and connect them in a chain


import re
all_flip_flops = []
with open("../../verilog/s9234.v", "r") as file:
    for line in file:
        match = re.search(r"\s+dff\s+(\w+)\((\w+),\w+,(\w+)\);\s+", line)
        if match:
            flip_flop = {}
            flip_flop_name = match.group(1)
            flip_flop_q = match.group(2)
            flip_flop_data = match.group(3)
            flip_flop["name"] = flip_flop_name
            flip_flop["q"] = flip_flop_q
            flip_flop["data"] = flip_flop_data
            all_flip_flops.append(flip_flop)

CLOCK = "CK"
SCAN_IN = "scan_in"
SCAN_OUT = "scan_out"
SCAN_ENA = "scan_en"

#scanff SFF_0(CK, G10, scan_in, scan_en, G5);
with open("flip_flops_chains", "w") as file:
       pre_flip_flop_q = SCAN_IN
       for flip_flop in all_flip_flops:
           dff_string = "scanff " + flip_flop["name"] + "(" + CLOCK + ", " + flip_flop["data"] + ", " + pre_flip_flop_q + ", " + SCAN_ENA + ", " + flip_flop["q"] + ");\n"
           pre_flip_flop_q = flip_flop["q"]
           file.write(dff_string)
with open("map_file", "w") as file:
    string_A = ""
    string_B = ""
    for flip_flop_index in range(len(all_flip_flops)):
        flip_flop = all_flip_flops[flip_flop_index]
        string_A += flip_flop["data"] + "+" + flip_flop["q"]
        string_B += flip_flop["data"]
        if flip_flop_index != len(all_flip_flops) - 1:
            string_A += ", "
            string_B += ", "
    file.write(string_A)
    file.write("\n\n")
    file.write(string_B)

