//TRAP     JOB MSGLEVEL=1,CLASS=S,MSGCLASS=S
/*ROUTE PRINT YOURND(YOURID)
/*ROUTE PUNCH YOURND(YOURID)
//STEP1  EXEC PGM=TRAPGB,REGION=90M
//STEPLIB  DD DSN=ACP.LINK.ZCUR.BSS,DISP=SHR
//***********************************
//* Input from a file system file
//***********************************
//DATAIN   DD PATH='/u/myfile/ei.out',
//         PATHOPTS=(ORDONLY)
//***********************************
//* Input from a general tape
//***********************************
//*DATAIN   DD DSN=GEN.TAPE,
//*            UNIT=VTAPE,DISP=(OLD,PASS),
//*            VOL=SER=A00099,
//*            DCB=OPTCD=B
//***********************************
//* Input from an RTA tape
//***********************************
//*DATAIN   DD DSN=RTA.TAPE,UNIT=(VTAPE,,DEFER),LABEL=(,SL),
//*         VOL=SER=A00280,DISP=(OLD,KEEP),DCB=OPTCD=B
//*** END OF INPUT STATEMENTS *******
//NUCL     DD DUMMY
//TMEIIN   DD  UNIT=SYSDA,DCB=(BLKSIZE=0,LRECL=132,RECFM=FB),
//         SPACE=(TRK,(500,100),RLSE)
//TMEIOUT  DD  DSN=*.TMEIIN,DISP=(OLD,PASS),VOL=REF=*.TMEIIN
//EIAPIN   DD  UNIT=SYSDA,DCB=(BLKSIZE=0,LRECL=9,RECFM=FB),
//         SPACE=(TRK,(10,5),RLSE)
//EIAPOUT  DD  DSN=*.EIAPIN,DISP=(OLD,PASS),VOL=REF=*.EIAPIN
//TMMAIN   DD  UNIT=SYSDA,DCB=(BLKSIZE=0,LRECL=64,RECFM=FB),
//         SPACE=(TRK,(50,25),RLSE)
//TMMAOUT  DD  DSN=*.TMMAIN,DISP=(OLD,PASS),VOL=REF=*.TMMAIN
//TM12IN   DD  UNIT=SYSDA,DCB=(BLKSIZE=0,LRECL=52,RECFM=FB),
//         SPACE=(TRK,(50,5),RLSE)
//MA12IN   DD  UNIT=SYSDA,DCB=(BLKSIZE=0,LRECL=52,RECFM=FB),
//         SPACE=(TRK,(50,5),RLSE)
//MA12OUT  DD  DSN=*.MA12IN,DISP=(OLD,PASS),VOL=REF=*.MA12IN
//SU12IN   DD  UNIT=SYSDA,DCB=(BLKSIZE=0,LRECL=80,RECFM=FB),
//         SPACE=(TRK,(50,5),RLSE)
//SU12OUT  DD  DSN=*.SU12IN,DISP=(OLD,PASS),VOL=REF=*.SU12IN
//GROUPS   DD DUMMY
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//OPTRPT   DD SYSOUT=*
//DATASUM  DD SYSOUT=*
//CONTENTS DD SYSOUT=*
//GRPRPT   DD SYSOUT=*
//SUMMRY   DD SYSOUT=*
//DETAIL   DD SYSOUT=*
//RESOURCE DD SYSOUT=*
//OPTIONS DD *
RUN TYPE EI
RUN NO 1
DETAIL YES
COMP YES
/*
//                              