#!MC 1400

#$!VARSET |nvars| = |NUMVARS|
#$!PAUSE "Current data contains |nvars| variables!"
#$!VARSET |nzones| = |NUMZONES|
#$!PAUSE "Current data contains |nzones| zones!"
#$!VARSET |polttype| = |PLOTTYPE|
#$!PAUSE "Plottype of this frame is |plottype|!"

#$!PAUSE "|MAXI|, |MAXJ|, |MAXK|"

#$!LOOP |nvars|
#$!VARSET |varname| = "|VARNAME|"
#$!PAUSE "|LOOP| variable is |varname|!"
#$!ENDLOOP

# https://kb.tecplot.com/2009/09/24/add-streamtraces-by-ijk/
## These variables define the IJK starting position:
#$!VARSET |Istart| = 3
#$!VARSET |Jstart| = 4
#$!VARSET |Kstart| = 3
## Since $!$GETFIELDVALUE only accepts 1D arrays for
## the index this function converts IJK into a 1D index value:
#$!VARSET |1DArrayIndex| = ( |Istart| + |MAXI|*(|Jstart|-1) + |MAXI|*|MAXJ|*(|Kstart|-1) )
## These 3 $!GETFIELDVALUES assume that variables 1 
##2 and 3 are your X Y and Z axis variables:
#$!GETFIELDVALUE |Xstart| VAR = 1 ZONE = 1 INDEX = |1DArrayIndex|
#$!GETFIELDVALUE |Ystart| VAR = 2 ZONE = 1 INDEX = |1DArrayIndex|
#$!GETFIELDVALUE |Zstart| VAR = 3 ZONE = 1 INDEX = |1DArrayIndex|
#$!GETFIELDVALUE |Dstart| VAR = 4 ZONE = 1 INDEX = |1DArrayIndex|
#$!PAUSE "|Xstart|, |Ystart|, |Zstart|, |Dstart|"

$!DUPLICATEZONE
  SOURCEZONE = 1
  DESTINATIONZONE = 2
  IRANGE
    {
    MIN = 48
    MAX = 49
    }


$!WRITEDATASET  "try_01.plt"
  INCLUDETEXT = NO
  INCLUDEGEOM = NO
  INCLUDECUSTOMLABELS = NO
  ASSOCIATELAYOUTWITHDATAFILE = NO
  ZONELIST =  [2]
  BINARY = YES
  USEPOINTFORMAT = NO
  PRECISION = 9
  TECPLOTVERSIONTOWRITE = TECPLOTCURRENT

#$!DUPLICATEZONE
#  SOURCEZONE = 1
#  DESTINATIONZONE = 2
#  IRANGE
#    {
#    MIN = 2
#    MAX = 3
#    }
#  JRANGE
#    {
#    MAX = 4
#    }
#  KRANGE
#    {
#    MAX = 3
#    }

#$!ACTIVEFIELDMAPS -= [1]
#$!ACTIVEFIELDMAPS += [2]

$!VARSET |DISNUM| = (|NUMVARS| + 1)
#$!PAUSE "DIS num = |DISNUM|"

$!ALTERDATA 
   EQUATION  "{DIS} = sqrt((X(i,j,k)-X(i,1,k))**2 + (Y(i,j,k)-Y(i,1,k))**2)"


#$!PAUSE "MAXI = |MAXI|, MAXJ = |MAXJ|, MAXK =|MAXK|"

$!VARSET |II| = 2
$!LOOP |MAXK|
$!VARSET |K| = |LOOP|
$!LOOP |MAXJ|
$!VARSET |J| = |LOOP|
$!LOOP |II|
$!VARSET |I| = |LOOP|

$!VARSET |Index|  = ( |I| + |II|*(|J|-1) + |II|*|MAXJ|*(|K|-1) )
$!VARSET |Index0| = ( |I| + |II|*|MAXJ|*(|K|-1) )
$!GetFieldValue |ValueI| 
  Zone    = 2 
  Var   = 1 
  Index   = |Index0|
$!GetFieldValue |Value| 
  Zone    = 2 
  Var   = |DISNUM| 
  Index   = |Index|
#$!PAUSE "I = |I|, J = |J|, K =|K|, X0 = |ValueI|, DIS = |Value|"
$!SETFIELDVALUE 
  ZONE = 2
  VAR = 1
  INDEX = |Index|
  FIELDVALUE = |ValueI|
$!SETFIELDVALUE 
  ZONE = 2
  VAR = 2
  INDEX = |Index|
  FIELDVALUE = |Value| 

$!ENDLOOP
$!ENDLOOP
$!ENDLOOP





