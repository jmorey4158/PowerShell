. .\Function-TraceExpression.ps1
. .\Function-MeasureExpression.ps1
. .\Function-SwapTrace.ps1


$good = Get-GoodInput
$bad = Get-SmallBadInput

$exp = "Test-None -Input $good","Test-None -Input $bad","Test-None -Input","Test-None"
$exp += "Test-Null -Input $good","Test-Null -Input $bad","Test-Null -Input","Test-Null"
$exp += "Test-Class -Input $good","Test-Class -Input $bad","Test-Class -Input","Test-Class"
$exp += "Test-MethodNull -Input $good","Test-MethodNull -Input $bad","Test-MethodNull -Input","Test-MethodNull"
$exp += "Test-MethodGUID -Input $good","Test-MethodNGUID -Input $bad","Test-MethodNGUID -Input","Test-MethodNGUID",""


TraceExpression($exp) 

MeasureExpression ($exp)

#SwapTrace ($exp)