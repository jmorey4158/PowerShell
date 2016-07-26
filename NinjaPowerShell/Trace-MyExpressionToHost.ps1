

# FUNCTION: Trace-MyExpressionToHost
<#
.Synopsis
   Run Trace-Command on any PowerShell cmdlet of function. Uotputs to the console.

.DESCRIPTION
   Long description

.EXAMPLE
   [string[]] $exp = "Get-SPSite"
   Trace-MyExpressionToHost -Expression $exp
   This runs Trace-Command on the SharePoint Get-SPSite and displays the trace output, without the callstacks, to the console.


.EXAMPLE
      [string[]] $exp = "Get-SPSite, Get-Command '*sp*', Get-Help Get-SpoUser"
   Trace-MyExpressionToHost - CallStack
   This runs Trace-Command on three commands and displays the trace output, with the callstacks, to the console.
   Note - Using the -CallStack switch parameter might cause this function to generate a lot of trace content!


.INPUTS
   String[] that represents PowerSHell cmdlets and parameters. 
   Switch Parameter -CallStack. IF provided the output will include both the trace information and the call stacks. If not present, only the trace information will be output.

.OUTPUTS
   No objects are output. All output goes to the console.

.NOTES
   You must make sure that each expression is valid, that is it contains the correct command and parameters. 
   If an expression is not formed correctly the function will throw a terminating error to the console.

   Using the -CallStack switch parameter might cause this function to generate a lot of trace content!

.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Trace-MyExpressionToHost
{
    [CmdletBinding(SupportsShouldProcess=$true, 
                  PositionalBinding=$false)]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNullOrEmpty()]
        [Alias("exp")] 
        [string[]]$Expression,

        # Param2 help description
        [Parameter(Mandatory=$false)]
        [switch]$CallStack
    )

    Process
    {
        $back = [System.Console]::BackgroundColor

        $traceOptions = "ParameterBinderBase","ParameterBinding"


        foreach($e in $exp)
        {
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

                if ($CallStack)
                {
                    trace-command -name $to -expression $sb -ListenerOption Callstack -PSHost
                }
                else
                {
                    trace-command -name $to -expression $sb -PSHost
                }
            
            }
        }
    }

}