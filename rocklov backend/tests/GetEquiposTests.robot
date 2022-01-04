***Settings***
Documentation    Get Equipo testes

Resource    ${EXECDIR}/resources/Base.robot

***Test Cases***
Get Equipo
    ${token}     Get Token    brianmay@queen.com    sdf56JKL!
    ${equipo}    Get JSON     equipos               piano.json

    Remove Equipo    ${equipo}[payload][name]
    ${result}        POST Equipo                 ${equipo}                ${token}
    ${equipo_id}     Set Variable                ${result.json()}[_id]

    ${response}      Get Unic Equipo             ${token}                 ${equipo_id}

    Status Should Be    200    ${response}
    Should Be Equal    ${equipo}[payload][name]        ${response.json()}[name]
    Should Be Equal    ${equipo}[payload][category]    ${response.json()}[category]
    Should Be Equal    ${equipo}[payload][price]       ${response.json()}[price]

Equipo Not Found
    ${equipo_id}    Get Mongo Id
    ${token}        Get Token  brianmay@queen.com    sdf56JKL!

    ${response}     Get Unic Equipo  ${token}  ${equipo_id}
    Status Should Be    404     ${response}
