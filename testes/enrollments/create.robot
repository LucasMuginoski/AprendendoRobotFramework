***Settings***
Documentation   Gestão de matriculas

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Session
Test Setup      Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenário: Deve exibir datas iniciais e finais
    [Tags]  datas

    ${fixture}      Get JSON    enroll-dates.json
    ${john}         Set Variable        ${fixture['student']}
    ${black}        Set Variable        ${fixture['plan']}

    Insert Student      ${john} 
    Insert Plan         ${black}
    Go To Enrolls
    Go To Form Enroll
    Select Student      ${john['name']}
    Select Plan         ${black['title']}
    
    Start Date Should Be Today
    End Date Should Be  ${fixture['days']}

Cenário: Deve matricular um aluno
    [Tags]  matricular
    
    ${fixture}      Get JSON            enroll-create.json
    ${sarah}        Set Variable        ${fixture['student']}
    ${fit}          Set Variable        ${fixture['plan']}

    Insert Student      ${sarah}
    Insert Plan         ${fit}
    Go To Enrolls
    Go To Form Enroll
    Select Student      ${sarah['name']}
    Select Plan         ${fit['title']}
    Save Plan
    Toaster Text Should Be   Matrícula cadastrada com sucesso

    [Teardown]      Thinking And Take Screenshot    2
