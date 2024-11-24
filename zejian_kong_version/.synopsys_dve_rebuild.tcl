# DVE Simulation Rebuild/Restart Options
# Saved on Sat Nov 23 21:03:43 2024
set SIMSETUP::REBUILDOPTION 1
set SIMSETUP::REBUILDCMD {vcs -sverilog -R -top top_tb -debug_access+all  TAP.v top_tb.v boundary_cell.v instruction_decode.v instruction_register.v library.v s9234_scan.v Top.v }
set SIMSETUP::REBUILDDIR {}
set SIMSETUP::RESTOREBP 1
set SIMSETUP::RESTOREDUMP 1
set SIMSETUP::RESTOREFORCE 1
set SIMSETUP::RESTORESPECMAN 0
