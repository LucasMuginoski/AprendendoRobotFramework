***Settings***
Documentation    Add equipos testes

Resource    ${EXECDIR}/resources/Base.robot

***Test Cases***
Add New Equipo
    ${token}      Get Token    brianmay@queen.com     sdf56JKL!
    ${equipo}    Get JSON     equipos                fender.json

    Remove Equipo    ${equipo}[payload][name]
    
    ${response}      POST Equipo           ${equipo}    ${token} 

    Status Should Be    200     ${response}
