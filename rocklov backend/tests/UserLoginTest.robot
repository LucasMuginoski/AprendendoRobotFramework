***Settings***
Documentation    User Login Test

Resource    ${EXECDIR}/resources/Base.robot

***Test Cases***
Cenário: Successfull User login
    [Tags]        login
    ${payload}    Get JSON    sessions    user_login.json

    ${response}         POST Login      ${payload}
    Status Should Be    200             ${response}
    ${token}            Set Variable    ${response.json()}[user_token]

    Length Should Be    ${token}    24
    #valida tamanho da string token
