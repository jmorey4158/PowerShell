



function MeasureExpression ($exp)
{
    $path = "<DELETED>\WindowsPowerShell\Modules\TraceResults\Measure-Expression_" + (Get-Date).Ticks + ".txt"
    $intro = "MEASURE-COMMAND FOR THE FOLLOWING EXPRESSIONS: "
    $end = "COMPLETED MEASURE-COMMAND FOR THE EXPRESSIONS"
    $space = "
    "
    Out-File -FilePath $path -Encoding default -Append -InputObject $intro 
    Out-File -FilePath $path -Encoding default -Append -InputObject $space 


    foreach($e in $exp)
    {
        $out = "MEASURING: " + $e

        $sb = [ScriptBlock]::Create($e)

        $out = $out + " - " + (measure-command -expression $sb).Ticks.ToString()
        Out-File -FilePath $path -Encoding default -Append -InputObject $out   
    }

    Out-File -FilePath $path -Encoding default -Append -InputObject $space
    Out-File -FilePath $path -Encoding default -Append -InputObject $end
}
