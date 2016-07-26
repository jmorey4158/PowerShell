

function ShowException ($exp)
{
    ForEach ($e in $exp)
    {
        try
        {
            Invoke-Expression ($e)
        }
        catch [System.Exception]
        {

"RAW EXCEPTION:" 
$_


    "CategoryInfo:"
            $_.CategoryInfo
            "
            "


    "ErrorDetails:"
            $_.ErrorDetails
            "
            "


    "Exception:"
            $_.Exception
            "
            "

    "FullyQualifiedErrorId:"
            $_.FullyQualifiedErrorId
            "
            "


    "InvocationInfo:"
            $_.InvocationInfo
            "
            "


    "PipelineIterationInfo:"
            $_.PipelineIterationInfo
            "
            "

    "ScriptStackTrace: "
            $_.ScriptStackTrace
            "
            "

    "TargetObject:"
            $_.TargetObject
            "
            "

    "PSMessageDetails:"
            $_.PSMessageDetails
            "
            "
        }
    }
}