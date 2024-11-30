add clocks 0 CK

set test cycle 2
setup pin strobes 1

set system mode fault

set pattern source external s27_scan.ascii

set hypertrophic limit off
add faults -all

run

report statistics
write faults faults.txt -replace