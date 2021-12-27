***Settings***
Documentation   Suite para cenários de busca de alunos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Session
Test Setup      Start Admin Session
Test Teardown   Take Screenshot


***Test Cases***
Cenário: Busca exata
    [Tags]  exata

    &{student}      Create Dictionary   name=Steve Jobs      email=jobs@apple.com  age=45    weight=80   feet_tall=1.80
    
    Remove Student By Name               ${student.name}
    Insert Student                      ${student}
    Go To Students
    Search Student By Name              ${student.name}
    Student Name Should Be Visible      ${student.name}
    Total Item Should Be  1
    LocalStorage Clear


Cenário: Registro não encontrado
    [Tags]  naoencontrado
    ${name}     Set Variable      Barão Zemo  
    Remove Student By Name              ${name}
    Go To Students
    Search Student By Name              ${name}
    Register Should Not Be Found

Cenário: Busca por um único termo
    [Tags]  json
    #unico termo de busca que traga mais de um registro
    ${fixture}      Get JSON    students-search.json
    ${students}     Set Variable    ${fixture['students']}
    ${word}         Set Variable    ${fixture['word']}
    ${total}         Set Variable    ${fixture['total']}

    Remove Student By Name      ${word}
    #Criar os usuários
    FOR     ${item}     IN      @{students}

        #usar @ para o robot interpretar o json como lista e localizar o elemento
        Insert Student      ${item}
    END

    Go To Students
    Search Student By Name      ${word}
    
    FOR     ${item}     IN      @{students}
        Student Name Should Be Visible      ${item['name']}
    END
    Total Item Should Be  ${total}
