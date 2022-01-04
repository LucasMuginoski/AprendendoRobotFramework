***Settings***
Documentation   Encapsulamento da rota Sign Up

***Keywords***
POST User
    [Arguments]     ${payload}

    ${response}     POST     ${base_url}/signup       json=${payload}
    ...     expected_status=any
    
    [Return]        ${response}

 