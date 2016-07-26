$good = Get-GoodInput
$sbad = Get-SmallBadInput
$mbad = Get-MediumBadInput
$lbad = Get-LargeBadInput
$lim = 1
$runs = 1

$startText = "START RUN - LIMIT: " + $lim
$runsText ="RUNS: " + $runs
$startText;
$runsText;

$ClassValidationText ="===============================  CLASS VALIDATION ========================================"

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$ClassValidationText;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: PASS"
        $start = Get-Date;
        Get-ClassValidation -Input $good -Limit $lim; 
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-ClassValidation -Input $sbad -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"No Validation: FAIL MEDIUM"
        $start = Get-Date;
        Get-ClassValidation -Input $mbad -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"No Validation: FAIL LARGE"
        $start = Get-Date;
        Get-ClassValidation -Input $lbad -Limit $lim; 
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
$ClassValidationTotalTimeGood = "TOTAL TIME GOOD: " + $tTimeG
$ClassValidationTotalTimeSB = "TOTAL TIME SMALL BAD: " + $tTimeSB
$ClassValidationTotalTimeMB = "TOTAL TIME MEDIUM BAD: " + $tTimeMB
$ClassValidationTotalTimeLB = "TOTAL TIME LARGE BAD: " + $tTimeLB
$ClassValidationTotalTimeGood
$ClassValidationTotalTimeSB
$ClassValidationTotalTimeMB
$ClassValidationTotalTimeLB
"
"

$ClassValidationAvgTimeGood = "AVGL TIME GOOD: " + $tTimeG / $runs
$ClassValidationAvgTimeSB = "AVGL TIME SMALL BAD: " + $tTimeSB / $runs
$ClassValidationAvgTimeMB = "AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
$ClassValidationAvgTimeLB = "AVGL TIME LARGE BAD: " + $tTimeLB / $runs
$ClassValidationAvgTimeGood
$ClassValidationAvgTimeSB
$ClassValidationAvgTimeMB
$ClassValidationAvgTimeLB
"


"



$date = Get-Date;

$path = "\\TK5-RED-MDS-08Z\MyDocs3\jmorey\Documents\WindowsPowerShell\Modules\TestDepth_" + $date.DayOfYear + "_" + $date.Hour +  "_" + $date.Minute + ".txt"
$lb = "
"



#Class Validation
out-file -filepath $path -inputobject $ClassValidationText -Append

out-file -filepath $path -inputobject $ClassValidationTotalTimeGood -Append
out-file -filepath $path -inputobject $ClassValidationTotalTimeSB -Append
out-file -filepath $path -inputobject $ClassValidationTotalTimeMB -Append
out-file -filepath $path -inputobject $ClassValidationTotalTimeLB -Append
out-file -filepath $path -inputobject $lb -Append

out-file -filepath $path -inputobject $ClassValidationAvgTimeGood -Append
out-file -filepath $path -inputobject $ClassValidationAvgTimeSB -Append
out-file -filepath $path -inputobject $ClassValidationAvgTimeMB -Append
out-file -filepath $path -inputobject $ClassValidationAvgTimeLB -Append