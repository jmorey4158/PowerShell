

function TraceExpression ($exp)
{
    $back = [System.Console]::BackgroundColor

    $traceOptions = "ParameterBinderBase","ParameterBinding"

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

        foreach($to in $traceOptions)
        {
            "
            $to"
            trace-command -name $to -expression $sb -ListenerOption Callstack -PSHost
            
        }
        Out-File -FilePath $path -Encoding default -Append -InputObject $space
    }
    Out-File -FilePath $path -Encoding default -Append -InputObject $space
    Out-File -FilePath $path -Encoding default -Append -InputObject $end
}