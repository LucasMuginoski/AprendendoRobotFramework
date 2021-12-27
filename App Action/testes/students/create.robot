***Settings***
Documentation   Suite da tela de Cadastro de alunos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Session
Test Setup      Start Admin Session
Test Teardown   Take Screenshot


***Test Cases***
Cenário: Novo Aluno
    [Tags]  new
    &{student}      Create Dictionary   name=Chandler Bing      email=chandler_bing@mail.com  age=25    weight=69   feet_tall=1.73
    
    # Remove Student => KW definida na library para remover email do banco de dados
    Remove Student      ${student.email}  
    # 3 validar se login foi efetuado como deveria

    Go To Students
    Go To Form Student
    New Student     ${student}
    #validação
    Toaster Text Should Be   Aluno cadastrado com sucesso.
    [Teardown]      Thinking And Take Screenshot  2
    LocalStorage Clear

Cenário: Email não pode estar registrado em duplicidade
    [Tags]  Dup   
    
    &{student}      Create Dictionary   name=Ross Geller      email=ross.geller@gmail.com  age=25    weight=80   feet_tall=1.80 
    Insert Student      ${student}
    Go To Students
    Go To Form Student
    New Student         ${student}
    Toaster Text Should Be   Email já existe no sistema.

    [Teardown]      Thinking And Take Screenshot  2
    LocalStorage Clear

Cenário: Todos os campos devem ser obrigatórios
    [Tags]  obrig


    @{expected_alert}   Set Variable    Nome é obrigatório      O e-mail é obrigatório      idade é obrigatória     o peso é obrigatório        a Altura é obrigatória
    @{gotten_alerts}    Create List      

    Go To Students
    Go To Form Student
    Submit Student Form

    FOR     ${index}       IN RANGE    1   6
        ${span}          Get Required Alerts    ${index}
        Append To List   ${gotten_alerts}      ${span}
    END

    Log     ${expected_alert}
    Log     ${gotten_alerts}

    Lists Should Be Equal       ${expected_alert}       ${gotten_alerts}
    LocalStorage Clear

Cenário: Validar do campo tipo email
    #[Tags]  type

    [Template]  Check Type Field On Student Form
    ${EMAIL_FIELD}  email
    

Cenário: Validar campos numéricos
    [Tags]  type

    [Template]  Check Type Field On Student Form
    ${AGE_FIELD}            number
    ${WEIGHT_FIELD}         number
    ${FEET_TALL_FIELD}      number

Cenário: Menor de 14 anos não pode fazer Cadastro
    [Tags]  menor

    &{student}      Create Dictionary   name=Livia Da Silva      email=livflorzinha@yahoo.com  age=13    weight=49   feet_tall=1.49

    Go To Students
    Go To Form Student
    New Student                 ${student}
    Alert Text Should Be        A idade deve ser maior ou igual 14 anos
    LocalStorage Clear

***Keywords***
Check Type Field On Student Form
    #faz parte da suite por ser a kw de template
    [Arguments]     ${element}      ${type}
    
    Go To Students
    Go To Form Student
    Field Should Be Type    ${element}      ${type}
    LocalStorage Clear
