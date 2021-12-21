***Settings***
Documentation   Casos de atualização de alunso

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Session
Test Setup      Start Admin Session
Test Teardown   Take Screenshot


***Test Cases***
Cenário: Atualizar um aluno já cadastrado
    ${fixture}      Get JSON     students-update.json
    ${kamalakhan}   Set Variable    ${fixture['before']}
    ${missmarvel}     Set Variable    ${fixture['after']}

    Remove Student By Name      ${kamalakhan['name']}
    Remove Student By Name      ${missmarvel['name']}

    Insert student     ${kamalakhan}
    Go To Students      
    Search Student By Name          ${kamalakhan['name']}
    Go To Student Update Form       ${kamalakhan['email']}
    Update Student                  ${missmarvel}
    Toaster Text Should Be          Aluno Atualizado com sucesso.
    Thinking And Take Screenshot    2
    LocalStorage Clear

***Keywords***
Go To Student Update Form
    [Arguments]             ${email}
    Click                   xpath=//td[contains(text(),"${email}")]/..//a[@class="edit"]
    Wait For Elements State    css=h1 >> text="Edição de aluno"     visible     5
