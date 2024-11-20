if ( $?LM_LICENSE_FILE ) then
	setenv LM_LICENSE_FILE /afs/ece.cmu.edu/support/mgc/license.dat:$LM_LICENSE_FILE
else
	setenv LM_LICENSE_FILE /afs/ece.cmu.edu/support/mgc/license.dat
endif

setenv MGLS_LICENSE_FILE ${LM_LICENSE_FILE}
set TESSENT="/afs/ece.cmu.edu/support/mgc/mgc.release/tessent_2024_1/tessent_2024.1/bin/"
setenv PATH "${PATH}:${TESSENT}"
set FLEXTEST="/afs/ece/support/mgc/mgc.release/tessent_2022_1/bin/"
setenv PATH "${PATH}:${FLEXTEST}"
setenv SALT_LICENSE_SERVER="29000@siemens-lic.ece.local.cmu.edu;1717@siemens-lic.ece.local.cmu.edu"

