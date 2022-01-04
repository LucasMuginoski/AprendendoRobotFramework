***Settings***
Documentation    Sign up User tests

#Library     FakerLibrary
# evitar usar faker por conta do crescimento exponencial do banco de dados (custos)
Resource    ${EXECDIR}/resources/Base.robot

***Test Cases***
Cenário: ADD new user
    # pré condição
    ${payload}    Get JSON    signup    new_user.json
    Remove User By Email    ${payload['email']}

    # condição do teste
    ${response}             POST User              ${payload}
    Status Should Be        200                    ${response}

Cenário: Duplicated email
    # pré condição
    ${payload}    Get JSON    signup    duplicated_user.json
    POST User  ${payload}

    # condição do teste
    ${response}             POST User              ${payload}
    Status Should Be        409                    ${response}
