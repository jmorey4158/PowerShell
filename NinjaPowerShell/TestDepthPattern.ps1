
$good = Get-GoodInput
$sbad = Get-SmallBadInput
$mbad = Get-MediumBadInput
$lbad = Get-LargeBadInput
$lim = 1
$runs = 1


"=========================================================================================="
"==================================  NO VALIDATION ========================================"
"=========================================================================================="

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

"START RUN - LIMIT: " + $lim
"RUNS: " + $runs


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: PASS"
        $start = Get-Date;
        Get-NoValidation -Input $good -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NoValidation -Input $sbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"No Validation: FAIL MEDIUM"
        $start = Get-Date;
        Get-NoValidation -Input $mbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"No Validation: FAIL LARGE"
        $start = Get-Date;
        Get-NoValidation -Input $lbad -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
"TOTAL TIME GOOD: " + $tTimeG
"TOTAL TIME SMALL BAD: " + $tTimeSB
"TOTAL TIME MEDIUM BAD: " + $tTimeMB
"TOTAL TIME LARGE BAD: " + $tTimeLB
"
"

"AVGL TIME GOOD: " + $tTimeG / $runs
"AVGL TIME SMALL BAD: " + $tTimeSB / $runs
"AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
"AVGL TIME LARGE BAD: " + $tTimeLB / $runs
"


"



"=========================================================================================="
"===============================  METHOD VALIDATION ======================================="
"=========================================================================================="

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;


"START RUN - LIMIT: " + $lim
"RUNS: " + $runs
"GOOD INPUT: " + $good;


For($r = 1; $r -le $runs; $r++)
{

    #"PASS"
        $start = Get-Date;
        Get-MethodValidation -Input $good -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


   # "FAIL SMALL"
        $start = Get-Date;
         Get-MethodValidation -Input $sbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"FAIL MEDIUM"
        $start = Get-Date;
         Get-MethodValidation -Input $mbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"FAIL LARGE"
        $start = Get-Date;
         Get-MethodValidation -Input $lbad -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
"TOTAL TIME GOOD: " + $tTimeG
"TOTAL TIME SMALL BAD: " + $tTimeSB
"TOTAL TIME MEDIUM BAD: " + $tTimeMB
"TOTAL TIME LARGE BAD: " + $tTimeLB
"
"

"AVGL TIME GOOD: " + $tTimeG / $runs
"AVGL TIME SMALL BAD: " + $tTimeSB / $runs
"AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
"AVGL TIME LARGE BAD: " + $tTimeLB / $runs
"


"



"=========================================================================================="
"================================  NULL VALIDATION ========================================"
"=========================================================================================="

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;


"START RUN - LIMIT: " + $lim
"RUNS: " + $runs

For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: PASS"
        $start = Get-Date;
        Get-NullValidation -Input $good -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-NullValidation -Input $sbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"No Validation: FAIL MEDIUM"
        $start = Get-Date;
        Get-NullValidation -Input $mbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"No Validation: FAIL LARGE"
        $start = Get-Date;
        Get-NullValidation -Input $lbad -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
"TOTAL TIME GOOD: " + $tTimeG
"TOTAL TIME SMALL BAD: " + $tTimeSB
"TOTAL TIME MEDIUM BAD: " + $tTimeMB
"TOTAL TIME LARGE BAD: " + $tTimeLB
"
"

"AVGL TIME GOOD: " + $tTimeG / $runs
"AVGL TIME SMALL BAD: " + $tTimeSB / $runs
"AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
"AVGL TIME LARGE BAD: " + $tTimeLB / $runs
"


"



"=========================================================================================="
"===============================  CLASS VALIDATION ========================================"
"=========================================================================================="

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;

"START RUN - LIMIT: " + $lim
"RUNS: " + $runs


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: PASS"
        $start = Get-Date;
        Get-ClassValidation -Input $good -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-ClassValidation -Input $sbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"No Validation: FAIL MEDIUM"
        $start = Get-Date;
        Get-ClassValidation -Input $mbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"No Validation: FAIL LARGE"
        $start = Get-Date;
        Get-ClassValidation -Input $lbad -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
"TOTAL TIME GOOD: " + $tTimeG
"TOTAL TIME SMALL BAD: " + $tTimeSB
"TOTAL TIME MEDIUM BAD: " + $tTimeMB
"TOTAL TIME LARGE BAD: " + $tTimeLB
"
"

"AVGL TIME GOOD: " + $tTimeG / $runs
"AVGL TIME SMALL BAD: " + $tTimeSB / $runs
"AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
"AVGL TIME LARGE BAD: " + $tTimeLB / $runs
"


"



"=========================================================================================="
"==============================  PATTERN VALIDATION ======================================="
"=========================================================================================="

$tTimeG = 0;
$tTimeSB = 0;
$tTimeMB = 0;
$tTimeLB = 0;


"START RUN - LIMIT: " + $lim
"RUNS: " + $runs


For($r = 1; $r -le $runs; $r++)
{

    #"No Validation: PASS"
        $start = Get-Date;
        Get-PatternValidation -Input $good -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeG = $tTimeG + $time.TotalMilliseconds;


    #"No Validation: FAIL SMALL"
        $start = Get-Date;
        Get-PatternValidation -Input $sbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeSB = $tTimeSB + $time.TotalMilliseconds;


    #"No Validation: FAIL MEDIUM"
        $start = Get-Date;
        Get-PatternValidation -Input $mbad -Limit $lim;
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeMB = $tTimeMB + $time.TotalMilliseconds;


    #"No Validation: FAIL LARGE"
        $start = Get-Date;
        Get-PatternValidation -Input $lbad -Limit $lim; 
        $end = Get-Date;
        $time = New-TimeSpan -start $start -end $end;
        $tTimeLB = $tTimeLB + $time.TotalMilliseconds

        "."
}


"

"
"TOTAL TIME GOOD: " + $tTimeG
"TOTAL TIME SMALL BAD: " + $tTimeSB
"TOTAL TIME MEDIUM BAD: " + $tTimeMB
"TOTAL TIME LARGE BAD: " + $tTimeLB
"

"

"AVGL TIME GOOD: " + $tTimeG / $runs
"AVGL TIME SMALL BAD: " + $tTimeSB / $runs
"AVGL TIME MEDIUM BAD: " + $tTimeMB / $runs
"AVGL TIME LARGE BAD: " + $tTimeLB / $runs

"====================== END VALIDATION RUNS ======================================"
"


"

