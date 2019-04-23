#!MC 1100
#-----------------------------------------------------------------------
$!EXPORTSETUP EXPORTFORMAT = PNG
$!EXPORTSETUP IMAGEWIDTH = 3000
$!EXPORTSETUP USESUPERSAMPLEANTIALIASING = YES
$!EXPORTSETUP SUPERSAMPLEFACTOR = 2
$!EXPORTSETUP CONVERTTO256COLORS = YES
#-----------------------------------------------------------------------
$!VarSet |NAME| = '|$PNGNAME|'
$!ADDONCOMMAND ADDONID='Extend Time MCR' 
  COMMAND='QUERY.NUMTIMESTEPS NUMTIMESTEPS'
$!LOOP |NUMTIMESTEPS|

$!ADDONCOMMAND ADDONID='Extend Time MCR' 
  COMMAND='SET.CURTIMESTEP |LOOP|'
$!ADDONCOMMAND ADDONID='Extend Time MCR' 
  COMMAND='QUERY.TIMEATSTEP |LOOP| CURTIME'

#------------------------------------------------------------------------
$!ANIMATETIME 
  STARTTIME = |CURTIME|
  ENDTIME = |CURTIME|
  SKIP = 1
  CREATEMOVIEFILE = NO

$!EXPORTSETUP EXPORTFNAME = '|NAME|'
$!EXPORT 
  EXPORTREGION = CURRENTFRAME
#------------------------------------------------------------------------
$!ENDLOOP

# http://www.tecplottalk.com/forums/addons/ExtendTimeMcr/
