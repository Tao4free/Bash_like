#!MC 1400


$!VARSET |DISNUM| = (|NUMVARS| + 1)
$!PAUSE "DIS num = |DISNUM|"

$!PAUSE "MAXI = |MAXI|, MAXJ = |MAXJ|, MAXK =|MAXK|"
$!ACTIVEFIELDMAPS -= [1]
$!PAUSE "MAXI = |MAXI|, MAXJ = |MAXJ|, MAXK =|MAXK|"
$!ACTIVEFIELDMAPS += [2]
$!PAUSE "MAXI = |MAXI|, MAXJ = |MAXJ|, MAXK =|MAXK|"

