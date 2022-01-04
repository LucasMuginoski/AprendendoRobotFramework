***Settings***
Documentation   Encapsulamento das rotas da API (SIMILAR ao page object)

***Keywords***
POST Login
    [Arguments]     ${payload}

    ${response}     POST     ${base_url}/sessions       json=${payload}
    ...     expected_status=any
    
    [Return]        ${response}

 