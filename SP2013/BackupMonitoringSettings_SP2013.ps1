

#-------------------------------------------------------------------------------
# Script: BackupMonitoringSettings_SP2013.ps1
#
# Description: This script backs up all of the following settings on a SharePoint
#		farm server to an XML file:
#			-DiagnosticSettings
#			-UsageService settings
#			-Usage definitions
#			-Log level settings
#			-Timer job settings
#			-SharePoint Health Analyzer rule settings
#
#		The XML file can be used to restore these settings to the server by running the 
#		AlterMonitoringSettings_SP2013.ps1 script. The XML file can also be used for other
#		purposes. For more information, see the notes in AlterMonitoringSettings_SP2013.ps1
#
#
# Parameters: String $path; The full path where the BackupSettings_<DATE> file
#	will be saved.
#
# Applies To: SharePoint 2013 Only
#
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# Function: Main
#
# Description: Main entry point for the script. Calls all other functions that
#		Get settings and saves them to an XML file. 
#
# Parameters: String $path; The full path where the BackupSettings_<DATE> file
#	will be saved.
#
#-------------------------------------------------------------------------------
 
Function Main($folder)
{ 	
		$name = hostname.exe
		$date = Get-Date -uformat "%Y.%m.%d_%H.%M"
		$instance = "\BackupLoggingSettings_" + $name + "_" + $date + ".xml"
		$path = $folder + $instance
		
		CreateBlankDataFile($path)
		
		$xmldata = [xml](Get-Content $path)
		
		$fcolor = $Host.UI.RawUI.ForegroundColor
		$bcolor = $Host.UI.RawUI.BackgroundColor
		$Host.UI.RawUI.ForegroundColor = "yellow"
		$Host.UI.RawUI.BackgroundColor = "black"
		
		Write-Host "
	***************************************************
		Running BackupMonitoringSettings script....
	***************************************************
	"
		GetFarmDiagnosticConfig($xmldata)
		GetUsageServiceSettings($xmldata)
		GetUsageDefinition($xmldata)
		GetLogLevels($xmldata)
		GetTimerJobs($xmldata)
		GetHealthAnalyzerRules($xmldata)
		
		$xmldata.Save($path)
		
		Write-Host "Monitoring settings saved to XML data file $path
		
		"
		
		$Host.UI.RawUI.ForegroundColor = $fcolor
		$Host.UI.RawUI.BackgroundColor = $bcolor
}



#-------------------------------------------------------------------------------
# Function: GetDiagnosticConfig
#
# Description: Called by Main. Gets Diagnostic Settings and fills XML
#		nodes with them. 
#
# Parameters: XML $xml; the XML nodeset that will be filled.
#
#-------------------------------------------------------------------------------
Function GetFarmDiagnosticConfig($xml)
{
	Write-Host "
Saving Farm DiagnosticConfig settings....
	"
	
	$diag = $xml.Configuration.FarmDiagnosticConfig
	
	Get-SPDiagnosticConfig | ForEach-Object { 
	
		$diag.AllowLegacyTraceProviders = [string]$_.AllowLegacyTraceProviders
		$diag.AppAnalyticsAutomaticUploadEnabled = [string]$_.AppAnalyticsAutomaticUploadEnabled
		$diag.CustomerExperienceImprovementProgramEnabled = [string]$_.CustomerExperienceImprovementProgramEnabled
		$diag.DaysToKeepLogs = [string]$_.DaysToKeepLogs
		$diag.DownloadErrorReportingUpdatesEnabled = [string]$_.DownloadErrorReportingUpdatesEnabled
		$diag.ErrorReportingAutomaticUploadEnabled = [string]$_.ErrorReportingAutomaticUploadEnabled
		$diag.ErrorReportingEnabled = [string]$_.ErrorReportingEnabled 
		$diag.EventLogFloodProtectionEnabled = [string]$_.EventLogFloodProtectionEnabled
		$diag.EventLogFloodProtectionNotifyInterval = [string]$_.EventLogFloodProtectionNotifyInterval
		$diag.EventLogFloodProtectionQuietPeriod = [string]$_.EventLogFloodProtectionQuietPeriod
		$diag.EventLogFloodProtectionThreshold = [string]$_.EventLogFloodProtectionThreshold
		$diag.EventLogFloodProtectionTriggerPeriod = [string]$_.EventLogFloodProtectionTriggerPeriod
		$diag.LogCutInterval = [string]$_.LogCutInterval 
		$diag.LogDiskSpaceUsageGB = [string]$_.LogDiskSpaceUsageGB
		$diag.LogLocation = [string]$_.LogLocation
		$diag.LogMaxDiskSpaceUsageEnabled = [string]$_.LogMaxDiskSpaceUsageEnabled
		$diag.ScriptErrorReportingDelay = [string]$_.ScriptErrorReportingDelay
		$diag.ScriptErrorReportingEnabled = [string]$_.ScriptErrorReportingEnabled
		$diag.ScriptErrorReportingRequireAuth = [string]$_.ScriptErrorReportingRequireAuth
	}
}



#-------------------------------------------------------------------------------
# Function: GetUsageServiceSettings
#
# Description: Called by Main. Gets Usage Service settings and fills XML nodes
#
# Parameters: XML $xml; the XML nodeset that will be filled.
#
#-------------------------------------------------------------------------------
Function GetUsageServiceSettings($xml)
{
	Write-Host "Saving UsageService settings...."
	$count=0
	
	 Get-SPUsageService	| ForEach-Object {
		
		$usagelogdir = "  
			<UsageLogLocation>" + $_.UsageLogLocation + "</UsageLogLocation>"
		$loggingenabled = "  
			<LoggingEnabled>" + $_.LoggingEnabled + "</LoggingEnabled>"
		$usagelogmaxfilesize = "  
			<UsageLogMaxFileSizeKB >" + $_.UsageLogMaxFileSizeKB  + "</UsageLogMaxFileSizeKB >"
		$usagelogcuttime = "  
			<UsageLogCutTime>" + $_.UsageLogCutTime + "</UsageLogCutTime>"
		
		$newservice = $xml.CreateElement("UsageService")
		$newservice.SetAttribute("ID", $_.Id)
		$newservice.InnerXML = ($usagelogdir + $usagelogmaxspacegb + $loggingenabled + $usagelogmaxfilesize + $usagelogcuttime)
		
		$xml.Configuration.UsageServices.AppendChild($newservice)
		
		$count++
	} | Out-Null
	Write-Host "Saved $count Usage Service settings
	"
}



#-------------------------------------------------------------------------------
# Function: GetUsageDefinition
#
# Description: 
#
# Parameters: XML $xml; the XML nodeset that will be filled.
#
#-------------------------------------------------------------------------------
Function GetUsageDefinition($xml)
{	
	Write-Host "Saving Usage Definition settings..."
	$count = 0
	
	Get-SPUsageDefinition | ForEach-Object {

		$retention = "
			<Retention>" + $_.Retention + "</Retention>"
		$enabled = "
			<Enabled>" + $_.Enabled + "</Enabled>" 
		
		$definition = $xml.CreateElement("UsageDefinition")
		$definition.SetAttribute("Id", $_.Id)
		$definition.SetAttribute("Name", $_.Name)
		
		$definition.InnerXML = ( $retention + $enabled)
		
		$xml.Configuration.UsageDefinitions.AppendChild($definition)
		$count++
	}  | Out-Null
	Write-Host "Saved $count Usage Definition settings...
	"
}



#-------------------------------------------------------------------------------
# Function: GetLogLevels
#
# Description: Called by Main. Gets Log Levels and fills XML nodes.
#
# Parameters: XML $xml; the XML nodeset that will be filled.
#
#-------------------------------------------------------------------------------
Function GetLogLevels($xml)
{
	Write-Host "Saving LogLevels..."
	$count = 0
	$logLevels = $xml.LogLevels
	
	Get-SPloglevel | ForEach-Object { 
	
		$eventseverity = "
			<EventSeverity>" + $_.EventSeverity + "</EventSeverity>"
		$traceseverity = "
			<TraceSeverity>" + $_.TraceSeverity  + "</TraceSeverity>"
		
		$level = $xml.CreateElement("LogLevel")
		$level.SetAttribute("Area", $_.Area)	
		$level.SetAttribute("Name", $_.Name)		
		$level.SetAttribute("Id", $_.Id)
		
		$level.InnerXML = ( $eventseverity + $traceseverity)
		
		$xml.Configuration.LogLevels.AppendChild($level)
		
		$count++
	} | Out-Null
	
	Write-Host "Saved $count LogLevels
	"
}



#-------------------------------------------------------------------------------
# Function: GetTimerJobs
#
# Description: Called by Main. Gets Timer Jobs and fills XML nodes.
#
# Parameters: XML $xml; the XML nodeset that will be filled.
#
#-------------------------------------------------------------------------------
Function GetTimerJobs($xml)
{
	Write-Host "Saving Timer Job settings..."
	$count = 0

	 Get-SPTimerJob | ForEach-Object { 
	
		$schedule = "
			<Schedule>" + $_.Schedule + "</Schedule>"
		$isdisabled = "
			<IsDisabled>" + $_.IsDisabled + "</IsDisabled>"
		
		$timer = $xml.CreateElement("TimerJob")
		$timer.SetAttribute("Id", $_.Id)		
		$timer.SetAttribute("Name", $_.Name)		

		$timer.InnerXML = ( $schedule + $isdisabled )
		
		$xml.Configuration.TimerJobs.AppendChild($timer)
		
		$count++
	} | Out-Null
	
	Write-Host "Saved $count Timer Job Settings
	"

}



#-------------------------------------------------------------------------------
# Function: GetHealthAnalyzerRules
#
# Description: Called by Main. Gets SharePoint Health Analyzer Rules and fills XML nodes.
#
# Parameters: XML $xml; the XML nodeset that will be filled.
#
#-------------------------------------------------------------------------------
Function GetHealthAnalyzerRules($xml)
{
	Write-Host "Saving Health Analyzer Rule settings..."
	$count = 0

	 Get-SPHealthAnalysisRule | ForEach-Object { 
	
		$enabled = "
			<Enabled>" + $_.Enabled + "</Enabled>"
		
		$spharule = $xml.CreateElement("HealthAnalyzerRule")
		$spharule.SetAttribute("Id", $_.Id)
		$spharule.SetAttribute("Name", $_.Name)		
		$spharule.SetAttribute("Category", $_.Category)	
		$spharule.SetAttribute("Summary", $_.Summary)			

		$spharule.InnerXML = ( $enabled )
		
		$xml.Configuration.HealthAnalyzerRules.AppendChild($spharule)
		
		$count++
	}  | Out-Null
	Write-Host "Saved $count Health Analyzer Rule settings...
	"
}



#-------------------------------------------------------------------------------
# Function: CreateBlankDataFile
#
# Description: Creates a blank XML data file that will be filled 
#
# Parameters: String $path; The full path to where the BackupSettings_<DATE> file
#	will be saved.
#
#-------------------------------------------------------------------------------
Function CreateBlankDataFile ($path)
{
$xml = @'
<?xml version="1.0" standalone="yes"?>
<Configuration>
  
  <FarmDiagnosticConfig>
      <AllowLegacyTraceProviders></AllowLegacyTraceProviders>
      <AppAnalyticsAutomaticUploadEnabled></AppAnalyticsAutomaticUploadEnabled>
      <CustomerExperienceImprovementProgramEnabled></CustomerExperienceImprovementProgramEnabled>
      <DaysToKeepLogs></DaysToKeepLogs>
      <DownloadErrorReportingUpdatesEnabled></DownloadErrorReportingUpdatesEnabled>
      <ErrorReportingAutomaticUploadEnabled></ErrorReportingAutomaticUploadEnabled>
      <ErrorReportingEnabled></ErrorReportingEnabled>
      <EventLogFloodProtectionEnabled></EventLogFloodProtectionEnabled>
      <EventLogFloodProtectionNotifyInterval></EventLogFloodProtectionNotifyInterval>
      <EventLogFloodProtectionQuietPeriod></EventLogFloodProtectionQuietPeriod>
      <EventLogFloodProtectionThreshold></EventLogFloodProtectionThreshold>
      <EventLogFloodProtectionTriggerPeriod></EventLogFloodProtectionTriggerPeriod>
      <LogCutInterval></LogCutInterval>
      <LogDiskSpaceUsageGB></LogDiskSpaceUsageGB>
      <LogLocation></LogLocation>
      <LogMaxDiskSpaceUsageEnabled></LogMaxDiskSpaceUsageEnabled>
      <ScriptErrorReportingDelay></ScriptErrorReportingDelay>  
      <ScriptErrorReportingEnabled></ScriptErrorReportingEnabled>
      <ScriptErrorReportingRequireAuth></ScriptErrorReportingRequireAuth>
  </FarmDiagnosticConfig>

  <UsageServices><UsageService></UsageService></UsageServices>

  <UsageDefinitions><UsageDefinition></UsageDefinition></UsageDefinitions>

  <LogLevels><LogLevel></LogLevel></LogLevels>

  <TimerJobs><TimerJob></TimerJob></TimerJobs>
  
  <HealthAnalyzerRules><HealthAnalyzerRule></HealthAnalyzerRule></HealthAnalyzerRules>
  
</Configuration>
'@
$xml | Out-File $path
}



#-------------------------------------------------------------------------------
# BEGIN EXECUTION
#-------------------------------------------------------------------------------

main($args[0])