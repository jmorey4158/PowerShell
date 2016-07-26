
$good = Get-GoodInput
$bad =  Get-SmallBadInput
$now = Get-Date
$path = "\\TK5-RED-MDS-08Z\MyDocs3\jmorey\Documents\WindowsPowerShell\Modules\TestResults\Trace-Expression_" + "_" + $now.Ticks + ".txt"


$method = "None","ProcessRecord","Method","ClassAttribute","NullAttribute","NullAttributeFirst","NullAttributeSecond","NullAttributeAfter"

$exp = " -Input $good"," -Input $bad"," -Input"

$comp = "CmdletProviderClasses","CmdletProviderContext","CommandDiscovery","CommandSearch","ConsoleControl","ConsoleHost","ConsoleHostRunspaceInit","ConsoleHostUserInterface","ConsoleLineOutput","DisplayDataQuery","ETS","FileSystemProvider","FormatFileLoading","FormatInfoDataClassFactory","FormatViewBinding","InternalDeserializer","LocationGlobber","MemberResolution","Modules","MshSnapinLoadUnload","ParameterBinderBase","ParameterBinderController","ParameterBinding","PathResolution","PSDriveInfo","PSSnapInLoadUnload","RegistryProvider","RunspaceInit","SessionState","SessionStateProvider","TypeConversion","TypeMatch"
$compShort = "CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion"


#trace-command -name CmdletProviderClasses,CmdletProviderContext,CommandDiscovery,CommandSearch,ConsoleControl,ConsoleHost,ConsoleHostRunspaceInit,ConsoleHostUserInterface,ConsoleLineOutput,DisplayDataQuery,ETS,FileSystemProvider,FormatFileLoading,FormatInfoDataClassFactory,FormatViewBinding,InternalDeserializer,LocationGlobber,MemberResolution,Modules,MshSnapinLoadUnload,ParameterBinderBase,ParameterBinderController,ParameterBinding,PathResolution,PSDriveInfo,PSSnapInLoadUnload,RegistryProvider,RunspaceInit,SessionState,SessionStateProvider,TypeConversion,TypeMatch -expression {Get-Method -Input $good} -pshost


foreach($m in $method)
{
    foreach($e in $exp)
    {
        $sb = [ScriptBlock]::Create("Get-" + $m + $e)
    "
TRACING: $e ========================================"
        foreach($c in $compShort)
        {
            "
            $c"
            trace-command -name $c -expression $sb  -PSHost
        }
    }

}

