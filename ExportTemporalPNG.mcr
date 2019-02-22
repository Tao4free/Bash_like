#!MC 1100
#refer: https://gist.github.com/xuaoxiqi/9855202
#-----------------------------------------------------------------------
$!EXPORTSETUP EXPORTFORMAT = PNG
$!EXPORTSETUP IMAGEWIDTH = 300
#-----------------------------------------------------------------------
$!VarSet |T0| =9.9583333332

$!VarSet |NumLoop| =49
$!Loop |NumLoop|
$!Varset |num| = ( |Loop| * 1+0)   

$!VarSet |Q| =( |num| / 3 )
$!VarSet |P| =( |Q%d| * 3 )
$!VarSet |M| =( |num%d| - |P%d| )

$!IF |M| == 0
$!VarSet |T0| = (|T0| + 0.0416666666)
$!ELSE
$!VarSet |T0| = (|T0| + 0.0416666667)
$!ENDIF
#------------------------------------------------------------------------
$!ANIMATETIME 
  STARTTIME = |T0|
  ENDTIME = |T0|
  SKIP = 1
  CREATEMOVIEFILE = NO

$!EXPORTSETUP USESUPERSAMPLEANTIALIASING = YES
$!EXPORTSETUP CONVERTTO256COLORS = YES
$!EXPORTSETUP EXPORTFNAME = './img/file_|num%02d|.png'
$!EXPORT 
  EXPORTREGION = CURRENTFRAME
#-------------------------------------------------------------------------
$!EndLoop
