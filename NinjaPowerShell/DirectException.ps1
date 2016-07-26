Set-psdebug -trace 2
Set-StrictMode -Version Latest

$good = Get-GoodInput
$bad = "lksdjfdslfj"

$exp = "Get-ClassValidation -Input $bad -Limit 1", "Get-ClassValidation -Input $good -Limit 1"


try
   {
      Get-ClassValidation -Input $bad -Limit 1
   }
catch
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



set-psdebug -off