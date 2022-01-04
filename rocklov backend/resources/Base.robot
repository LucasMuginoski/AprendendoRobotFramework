***Settings***
Documentation    Arquivo base

Library    RequestsLibrary
Library    OperatingSystem
Library    libs/mongo.py


Resource    ${EXECDIR}/resources/routes/Sessions.robot
Resource    ${EXECDIR}/resources/routes/SignUp.robot
Resource    ${EXECDIR}/resources/routes/Equipos.robot

***Variables***
${base_url}    https://rocklov-muginoski-api.herokuapp.com

***Keywords***
Get JSON
    [Arguments]    ${route}    ${file_name}
    ${fixture}     Get File    ${EXECDIR}/resources/fixtures/${route}/${file_name}
    ${json}        Evaluate    json.loads($fixture)                                   json
    [Return]       ${json}

Get Token
    [Arguments]    ${email}    ${password}

    &{payload}       Create Dictionary    email=${email}                      password=${password}
    ${response}      POST Login           ${payload}
    ${user_token}    Set Variable         ${response.json()}[user_token]    

    [Return]    ${user_token}