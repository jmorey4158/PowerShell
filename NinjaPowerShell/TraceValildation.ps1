



    $bad = Get-SmallBadInput

    "Get-NoValidation"
    Trace-Command -Name CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion -Expression {Get-NoValidation} -ListenerOption Callstack -PSHost

        #"Get-NoValidation, -Input -Limit 1 "
    #Get-NoValidation -Input -Limit 1
    #trap[ParameterBindingValidationException]{"ParameterBindingValidationException"}
    #trap[ParameterBindingException]{"ParameterBindingException"}
    #trap[FormatException]{"FormatException"}
    #trap[Exception]{"Exception"}


    #"Get-MethodValidation, -Input -Limit 1"
    #Trace-Command -Name CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion -Expression {Get-MethodValidation -Input -Limit 1} -ListenerOption Callstack -PSHost


    #"Get-NullValidation, -Input -Limit 1"
    #Trace-Command -Name CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion -Expression {Get-NullValidation -Input -Limit 1} -ListenerOption Callstack -PSHost


    #"Get-ClassValidation, -Input -Limit 1"
    #Trace-Command -Name CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion -Expression {Get-ClassValidation -Input -Limit 1} -ListenerOption Callstack -PSHost


    #"Get-NoValidation, -Input bad -Limit 1"
    #Trace-Command -Name CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion -Expression {Get-NoValidation -Input $bad -Limit 1} -ListenerOption Callstack -PSHost


    #"Get-MethodValidation, -Input bad -Limit 1"
    #Trace-Command -Name CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion -Expression {Get-MethodValidation -Input $bad -Limit 1} -ListenerOption Callstack -PSHost


   #"Get-NullValidation, -Input bad -Limit 1"
   #Trace-Command -Name CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion -Expression {Get-NullValidation -Input $bad -Limit 1} -ListenerOption Callstack -PSHost


    #"Get-ClassValidation, -Input bad -Limit 1"
    #Trace-Command -Name CommandDiscovery","ParameterBinderBase","ParameterBinderController","ParameterBinding","TypeConversion -Expression {Get-ClassValidation -Input $bad -Limit 1} -ListenerOption Callstack -PSHost
