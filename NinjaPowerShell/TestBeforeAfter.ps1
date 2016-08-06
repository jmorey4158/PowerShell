$intro = "========================================================================================================="
$intro += "================================== POWERSHELL VALIDATION TESTING ========================================"
$intro += "========================================================================================================="
$intro += "======================= testing ATTRIBUTE ORDER using NULL input   =============================="

$intro
"

"

$runs = 100000

$startText = "START RUNS: " + $runs
$startText;


$NullAttributeText = "===============================  Get-NullAttribute ======================================="
$NullAttributeText

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

For($r = 1; $r -le $runs; $r++)
{

   # "FAIL SMALL"
        $start = Get-Date;
        Get-NullAttribute -Input;
        trap [System.Management.Automation.ParameterBindingException]{continue;}
        trap [Exception]{}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$NullAttributeTotalTimeSB = "NullAttribute TOTAL TIME: " + $tTimeSB
$NullAttributeTotalTimeSB
$NullAttributeAvgTimeSB = "NullAttribute AVG TIME: " + $tTimeSB / $runs
$NullAttributeAvgTimeSB
"
"


$NullAttributeAfterText ="=============================== Get-NullAttributeAfter ========================================"

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$NullAttributeAfterText;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NullAttributeAfter -Input;
        trap [System.Management.Automation.ParameterBindingException]{continue;}
        trap [Exception]{}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$NullAttributeAfterTotalTimeSB = "NullAttributeAfter TOTAL TIME: " + $tTimeSB
$NullAttributeAfterTotalTimeSB

$NullAttributeAfterAvgTimeSB = "NullAttributeAfter AVG TIME: " + $tTimeSB / $runs
$NullAttributeAfterAvgTimeSB
"
"


"====================== END VALIDATION RUNS ======================================"

$date = Get-Date;

$path = "<DELETED>\WindowsPowerShell\Modules\TestResults\TestBeforeAfter_" + $runs + "_" + $date.DayOfYear + "_" + $date.Hour +  "_" + $date.Minute + ".txt"
$lb = "
"

#Starting Text
out-file -filepath $path -inputobject $startText -Append
out-file -filepath $path -inputobject $runsText -Append


#NullAttribute
out-file -filepath $path -inputobject $NullAttributeText -Append

out-file -filepath $path -inputobject $NullAttributeTotalTimeSB -Append
out-file -filepath $path -inputobject $NullAttributeAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append


#NullAttributeAfter
out-file -filepath $path -inputobject $NullAttributeAfterText -Append

out-file -filepath $path -inputobject $NullAttributeAfterTotalTimeSB -Append
out-file -filepath $path -inputobject $NullAttributeAfterAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append

