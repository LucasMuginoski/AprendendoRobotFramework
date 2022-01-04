***Settings***
Documentation    Sessions Attempt login tests

Resource    ${EXECDIR}/resources/Base.robot

Test Template    Attempt Login
#template a nível suite de testes

***Test Cases***               json_file               status_code    message
Cenário: incorrect password    incorrect_pass.json     401            Unauthorized
Cenário: user not found        user_not_found.json     401            Unauthorized
Cenário: incorrect email       incorrect_email.json    412            wrong email
Cenário: empty email           empty_email.json        412            required email
Cenário: empty PASSWORD        empty_pass.json         412            required password
Cenário: without email         without_email.json      412            required email
Cenário: without PASSWORD      without_pass.json       412            required password

***Keywords***
Attempt Login
    [Arguments]    ${json_file}    ${status_code}    ${message}

    ${payload}          Get JSON          sessions                     ${json_file}
    ${response}         POST Login        ${payload} 
    Status Should Be    ${status_code}    ${response}
    Should Be Equal     ${message}        ${response.json()}[error]