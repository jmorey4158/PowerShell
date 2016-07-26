


function SwapTrace ($exp)
{
    $back = [System.Console]::BackgroundColor
    $compShort1 = "CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion"
    $compShort2 = "TypeConversion","ParameterBinderBase","CommandDiscovery","ParameterBinding","ParameterBinderController"
    $path = "\\TK5-RED-MDS-08Z\MyDocs3\jmorey\Documents\WindowsPowerShell\Modules\TraceResults\SwapTrace_" + (Get-Date).Ticks + ".txt"
    $intro = "SWAPPING TRACE-COMMAND ORDER: "
    $end = "COMPLETED SWAPPING TRACE-COMMAND"
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

        trace-command -name CommandDiscovery,ParameterBinderBase,ParameterBinderController,ParameterBinding,TypeConversion -expression $sb  -FilePath $path
        Out-File -FilePath $path -Encoding default -Append -InputObject $space

        trace-command -name ParameterBinderBase,TypeConversion,ParameterBinderController,CommandDiscovery,ParameterBinding -expression $sb  -FilePath $path
           
    }
    Out-File -FilePath $path -Encoding default -Append -InputObject $space
    Out-File -FilePath $path -Encoding default -Append -InputObject $end
}