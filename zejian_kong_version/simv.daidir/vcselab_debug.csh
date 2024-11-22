#!/bin/csh -f

cd /afs/ece.cmu.edu/usr/zejiank/Private/ece765/project5_f24/zejian_kong_version

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/afs/ece/support/synopsys/synopsys.release/T-Foundation/vcs/T-2022.06/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

