***Settings***
Documentation   Suite da tela de Cadastro de alunos

Resource    ../resources/base.robot

Suite Setup     Start Browser Session
Library         Collections

***Test Cases***
Novo Aluno
    [Tags]  new
    &{student}      Create Dictionary   name=Chandler Bing      email=chandler_bing@mail.com  age=25    weight=69   feet_tall=1.73
    
    # Remove Student => KW definida na library para remover email do banco de dados
    Remove Student      ${student.email}  
    # 3 validar se login foi efetuado como deveria
    User Should Be Logged in    Administrador

    Go To Students
    Go To Form Student
    New Student     ${student}
    #validação
    Toaster Text Should Be   Aluno cadastrado com sucesso.
    [Teardown]      Thinking And Take Screenshot  2
    LocalStorage Clear

Email não pode estar registrado em duplicidade
    [Tags]  Dup
    
    Go To Login Page
    Login With  admin@bodytest.com  pwd123
    User Should Be Logged in    Administrador
    
    &{student}      Create Dictionary   name=Ross Geller      email=ross.geller@gmail.com  age=25    weight=80   feet_tall=1.80 
    Insert Student      ${student}
    Go To Students
    Go To Form Student
    New Student         ${student}
    Toaster Text Should Be   Email já existe no sistema.

    [Teardown]      Thinking And Take Screenshot  2
    
Todos os campos devem ser obrigatórios
    [Tags]  obrig
    
    Go To Login Page
    Login With  admin@bodytest.com  pwd123
    User Should Be Logged in    Administrador

    @{expected_alert}   Set Variable    Nome é obrigatório      O e-mail é obrigatório      idade é obrigatória     o peso é obrigatório        a Altura é obrigatória
    @{gotten_alerts}       Creat List      

    Go To Students
    Go To Form Student
    Submit Student Form

    FOR  ${Alert}  IN  @{expected_alert}

        Alert Text Should Be  ${Alert} 
    END

    #FOR  ${index}  IN RANGE 1   6
    #   ${span}     Get Text    xpath=(//form//span[${index}])
    #  Append To List   ${gotten_alerts}      ${span}
    #END
    #Log     ${expected_alert}
    #Log     ${gotten_alerts}