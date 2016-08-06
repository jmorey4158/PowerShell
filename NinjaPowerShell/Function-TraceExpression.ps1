
function TraceExpression ($exp)
{
    $back = [System.Console]::BackgroundColor
    $compShort = "CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion"
    $compShort2 = "CommandDiscovery","ParameterBinding"
    $compShort3 = "ParameterBinding"

    $path = "<DELETED>\WindowsPowerShell\Modules\TraceResults\Trace-Expression_" + (Get-Date).Ticks + ".txt"
    $intro = "TRACE-COMMAND FOR THE FOLLOWING EXPRESSIONS: "
    $end = "COMPLETED TRACE-COMMAND FOR THE EXPRESSIONS"
    $space = "
    "
    Out-File -FilePath $path -Encoding default -Append -InputObject $intro 
    Out-File -FilePath $path -Encoding default -Append -InputObject $space


    foreach($e in $exp)
    {
        $out = "TRACING: " + $e
        Out-File -FilePath $path -Encoding default -Append -InputObject  $out  
        Out-File -FilePath $path -Encoding default -Append -InputObject $space
        $sb = [ScriptBlock]::Create($e)
        [System.Console]::ForegroundColor = 'Red'
        [System.Console]::BackgroundColor = 'White'

    "
TRACING: $e"
         
        [System.Console]::ForegroundColor = 'White'
        [System.Console]::BackgroundColor = $back

        foreach($c in $compShort3)
        {
            "
            $c"
            trace-command -name $c -expression $sb  -FilePath $path -ListenerOption Callstack -Debugger
            
        }
        Out-File -FilePath $path -Encoding default -Append -InputObject $space
    }
    Out-File -FilePath $path -Encoding default -Append -InputObject $space
    Out-File -FilePath $path -Encoding default -Append -InputObject $end
}
