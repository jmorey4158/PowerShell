. .\ShowException.ps1

$good = Get-GoodInput
$bad = "lksdjfdslfj"

$exp = "Get-ClassValidation -Input $bad -Limit 1", "Get-ClassValidation -Input $good -Limit 1"

ShowException ($exp)