#!MC 1410

$!VARSET |nvars| = |NUMVARS|
#$!PAUSE "Current data contains |nvars| variables!"
$!VARSET |nzones| = |NUMZONES|
#$!PAUSE "Current data contains |nzones| zones!"
$!VARSET |polttype| = |PLOTTYPE|
#$!PAUSE "Plottype of this frame is |plottype|!"

#$!PAUSE "|MAXI|, |MAXJ|, |MAXK|"

#$!LOOP |nvars|
#$!VARSET |varname| = "|VARNAME|"
#$!PAUSE "|LOOP| variable is |varname|!"
#$!ENDLOOP

# https://kb.tecplot.com/2009/09/24/add-streamtraces-by-ijk/
## These variables define the IJK starting position:
$!VARSET |Istart| = 3
$!VARSET |Jstart| = 4
$!VARSET |Kstart| = 3
## Since $!$GETFIELDVALUE only accepts 1D arrays for
## the index this function converts IJK into a 1D index value:
$!VARSET |1DArrayIndex| = ( |Istart| + |MAXI|*(|Jstart|-1) + |MAXI|*|MAXJ|*(|Kstart|-1) )
## These 3 $!GETFIELDVALUES assume that variables 1 
##2 and 3 are your X Y and Z axis variables:
$!GETFIELDVALUE |Xstart| VAR = 1 ZONE = 1 INDEX = |1DArrayIndex|
$!GETFIELDVALUE |Ystart| VAR = 2 ZONE = 1 INDEX = |1DArrayIndex|
$!GETFIELDVALUE |Zstart| VAR = 3 ZONE = 1 INDEX = |1DArrayIndex|
$!PAUSE "|Xstart|, |Ystart|, |Zstart|"
