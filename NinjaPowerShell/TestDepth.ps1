
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


$NoValidationText = "==================================  NO VALIDATION ========================================"

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;



$NoValidationText;

For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: PASS"
        $start = Get-Date;
        Get-NoValidation -Input $good -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NoValidation -Input $sbad -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"No Validation: FAIL MEDIUM"
        $start = Get-Date;
        Get-NoValidation -Input $mbad -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"No Validation: FAIL LARGE"
        $start = Get-Date;
        Get-NoValidation -Input $lbad -Limit $lim; 
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
$NoValidationTotalTimeGood = "TOTAL TIME GOOD: " + $tTimeG
$NoValidationTotalTimeSB = "TOTAL TIME SMALL BAD: " + $tTimeSB
$NoValidationTotalTimeMB = "TOTAL TIME MEDIUM BAD: " + $tTimeMB
$NoValidationTotalTimeLB = "TOTAL TIME LARGE BAD: " + $tTimeLB
$NoValidationTotalTimeGood
$NoValidationTotalTimeSB
$NoValidationTotalTimeMB
$NoValidationTotalTimeLB
"
"

$NoValidationAvgTimeGood = "AVGL TIME GOOD: " + $tTimeG / $runs
$NoValidationAvgTimeSB = "AVGL TIME SMALL BAD: " + $tTimeSB / $runs
$NoValidationAvgTimeMB = "AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
$NoValidationAvgTimeLB = "AVGL TIME LARGE BAD: " + $tTimeLB / $runs
$NoValidationAvgTimeGood
$NoValidationAvgTimeSB
$NoValidationAvgTimeSB
$NoValidationAvgTimeMB
$NoValidationAvgTimeLB
"


"



$MethodValidationText = "===============================  METHOD VALIDATION ======================================="

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$MethodValidationText


For($r = 1; $r -le $runs; $r++)
{

    #"PASS"
        $start = Get-Date;
        Get-MethodValidation -Input $good -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


   # "FAIL SMALL"
        $start = Get-Date;
        Get-MethodValidation -Input $sbad -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"FAIL MEDIUM"
        $start = Get-Date;
        Get-MethodValidation -Input $mbad -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"FAIL LARGE"
        $start = Get-Date;
        Get-MethodValidation -Input $lbad -Limit $lim; 
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
$MethodValidationTotalTimeGood = "TOTAL TIME GOOD: " + $tTimeG
$MethodValidationTotalTimeSB = "TOTAL TIME SMALL BAD: " + $tTimeSB
$MethodValidationTotalTimeMB = "TOTAL TIME MEDIUM BAD: " + $tTimeMB
$MethodValidationTotalTimeLB = "TOTAL TIME LARGE BAD: " + $tTimeLB
$MethodValidationTotalTimeGood
$MethodValidationTotalTimeSB
$MethodValidationTotalTimeMB
$MethodValidationTotalTimeLB
"
"

$MethodValidationAvgTimeGood = "AVGL TIME GOOD: " + $tTimeG / $runs
$MethodValidationAvgTimeSB = "AVGL TIME SMALL BAD: " + $tTimeSB / $runs
$MethodValidationAvgTimeMB = "AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
$MethodValidationAvgTimeLB = "AVGL TIME LARGE BAD: " + $tTimeLB / $runs
$MethodValidationAvgTimeGood
$MethodValidationAvgTimeSB
$MethodValidationAvgTimeMB
$MethodValidationAvgTimeLB
"


"



$NullValidationText = "================================  NULL VALIDATION ========================================"

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

$NullValidationText;


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: PASS"
        $start = Get-Date;
        Get-NullValidation -Input $good -Limit $lim; 
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NullValidation -Input $sbad -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"No Validation: FAIL MEDIUM"
        $start = Get-Date;
        Get-NullValidation -Input $mbad -Limit $lim;
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"No Validation: FAIL LARGE"
        $start = Get-Date;
        Get-NullValidation -Input $lbad -Limit $lim; 
        trap [Exception]{continue;}
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
$NullValidationTotalTimeGood = "TOTAL TIME GOOD: " + $tTimeG
$NullValidationTotalTimeSB = "TOTAL TIME SMALL BAD: " + $tTimeSB
$NullValidationTotalTimeMB = "TOTAL TIME MEDIUM BAD: " + $tTimeMB
$NullValidationTotalTimeLB = "TOTAL TIME LARGE BAD: " + $tTimeLB
$NullValidationTotalTimeGood
$NullValidationTotalTimeSB
$NullValidationTotalTimeMB
$NullValidationTotalTimeLB
"
"

$NullValidationAvgTimeGood = "AVGL TIME GOOD: " + $tTimeG / $runs
$NullValidationAvgTimeSB = "AVGL TIME SMALL BAD: " + $tTimeSB / $runs
$NullValidationAvgTimeMB = "AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
$NullValidationAvgTimeLB = "AVGL TIME LARGE BAD: " + $tTimeLB / $runs
$NullValidationAvgTimeGood
$NullValidationAvgTimeSB
$NullValidationAvgTimeMB
$NullValidationAvgTimeLB
"


"



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


"====================== END VALIDATION RUNS ======================================"
"


"
$date = Get-Date;

$path = "\\TK5-RED-MDS-08Z\MyDocs3\jmorey\Documents\WindowsPowerShell\Modules\TestDepth_" + $date.DayOfYear + "_" + $date.Hour +  "_" + $date.Minute + ".txt"
$lb = "
"

#Starting Text
out-file -filepath $path -inputobject $startText -Append
out-file -filepath $path -inputobject $runsText -Append


#No Validation
out-file -filepath $path -inputobject $NoValidationText -Append

out-file -filepath $path -inputobject $NoValidationTotalTimeGood -Append
out-file -filepath $path -inputobject $NoValidationTotalTimeSB -Append
out-file -filepath $path -inputobject $NoValidationTotalTimeMB -Append
out-file -filepath $path -inputobject $NoValidationTotalTimeLB -Append
out-file -filepath $path -inputobject $lb -Append

out-file -filepath $path -inputobject $NoValidationAvgTimeGood -Append
out-file -filepath $path -inputobject $NoValidationAvgTimeSB -Append
out-file -filepath $path -inputobject $NoValidationAvgTimeMB -Append
out-file -filepath $path -inputobject $NoValidationAvgTimeLB -Append
out-file -filepath $path -inputobject $lb -Append



#Method Validation
out-file -filepath $path -inputobject $MethodValidationText -Append

out-file -filepath $path -inputobject $MethodValidationTotalTimeGood -Append
out-file -filepath $path -inputobject $MethodValidationTotalTimeSB -Append
out-file -filepath $path -inputobject $MethodValidationTotalTimeMB -Append
out-file -filepath $path -inputobject $MethodValidationTotalTimeLB -Append
out-file -filepath $path -inputobject $lb -Append

out-file -filepath $path -inputobject $MethodValidationAvgTimeGood -Append
out-file -filepath $path -inputobject $MethodValidationAvgTimeSB -Append
out-file -filepath $path -inputobject $MethodValidationAvgTimeMB -Append
out-file -filepath $path -inputobject $MethodValidationAvgTimeLB -Append
out-file -filepath $path -inputobject $lb -Append



#Null Validation
out-file -filepath $path -inputobject $NullValidationText -Append

out-file -filepath $path -inputobject $NullValidationTotalTimeGood -Append
out-file -filepath $path -inputobject $NullValidationTotalTimeSB -Append
out-file -filepath $path -inputobject $NullValidationTotalTimeMB -Append
out-file -filepath $path -inputobject $NullValidationTotalTimeLB -Append
out-file -filepath $path -inputobject $lb -Append

out-file -filepath $path -inputobject $NullValidationAvgTimeGood -Append
out-file -filepath $path -inputobject $NullValidationAvgTimeSB -Append
out-file -filepath $path -inputobject $NullValidationAvgTimeMB -Append
out-file -filepath $path -inputobject $NullValidationAvgTimeLB -Append
out-file -filepath $path -inputobject $lb -Append



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
