#!MC 1100
#-----------------------------------------------------------------------
# Setup some parameter for png export
$!EXPORTSETUP EXPORTFORMAT = PNG
$!EXPORTSETUP IMAGEWIDTH = 3000
$!EXPORTSETUP USESUPERSAMPLEANTIALIASING = YES
$!EXPORTSETUP SUPERSAMPLEFACTOR = 2
$!EXPORTSETUP CONVERTTO256COLORS = YES
#-----------------------------------------------------------------------
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
$!EXPORTSETUP EXPORTFNAME = './img/file_|LOOP%03d|.png'
$!EXPORT 
  EXPORTREGION = CURRENTFRAME
#------------------------------------------------------------------------
$!ENDLOOP

# http://www.tecplottalk.com/forums/addons/ExtendTimeMcr/
