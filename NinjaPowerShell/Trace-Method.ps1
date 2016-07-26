
$good = Get-GoodInput
$bad =  Get-SmallBadInput

$sb = [ScriptBlock]::Create("Get-Method -Input $good"),[ScriptBlock]::Create("Get-Method -Input $bad"),

#"Trace-Command Get-GoodInput"

#trace-command -name RunspaceInit,metadata,parameterbinding,cmdlet,Modules,CommandDiscovery,ConsoleHostRunspaceInit,InternalDeserializer,MemberResolution -expression {Get-GoodInput} -pshost

#"

#Trace-Command Get-Method Good"
#trace-command -name RunspaceInit,metadata,parameterbinding,cmdlet,Modules,CommandDiscovery,ConsoleHostRunspaceInit,InternalDeserializer,MemberResolution -expression {Get-Method -Input $good} -pshost

#"

#Trace-Command Get-Method Bad"
#trace-command -name RunspaceInit,metadata,parameterbinding,cmdlet,Modules,CommandDiscovery,ConsoleHostRunspaceInit,InternalDeserializer,MemberResolution -expression {Get-Method $bad} -pshost


#"

#Trace-Command -All Get-Method Good"
#trace-command -name CmdletProviderClasses,CmdletProviderContext,CommandDiscovery,CommandSearch,ConsoleControl,ConsoleHost,ConsoleHostRunspaceInit,ConsoleHostUserInterface,ConsoleLineOutput,DisplayDataQuery,ETS,FileSystemProvider,FormatFileLoading,FormatInfoDataClassFactory,FormatViewBinding,InternalDeserializer,LocationGlobber,MemberResolution,Modules,MshSnapinLoadUnload,ParameterBinderBase,ParameterBinderController,ParameterBinding,PathResolution,PSDriveInfo,PSSnapInLoadUnload,RegistryProvider,RunspaceInit,SessionState,SessionStateProvider,TypeConversion,TypeMatch -expression {Get-Method -Input $good} -pshost



"
CmdletProviderClasses"
trace-command -name CmdletProviderClasses -expression {Get-Method -Input $bad} -pshost

"
CmdletProviderContext"
trace-command -name CmdletProviderContext -expression {Get-Method -Input $bad} -pshost

"
CommandDiscovery"
trace-command -name CommandDiscovery -expression {Get-Method -Input $bad} -pshost

"
CommandSearch"
trace-command -name CommandSearch -expression {Get-Method -Input $bad} -pshost

"
InternalDeserializer"
trace-command -name InternalDeserializer -expression {Get-Method -Input $bad} -pshost

"
MemberResolution"
trace-command -name MemberResolution -expression {Get-Method -Input $bad} -pshost

"
MshSnapinLoadUnload"
trace-command -name MshSnapinLoadUnload -expression {Get-Method -Input $bad} -pshost

"
ParameterBinderBase"
trace-command -name ParameterBinderBase -expression {Get-Method -Input $bad} -pshost

"
ParameterBinderController"
trace-command -name ParameterBinderController -expression {Get-Method -Input $bad} -pshost

"
ParameterBinding"
trace-command -name ParameterBinding -expression {Get-Method -Input $bad} -pshost


"
RunspaceInit"
trace-command -name RunspaceInit -expression {Get-Method -Input $bad} -pshost

"
SessionState"
trace-command -name SessionState -expression {Get-Method -Input $bad} -pshost

"
SessionStateProvider"
trace-command -name SessionStateProvider -expression {Get-Method -Input $bad} -pshost

"
TypeConversion"
trace-command -name TypeConversion -expression {Get-Method -Input $bad} -pshost

"
TypeMatch"
trace-command -name TypeMatch -expression {Get-Method -Input $bad} -pshost