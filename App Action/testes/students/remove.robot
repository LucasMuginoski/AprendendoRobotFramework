***Settings***
Documentation   Remover alunos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Session
Test Setup      Start Admin Session
Test Teardown   Take Screenshot


***Test Cases***
Cenário: Remover aluno cadastrado
    [Tags]  remove

    &{student}      Create Dictionary   name=Joey Tribbiani      email=joey_tribbiani@gmail.com  age=24    weight=73   feet_tall=1.71
    
    Insert Student              ${student}
    
    Go To Students
    Search Student By Name              ${student.name}
    Request Removal By Email            ${student.email}
    take Screenshot
    Confirm Removal
    Toaster Text Should Be              Aluno removido com sucesso.
    Student Should Not Be Visible       ${student.email}

    [Teardown]      Thinking And Take Screenshot  2
    LocalStorage Clear

Cenário: Desistencia da Exclusão
    
    &{student}      Create Dictionary   name=Monica Geller      email=monica_cheff@gmail.com  age=23    weight=50   feet_tall=1.62
    
    Insert Student              ${student}
    Go To Students
    Search Student By Name              ${student.name}
    Request Removal By Email            ${student.email}
    Cancel Removal
    Student Should Be Visible           ${student.email}
    #Remove Student                      ${student.email}  
    LocalStorage Clear

