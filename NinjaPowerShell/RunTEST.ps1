
$seq = "agctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagct"
$limit = 1000;

"Starting Run: "
"
"
$start = Get-Date;
"No Validation: PASS"
    Get-DnaStatsNoValidation -Sequence $seq -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds;
    "
    "


$start = Get-Date;
"Attribute Null Validation: PASS"
Get-DnaStatsAttributeNullValidation -Sequence $seq -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds
    "
    "


$start = Get-Date;
"Attribute Class Validation: PASS"
    Get-DnaStatsAttributeValidation -Sequence $seq -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds
    "
    "


$start = Get-Date;
"Method Validation: PASS"
    Get-DnaStatsMethodValidation -Sequence $seq -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds;
    "
    "


$start = Get-Date;
"Attribute Pattern Validation: PASS"
Get-DnaStatsPatternValidation -Sequence $seq -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds
    "
    "





$seq2 = "#gctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagctagctcgtagtgctactactagctgactgatgctagctgatcgtagctgatcgatgctagcgtatcgtagct"
"
"

$start = Get-Date;
"No Validation: FAIL"
Get-DnaStatsNoValidation -Sequence $seq2 -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds
    "
    "



$start = Get-Date;
"Attribute Null Validation: FAIL"
Get-DnaStatsAttributeNullValidation -Sequence $seq2 -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds
"
"



$start = Get-Date;
"Attribute Class Validation: FAIL"
Get-DnaStatsAttributeValidation -Sequence $seq2 -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds
    "
    "



$start = Get-Date;
"Method Validation: FAIL"
Get-DnaStatsMethodValidation -Sequence $seq2 -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds
    "
    "



$start = Get-Date;
"Attribute Pattern Validation: FAIL"
Get-DnaStatsPatternValidation -Sequence $seq -Limit $limit;
    $end = Get-Date;
    $time = New-TimeSpan -start $start -end $end;
    "Total Milliseconds: " + $time.TotalMilliseconds
    "
    "
