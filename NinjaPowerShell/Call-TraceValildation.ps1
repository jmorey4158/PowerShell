. .\Function-TraceExpression.ps1


$bad = "Junk"
$good = [guid]::NewGuid()

$exp = "Test-Validation","Test-Validation -Input","Test-Validation -Input $good","Test-Validation -Input $bad"
#$exp += "Get-NoValidation -Input "" -Limit 1"
#$exp += "Get-NoValidation -Input $bad -Limit 1"
#$exp += "Get-NoValidation -Input $good -Limit 1"
#$exp += "Get-MethodValidation -Input -Limit 1"
#$exp += "Get-MethodValidation -Input $bad -Limit 1"
#$exp += "Get-MethodValidation -Input $good -Limit 1"
#$exp += "Get-NullValidation"
#$exp += "Get-NullValidation -Input -Limit 1"
#$exp += "Get-NullValidation -Input "" -Limit 1"
#$exp += "Get-NullValidation -Input $bad -Limit 1"
#$exp += "Get-NullValidation -Input $good -Limit 1"
#$exp += "Get-ClassValidation"
#$exp += "Get-ClassValidation -Input "" -Limit 1"
#$exp += "Get-ClassValidation -Input -Limit 1"
$exp += "Get-ClassValidation -Input $bad -Limit 1"
#$exp += "Get-ClassValidation -Input $good -Limit 1"


TraceExpression($exp) 