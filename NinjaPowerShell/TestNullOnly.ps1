

$runs = 1

$startText = "START RUNS: " + $runs
$startText;


$NoValidationText = "= NO VALIDATION ="
$NoValidationText

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NoValidationOnly -Input
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$NoValidationTotalTimeSB = "NO VALIDATION TOTAL TIME: " + $tTimeSB
$NoValidationTotalTimeSB


$NoValidationAvgTimeSB = "NO VALIDATION AVG TIME: " + $tTimeSB / $runs
$NoValidationAvgTimeSB
"
"



$MethodValidationText = "=  METHOD VALIDATION ="
$MethodValidationText

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

For($r = 1; $r -le $runs; $r++)
{

   # "FAIL SMALL"
        $start = Get-Date;
        Get-MethodValidationOnly -Input;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$MethodValidationTotalTimeSB = "METHOD VALIDATION TOTAL TIME: " + $tTimeSB
$MethodValidationTotalTimeSB
$MethodValidationAvgTimeSB = "METHOD VALIDAITION AVG TIME: " + $tTimeSB / $runs
$MethodValidationAvgTimeSB
"
"



$NullValidationText = "=  NULL VALIDATION ="

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$NullValidationText;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NullValidationOnly -Input;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$NullValidationTotalTimeSB = "TOTAL TIME SMALL BAD: " + $tTimeSB
$NullValidationTotalTimeSB

$NullValidationAvgTimeSB = "AVGL TIME SMALL BAD: " + $tTimeSB / $runs
$NullValidationAvgTimeSB
"
"



$ClassValidationText ="=  CLASS VALIDATION ="

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$ClassValidationText;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-ClassValidationOnly -Input;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;
}

$ClassValidationTotalTimeSB = "ClassValidationOnlyTOTAL TIME SMALL BAD: " + $tTimeSB
$ClassValidationTotalTimeSB

$ClassValidationAvgTimeSB = "ClassValidationOnly AVGL TIME SMALL BAD: " + $tTimeSB / $runs
$ClassValidationAvgTimeSB
"
"


"= END VALIDATION RUNS ="

$date = Get-Date;

$path = "<DELETED>\WindowsPowerShell\Modules\TestResults\TestNullOnly_" + $runs + "_" + $date.DayOfYear + "_" + $date.Hour +  "_" + $date.Minute + ".txt"
$lb = "
"

out-file -filepath $path -inputobject $intro -Append
out-file -filepath $path -inputobject $lb -Append

#Starting Text
out-file -filepath $path -inputobject $startText -Append
out-file -filepath $path -inputobject $runsText -Append


#No Validation
out-file -filepath $path -inputobject $NoValidationText -Append

out-file -filepath $path -inputobject $NoValidationTotalTimeSB -Append
out-file -filepath $path -inputobject $NoValidationAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append



#Method Validation
out-file -filepath $path -inputobject $MethodValidationText -Append

out-file -filepath $path -inputobject $MethodValidationTotalTimeSB -Append
out-file -filepath $path -inputobject $MethodValidationAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append



#Null Validation
out-file -filepath $path -inputobject $NullValidationText -Append

out-file -filepath $path -inputobject $NullValidationTotalTimeSB -Append
out-file -filepath $path -inputobject $NullValidationAvgTimeSB -Append
out-file -filepath $path -inputobject $lb -Append



#Class Validation
out-file -filepath $path -inputobject $ClassValidationText -Append

out-file -filepath $path -inputobject $ClassValidationTotalTimeSB -Append
out-file -filepath $path -inputobject $ClassValidationAvgTimeSB -Append
