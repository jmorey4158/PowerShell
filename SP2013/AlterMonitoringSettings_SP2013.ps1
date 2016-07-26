

#-------------------------------------------------------------------------------
# Script: AlterMonitoringSettings_SP2013.ps1
#
# Description: This script uses the data in an XML file to either restore, or alter
#		one or more of the following settings on a SharePoint farm server to an XML file:
#			-DiagnosticSettings
#			-UsageService settings
#			-Usage definitions
#			-Log level settings
#			-Timer job settings
# 			-SharePoint Health Analyzer rule settings (enable | disable)
#
#		The script can be used to restore these settings to the server. 
#		The XML file can also be used for other purposes, such as altering the settings, 
#		applying the settings on one server to one or more othter servers.
#
# Parameters: String $path; The full path where the XML data file.
#
# Applies To: SharePoint 2013 Only
#
#
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
# Function: Main
#
# Description: Entry point for script. Calls all other Functions as needed.
#
# Parameters: String $path; The full path to the Settings file to be used. The 
#		Settings file is an XML file that contains the settings to be applied
#		to the farm server.
#
#-------------------------------------------------------------------------------
 
Function Main($path)
{ 	
  [xml]$cfg = Get-Content $path
 
  if( $? -eq $false ) {
    Write-Host "Cannot load configuration source Xml: $cfg."
    return $false
  }
  	$fcolor = $Host.UI.RawUI.ForegroundColor
	$bcolor = $Host.UI.RawUI.BackgroundColor
	$Host.UI.RawUI.ForegroundColor = "yellow"
	$Host.UI.RawUI.BackgroundColor = "black"
	
    Write-Host "
	***************************************************
		Running AlterMonitoringSettings script....
	***************************************************
	"
  
  	AlterFarmDiagnosticConfig($cfg)
	AlterUsageServiceSettings($cfg)
	AlterUsageDefinition($cfg)
	AlterLogLevels($cfg)
	AlterTimerJobs($cfg) 
	AlterHealthAnalyzerRules($cfg)

	Write-Host "All changes have been made...
	
	"
	$Host.UI.RawUI.ForegroundColor = $fcolor
	$Host.UI.RawUI.BackgroundColor = $bcolor

}


#-------------------------------------------------------------------------------
# Function: AlterDiagnosticConfig
#
# Description: Called by Main. Gets xml nodeset and applies changes to the farm server
#		Diagnostic Settings
#
# Parameters: XML $xml; the XML nodeset that contains the settings to apply.
#
#-------------------------------------------------------------------------------
Function AlterFarmDiagnosticConfig($xml)
{
	$diag = $xml.Configuration.FarmDiagnosticConfig

    $count = 0
	
	if ($diag -ne $null)
	{
		Write-Host "Altering Farm DiagnosticConfig settings...
		"	
		
		$command = "Set-SPDiagnosticConfig"
		
		if ($diag.AllowLegacyTraceProviders -eq "True") {$command += " -AllowLegacyTraceProviders"; count++} 
		if ($diag.ErrorReportingEnabled -eq "True") {$command += " -ErrorReportingEnabled"; count++}
		if ($diag.ErrorReportingAutomaticUploadEnabled -eq "True") {$command += " -ErrorReportingAutomaticUploadEnabled"; count++}
		if ($diag.DownloadErrorReportingUpdatesEnabled -eq "True") {$command += " -DownloadErrorReportingUpdatesEnabled"; count++}	
		if ($diag.CustomerExperienceImprovementProgramEnabled -eq "True") {$command += " -CustomerExperienceImprovementProgramEnabled"; count++}
		if ($diag.EventLogFloodProtectionEnabled -eq "True") {$command += " -EventLogFloodProtectionEnabled"; count++}	
		if ($diag.LogMaxDiskSpaceUsageEnabled -eq "True") {$command += " -LogMaxDiskSpaceUsageEnabled "; count++}
		if ($diag.ScriptErrorReportingEnabled -eq "True") {$command += " -ScriptErrorReportingEnabled"; count++}	
		if ($diag.ScriptErrorReportingRequireAuth -eq "True") {$command += " -ScriptErrorReportingRequireAuth"; count++}	


		
		if ($diag.DaysToKeepLogs -ne $null) {$command += " -DaysToKeepLogs " + $diag.DaysToKeepLogs; count++}
		if ($diag.EventLogFloodProtectionNotifyInterval -ne $null) {$command += " -EventLogFloodProtectionNotifyInterval " + $diag.EventLogFloodProtectionNotifyInterval; count++}
		if ($diag.EventLogFloodProtectionQuietPeriod -ne $null) {$command += " -EventLogFloodProtectionQuietPeriod " + $diag.EventLogFloodProtectionQuietPeriod; count++}
		if ($diag.EventLogFloodProtectionThreshold -ne $null) {$command += " -EventLogFloodProtectionThreshold " + $diag.EventLogFloodProtectionThreshold; count++}
		if ($diag.EventLogFloodProtectionTriggerPeriod -ne $null) {$command += " -EventLogFloodProtectionTriggerPeriod " + $diag.EventLogFloodProtectionTriggerPeriod; count++}
		if ($diag.LogCutInterval -ne $null) {$command += " -LogCutInterval " + $diag.LogCutInterval; count++}	
		if ($diag.LogDiskSpaceUsageGB -ne $null) {$command += " -LogDiskSpaceUsageGB " + $diag.LogDiskSpaceUsageGB; count++}
		if ($diag.ScriptErrorReportingDelay -ne $null) {$command += " -ScriptErrorReportingDelay " + $diag.ScriptErrorReportingDelay; count++}
		if ($diag.LogLocation -ne $null) {$command += " -LogLocation " + '"' + $diag.LogLocation + '"'; count++}
		
		if ($count -gt 0) {Invoke-Expression $command}
	}
	else 
	{
		Write-Host "There were no DiagnosticConfig settings changes to be made.
		"
	}
}



#-------------------------------------------------------------------------------
# Function: AlterUsageServiceSettings
#
# Description: Called by Main. Gets xml nodeset and applies changes to the farm server
#		Usage Service(s) Settings
#
# Parameters: XML $xml; the XML nodeset that contains the settings to apply.
#
#-------------------------------------------------------------------------------
Function AlterUsageServiceSettings($xml)
{
	$nodes = $xml.SelectNodes("Configuration/UsageServices/UsageService") 
	
	if ($nodes -ne $null)
	{
		Write-Host "Altering UsageService settings..."
		
		$count = 0	
		For ($i = 0; $i -lt $nodes.Count; $i++)
		{
			If ($nodes[$i].Attributes[0].Value -ne $null)
			{			
				$command = "Set-SPUsageService -Identity " + $nodes[$i].Attributes[0].Value
				$command += " -UsageLogLocation " + '"' + $nodes[$i].UsageLogDir + '"'
				$command += " -UsageLogMaxSpaceGB " + $nodes[$i].UsageLogMaxSpaceGB	
				$command += " -UsageLogCutTime " + $nodes[$i].UsageLogCutTime
				
				if ($_.LoggingEnabled -eq "True") {$command += " -LoggingEnabled $true"}
				elseif ($_.LoggingEnabled -eq "False") {$command += " -LoggingEnabled $false"}
										
				Invoke-Expression $command
				
				$count++
			}
		}
		Write-Host "Altered $count UsageServices
		"		
	
	}
	else
	{
		Write-Host "There were no UsageServices changes to be made.
		"
	}

}


#-------------------------------------------------------------------------------
# Function: AlterUsageDefinition
#
# Description: Called by Main. Gets xml nodeset and applies changes to the farm server
#		Usage Definitions Settings
#
# Parameters: XML $xml; the XML nodeset that contains the settings to apply.
#
#-------------------------------------------------------------------------------
Function AlterUsageDefinition($xml)
{
	$nodes = $xml.SelectNodes("Configuration/UsageDefinitions/UsageDefinition")
	
	if ($nodes -ne $null)
	{
		Write-Host "Altering UsageDefinition settings..."
		$count = 0
		For ($i = 0; $i -lt $nodes.Count; $i++)
		{		
			If ($nodes[$i].Attributes[1].Value -ne $null)
			{		
				$usageDef = Get-SPUsageDefinition -Identity $nodes[$i].Attributes[1].Value
				
				$usageDef | Set-SPUsageDefinition -DaysRetained $nodes[$i].Retention

				If ($nodes[$i].Enabled -eq "True")
				{
					$usageDef | Set-SPUsageDefinition -Enable
				}
				
				$count++
			}
		}
		Write-Host "Altered $count UsageDefinition(s).
		"
	}
	else
	{
		Write-Host "There were no UsageDefinition changes to be made.
	"
	}
}



#-------------------------------------------------------------------------------
# Function: AlterLogLevels
#
# Description: Called by Main. Gets xml nodeset and applies changes to the farm server
#		Log Level Settings
#
# Parameters: XML $xml; the XML nodeset that contains the settings to apply.
#
#-------------------------------------------------------------------------------
Function AlterLogLevels($xml)
{
	$nodes = $xml.SelectNodes("Configuration/LogLevels/LogLevel")
	
	if ($nodes -ne $null)
	{
		Write-Host "Altering LogLevel settings..."
		$count = 0
	
		For ($i = 0; $i -lt $nodes.Count; $i++)
		{		
			If ($nodes[$i].Attributes[1].Value -ne $null)
			{	
				$loglevel = Get-SPLogLevel -Identity $nodes[$i].Attributes[1].Value
				
				$loglevel | Set-SPLogLevel -EventSeverity $nodes[$i].EventSeverity	
				$loglevel | Set-SPLogLevel -TraceSeverity $nodes[$i].TraceSeverity
				$count++								
			}
		}	
		Write-Host "Altered $count LogLevel(s).
		"	
	}
	else
	{
		Write-Host "There were no LogLevel changes to be made.
		"	
	}

}



#-------------------------------------------------------------------------------
# Function: AlterTimerJobs
#
# Description: Called by Main. Gets xml nodeset and applies changes to the farm server
#		Timer Jobs Settings
#
# Parameters: XML $xml; the XML nodeset that contains the settings to apply.
#
#-------------------------------------------------------------------------------
Function AlterTimerJobs($xml)
{
	$nodes = $xml.SelectNodes("Configuration/TimerJobs/TimerJob")
	
	if ($nodes -ne $null)
	{
		Write-Host "Altering TimerJob settings..."
		$count = 0	
		For ($i = 0; $i -lt $nodes.Count; $i++)
		{		
			If ($nodes[$i].Attributes[1].Value -ne $null)
			{
				$timerjob = Get-SPTimerJob -Identity $nodes[$i].Attributes[1].Value
				
				Set-SPTimerJob -Identity $timerjob.Id -Schedule $nodes[$i].Schedule
				
				If ($nodes[$i].IsDisabled -eq "True") 
					{
						$timerjob | Disable-SPTimerJob -Confirm:$false
					}
				ElseIf ($nodes[$i].IsDisabled -eq "False")
					{
						$timerjob | Enable-SPTimerJob -Confirm:$false
					}
					
				$count++
			}	
		}
		Write-Host "Altered $count TimerJob(s).
		"
	}
	else 
	{
		Write-Host "There were no TimerJob changes to be made.
		"	
	}
		
}



#-------------------------------------------------------------------------------
# Function: AlterHealthAnalyzerRules
#
# Description: Called by Main. Gets xml nodeset and applies changes to the farm server
#		SPHA Rules Settings
#
# Parameters: XML $xml; the XML nodeset that contains the settings to apply.
#
#-------------------------------------------------------------------------------
Function AlterHealthAnalyzerRules($xml)
{
	$nodes = $xml.SelectNodes("Configuration/HealthAnalyzerRules/HealthAnalyzerRule")
	
	if ($nodes -ne $null)
	{
		Write-Host "Altering SPHA rule settings..."
		$count = 0
			
		For ($i = 0; $i -lt $nodes.Count; $i++)
		{		
			If ($nodes[$i].Attributes[0].Value -ne $null)
			{
				$spharule = Get-SPHealthAnalysisRule -Identity $nodes[$i].Attributes[0].Value
				
				If ($nodes[$i].Enabled -eq "True") 
					{
						Enable-SPHealthAnalysisRule -Identity $spharule.Id
						$count++
					}
				ElseIf ($nodes[$i].Enabled -eq "False")
					{
						Disable-SPHealthAnalysisRule -Identity $spharule.Id -Confirm:$false
						$count++
					}
			}	
		}
		Write-Host "Altered $count SPHA rule(s).
		"
	}
	else
	{
		Write-Host "There were no SPHA rule changes to be made.
		"	
	}
	
}


#-------------------------------------------------------------------------------
# BEGIN EXECUTION
#-------------------------------------------------------------------------------

main($args[0])