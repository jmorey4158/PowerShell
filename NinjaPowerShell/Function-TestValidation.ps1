



    $bad = Get-SmallBadInput

    Get-NoValidation

        "Get-NoValidation, -Input -Limit 1 "
    Get-NoValidation -Input -Limit 1
    #trap[ParameterBindingValidationException]{"ParameterBindingValidationException"}
    #trap[ParameterBindingException]{"ParameterBindingException"}
    #trap[FormatException]{"FormatException"}
    #trap[Exception]{"Exception"}


        "Get-MethodValidation, -Input -Limit 1"
    Get-MethodValidation -Input -Limit 1


        "Get-NullValidation, -Input -Limit 1"
    Get-NullValidation -Input -Limit 1


        "Get-ClassValidation, -Input -Limit 1"
    Get-ClassValidation -Input -Limit 1


         "Get-NoValidation, -Input bad -Limit 1"
    Get-NoValidation -Input $bad -Limit 1


        "Get-MethodValidation, -Input bad -Limit 1"
    Get-MethodValidation -Input $bad -Limit 1


        "Get-NullValidation, -Input bad -Limit 1"
    Get-NullValidation -Input $bad -Limit 1


        "Get-ClassValidation, -Input bad -Limit 1"
    Get-ClassValidation -Input $bad -Limit 1
