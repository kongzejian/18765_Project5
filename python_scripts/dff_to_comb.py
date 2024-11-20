# This program convert the sequential circuit to combinational circuit


import re
PI = []
PO = []
with open("../verilog/s9234.v", "r") as file:
        for line in file:
            match = re.search(r"\s+dff\s+(\w+)\((\w+),\w+,(\w+)\);\s+", line)
            if match:
                flip_flop_name = match.group(1)
                flip_flop_q = match.group(2)
                flip_flop_data = match.group(3)
                PI.append(flip_flop_q)
                PO.append(flip_flop_data)

with open("combo_inputs_outputs", "w") as file:
    file.write("Inputs:\n")
    for PI_index in range(len(PI)):
        file.write(PI[PI_index])
        if PI_index != len(PI) - 1:
            file.write(",")
        else:
            file.write("\n")
    file.write("Outputs:\n")
    for PO_index in range(len(PO)):
        file.write(PO[PO_index])
        if PO_index != len(PO) - 1:
            file.write(",")
        else:
            file.write("\n")