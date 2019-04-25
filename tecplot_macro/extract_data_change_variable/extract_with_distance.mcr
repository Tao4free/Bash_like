#!MC 1400

# Check wheather the variable will be used exist or not
$!VARSET |DISNUM| = 0 
$!LOOP |NUMVARS|
$!ADDONCOMMAND ADDONID='extendmcr'
  COMMAND='QUERY.VARNAMEBYNUM |LOOP| name' 
$!IF "|name|" == "DIS"
#$!PAUSE "The no.|LOOP| variable name is |name| !"
# Set the dis number of variables
$!VARSET |DISNUM| = |LOOP| 
#$!PAUSE "current number of this layout: |DISNUM|"
$!ENDIF
$!ENDLOOP

# If 'DIS' does not exit, increase the variable index
$!IF |DISNUM| == 0
# Set the dis number of variables
$!VARSET |DISNUM| = (|NUMVARS| + 1) 
$!ENDIF


# Get parameter from gui
$!PROMPTFORTEXTSTRING |DIREC|
     INSTRUCTIONS = "Enter the direction you want to Show ( I : 1, J : 2) : "

$!IF |DIREC| == 1
$!PAUSE "You will edit the I direction"
$!PROMPTFORTEXTSTRING |ITAR|
     INSTRUCTIONS = "Enter the target I (1-|MAXI|): "
$!ELSEIF |DIREC| == 2
$!PAUSE "You will edit the J direction"
$!PROMPTFORTEXTSTRING |JTAR|
     INSTRUCTIONS = "Enter the target J (1-|MAXJ|): "
$!ELSE
$!PAUSE "Please input number 1 or 2"
$!ENDIF


# Check value I=2,J=3,K=2
$!VARSET |IndexX|  = ( 2 + |MAXI|*(3-1) + |MAXI|*|MAXJ|*(2-1) )
$!GetFieldValue |ValueX| 
  Zone    = 1 
  Var     = 1 
  Index   = |IndexX|
$!PAUSE "I = 2, J = 3, K =2, X = |ValueX|"

# Make the variable to calculate distance between two nodes
$!IF |DIREC| == 1
$!ALTERDATA 
   EQUATION  "{DIS} = sqrt((X(i,j,k)-X(i,j-1,k))**2 + (Y(i,j,k)-Y(i,j-1,k))**2)"
$!ELSEIF |DIREC| == 2
$!ALTERDATA 
   EQUATION  "{DIS} = sqrt((X(i,j,k)-X(i-1,j,k))**2 + (Y(i,j,k)-Y(i-1,j,k))**2)"
$!ENDIF

#$!PAUSE "MAXI = |MAXI|, MAXJ = |MAXJ|, MAXK =|MAXK|"

$!VARSET |KNUM| = |MAXK|
$!VARSET |JNUM| = |MAXJ|
$!VARSET |INUM| = |MAXI|
$!IF |DIREC| == 1
$!VARSET |INUM| = 1
$!ELSEIF |DIREC| == 2
$!VARSET |JNUM| = 1
$!ENDIF

$!LOOP |KNUM|
$!VARSET |K| = |LOOP|
$!LOOP |JNUM|
$!IF |DIREC| == 2
$!VARSET |J| = |JTAR|
$!ELSE
$!VARSET |J| = |LOOP|
$!ENDIF
$!LOOP |INUM|
$!IF |DIREC| == 1
$!VARSET |I| = |ITAR|
$!ELSE
$!VARSET |I| = |LOOP|
$!ENDIF

# Reline the I direction 
$!IF |DIREC| ==1
  $!VARSET |Index|  = ( |I| + |MAXI|*(|J|-1) + |MAXI|*|MAXJ|*(|K|-1) )
  $!VARSET |Index0| = ( |I| + |MAXI|*|MAXJ|*(|K|-1) )
  $!IF |J| == 1 
    $!VARSET |Index1| = ( |I| + |MAXI|*(|J|-1) + |MAXI|*|MAXJ|*(|K|-1) )
  $!ELSE
    $!VARSET |Index1| = ( |I| + |MAXI|*(|J|-2) + |MAXI|*|MAXJ|*(|K|-1) )
  $!ENDIF

  # Get the first x coordinate of each J direction 
  $!GetFieldValue |Value0| 
    Zone    = 1 
    Var     = 1 
    Index   = |Index0|

  # Get the y coordinate of I(J-1)K 
  $!GetFieldValue |Value1| 
    Zone    = 1 
    Var     = 2 
    Index   = |Index1|

  # Get the DIS of IJK 
  $!GetFieldValue |Value| 
    Zone    = 1 
    Var     = |DISNUM| 
    Index   = |Index|

  #$!PAUSE "I = |I|, J = |J|, K =|K|, X0 = |Value0|, DIS = |Value|"

  $!VARSET |D| = ( |Value| + |Value1| )
  #$!IF |J| == 2 
  #  $!PAUSE "I = |I|, J = |J|, K =|K|, X0 = |Value0|, D = |D|"
  #$!ENDIF

  # Set x as the first x coordinate of each J direction 
  $!SETFIELDVALUE 
    ZONE = 1
    VAR = 1
    INDEX = |Index|
    FIELDVALUE = |Value0|

  # Set the y coordinate of IJK 
  $!SETFIELDVALUE 
    ZONE = 1
    VAR = 2
    INDEX = |Index|
    FIELDVALUE = |D| 
$!ENDIF

# Reline the J direction 
$!IF |DIREC| ==2
  $!VARSET |Index|  = ( |I| + |MAXI|*(|J|-1) + |MAXI|*|MAXJ|*(|K|-1) )
  $!VARSET |Index0| = (  1  + |MAXI|*(|J|-1) + |MAXI|*|MAXJ|*(|K|-1) )
  $!IF |I| == 1 
    $!VARSET |Index1| = ( |I|     + |MAXI|*(|J|-1) + |MAXI|*|MAXJ|*(|K|-1) )
  $!ELSE
    $!VARSET |Index1| = ( |I| - 1 + |MAXI|*(|J|-1) + |MAXI|*|MAXJ|*(|K|-1) )
  $!ENDIF

  # Get the first y coordinate of each I direction 
  $!GetFieldValue |Value0| 
    Zone    = 1 
    Var     = 2 
    Index   = |Index0|

  # Get the x coordinate of (I-1)JK 
  $!GetFieldValue |Value1| 
    Zone    = 1 
    Var     = 1 
    Index   = |Index1|

  # Get the DIS of IJK 
  $!GetFieldValue |Value| 
    Zone    = 1 
    Var     = |DISNUM| 
    Index   = |Index|

  #$!PAUSE "I = |I|, J = |J|, K =|K|, X0 = |Value0|, DIS = |Value|"

  # Get the current node coordinate using the distance between two nodes
  $!VARSET |D| = ( |Value| + |Value1| )

  # Set y as the first y coordinate of each I direction 
  $!SETFIELDVALUE 
    ZONE = 1
    VAR = 2
    INDEX = |Index|
    FIELDVALUE = |Value0|

  # Set the x coordinate of IJK 
  $!SETFIELDVALUE 
    ZONE = 1
    VAR = 1
    INDEX = |Index|
    FIELDVALUE = |D| 
$!ENDIF

$!ENDLOOP
$!ENDLOOP
$!ENDLOOP


# Check value I=2,J=3,K=2
$!VARSET |IndexX|  = ( 2 + |MAXI|*(3-1) + |MAXI|*|MAXJ|*(2-1) )
$!GetFieldValue |ValueX| 
  Zone    = 1 
  Var     = 1 
  Index   = |IndexX|
$!PAUSE "I = 2, J = 3, K =2, X = |ValueX|"

