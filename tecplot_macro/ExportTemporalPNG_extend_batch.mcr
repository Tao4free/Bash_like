#!MC 1100
#-----------------------------------------------------------------------
$!EXPORTSETUP EXPORTFORMAT = PNG
$!EXPORTSETUP IMAGEWIDTH = 3000
$!EXPORTSETUP USESUPERSAMPLEANTIALIASING = YES
$!EXPORTSETUP SUPERSAMPLEFACTOR = 2
$!EXPORTSETUP CONVERTTO256COLORS = YES
#-----------------------------------------------------------------------
# Take the output png name from environment variable
$!VarSet |NAME| = '|$PNGNAME|'

# Get number of steps in data
$!ADDONCOMMAND ADDONID='Extend Time MCR' 
  COMMAND='QUERY.NUMTIMESTEPS NUMTIMESTEPS'

# Start loop
$!LOOP |NUMTIMESTEPS|

# Get the current time step no.
$!ADDONCOMMAND ADDONID='Extend Time MCR' 
  COMMAND='SET.CURTIMESTEP |LOOP|'

# Get the current time
$!ADDONCOMMAND ADDONID='Extend Time MCR' 
  COMMAND='QUERY.TIMEATSTEP |LOOP| CURTIME'

#------------------------------------------------------------------------
# Export time frame control if needed
$!ANIMATETIME 
  STARTTIME = |CURTIME|
  ENDTIME = |CURTIME|
  SKIP = 1
  CREATEMOVIEFILE = NO

# Export path and operation
$!EXPORTSETUP EXPORTFNAME = '|NAME|'
$!EXPORT 
  EXPORTREGION = CURRENTFRAME
#------------------------------------------------------------------------
$!ENDLOOP

# http://www.tecplottalk.com/forums/addons/ExtendTimeMcr/
