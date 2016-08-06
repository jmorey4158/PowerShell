
$input = "BadInput";
$runs = 1

$startText = "START RUNS: " + $runs
$startText;


$NoneText = "None ======================================="
$NoneText

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

For($r = 1; $r -le $runs; $r++)
{

   # "FAIL SMALL"
        $start = Get-Date;
        Get-None -Input $input
        trap [System.Management.Automation.ParameterBindingException]{}
        trap [System.Management.Automation.ValidationMetadataException]{}
        trap [Exception]{}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$NoneTotalTimeSB = "None TOTAL TIME: " + $tTimeSB
$NoneTotalTimeSB
$NoneAvgTimeSB = "None AVG TIME: " + $tTimeSB / $runs
$NoneAvgTimeSB
"
"



$ClassAttributeText = "ClassAttribute ======================================="
$ClassAttributeText

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

For($r = 1; $r -le $runs; $r++)
{

   # "FAIL SMALL"
        $start = Get-Date;
        Get-NullAttribute -Input $input
        trap [System.Management.Automation.ParameterBindingException]{}
        trap [System.Management.Automation.ValidationMetadataException]{}
        trap [Exception]{}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$ClassAttributeTotalTimeSB = "ClassAttribute TOTAL TIME: " + $tTimeSB
$ClassAttributeTotalTimeSB
$ClassAttributeAvgTimeSB = "ClassAttribute AVG TIME: " + $tTimeSB / $runs
$ClassAttributeAvgTimeSB
"
"




$NullAttributeText = "Get-NullAttribute ======================================="
$NullAttributeText

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

For($r = 1; $r -le $runs; $r++)
{

   # "FAIL SMALL"
        $start = Get-Date;
        Get-NullAttribute -Input $input
        trap [System.Management.Automation.ParameterBindingException]{}
        trap [System.Management.Automation.ValidationMetadataException]{}
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



$NullAttributeFirstText = "Get-NullAttributeFirst ========================================"

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$NullAttributeFirst;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NullAttributeFirst -Input $input
        trap [System.Management.Automation.ParameterBindingException]{}
        trap [System.Management.Automation.ValidationMetadataException]{}
        trap [Exception]{}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$NullAttributeFirstTotalTimeSB = "NullAttributeFirstTOTAL TIME: " + $tTimeSB
$NullAttributeFirstTotalTimeSB

$NullAttributeFirstAvgTimeSB = "NullAttributeFirst AVGL TIME: " + $tTimeSB / $runs
$NullAttributeFirstAvgTimeSB
"
"



$NullAttributeSecondText ="Get-NullAttributeSecond ========================================"

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$NullAttributeSecondText;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NullAttributeSecond -Input $input
        trap [System.Management.Automation.ParameterBindingException]{}
        trap [System.Management.Automation.ValidationMetadataException]{}
        trap [Exception]{}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$NullAttributeSecondTotalTimeSB = "NullAttributeSecond TOTAL TIME: " + $tTimeSB
$NullAttributeSecondTotalTimeSB

$NullAttributeSecondAvgTimeSB = "NullAttributeSecond AVG TIME: " + $tTimeSB / $runs
$NullAttributeSecondAvgTimeSB
"
"


$NullAttributeAfterText ="Get-NullAttributeAfter ========================================"

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$NullAttributeAfterText;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NullAttributeAfter -Input $input
        trap [System.Management.Automation.ParameterBindingException]{}
        trap [System.Management.Automation.ValidationMetadataException]{}
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


"END VALIDATION RUNS ======================================"

$date = Get-Date;

$path = "<DELETED>\WindowsPowerShell\Modules\TestResults\TestAttributeOrder_" + $runs + "_" + $date.DayOfYear + "_" + $date.Hour +  "_" + $date.Minute + ".txt"
$lb = "
"

#Starting Text
out-file -filepath $path -inputobject $startText -Append
out-file -filepath $path -inputobject $runsText -Append


#None
out-file -filepath $path -inputobject $NoneText -Append

out-file -filepath $path -inputobject $NoneTotalTimeSB -Append
out-file -filepath $path -inputobject $NoneAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append


#ClassAttribute
out-file -filepath $path -inputobject $ClassAttributeText -Append

out-file -filepath $path -inputobject $ClassAttributeTotalTimeSB -Append
out-file -filepath $path -inputobject $ClassAttributeAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append



#NullAttribute
out-file -filepath $path -inputobject $NullAttributeText -Append

out-file -filepath $path -inputobject $NullAttributeTotalTimeSB -Append
out-file -filepath $path -inputobject $NullAttributeAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append



#NullAttributeFirst
out-file -filepath $path -inputobject $NullAttributeFirstText -Append

out-file -filepath $path -inputobject $NullAttributeFirstTotalTimeSB -Append
out-file -filepath $path -inputobject $NullAttributeFirstAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append


#NullAttributeSecond
out-file -filepath $path -inputobject $NullAttributeSecondText -Append

out-file -filepath $path -inputobject $NullAttributeSecondTotalTimeSB -Append
out-file -filepath $path -inputobject $NullAttributeSecondAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append


#NullAttributeAfter
out-file -filepath $path -inputobject $NullAttributeAfterText -Append

out-file -filepath $path -inputobject $NullAttributeAfterTotalTimeSB -Append
out-file -filepath $path -inputobject $NullAttributeAfterAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append

