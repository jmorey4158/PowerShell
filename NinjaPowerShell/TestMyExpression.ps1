. .\Trace-MyExpressionToHost.ps1

[string[]]$exp = "& { [ValidateRange(1,10)]$b = 42 }"

Trace-MyExpressionToHost -Expression $exp -CallStack

