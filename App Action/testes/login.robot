***Settings***
Documentation       Suite de testes dos cenários de Login do Administrador

Resource    ../resources/base.robot

Suite Setup     Start Browser Session
Test Teardown   Take Screenshot
***Test Cases***
Login do Administrador
    [tags]          admin
    # 1 definir o browser e depois abrir new page
    #(Safari é feito com base no Webkit, e para automatizar testes para safari usar webkit)
    # headless(2º parametro) = True -> navegador fica oculto e não vejo a automação
    
    #https://bodytest-web-muginoski.herokuapp.com/
    auth.Go To Login Page
    auth.Login With  admin@bodytest.com  pwd123
    
    # 3 validar se login foi efetuado como deveria
    nav.User Should Be Logged in    Administrador
    [Teardown]      Take Screenshot And Clear LocalStorage
    #gancho de resolução problema de login

Senha incorreta
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  abc123
    Toaster Text Should Be     Usuário e/ou senha inválidos
    
    #thinking time
    [Teardown]  Thinking And Take Screenshot    2

Email não cadastrado
    auth.Go To Login Page
    auth.Login With                 mariana@gmail.com  abc123
    Toaster Text Should Be     Usuário e/ou senha inválidos
    
    #thinking time
    [Teardown]  Thinking And Take Screenshot    2


Email incorreto
    auth.Go To Login Page
    
    # email incorreto sendo inserido
    auth.Login With             admin#bodytest.com        pwd123
    Alert Text Should Be   Informe um e-mail válido

Senha não informada
    auth.Go To Login Page
    
    # A senha não será inserida
    auth.Login With             admin@bodytest.com      ${EMPTY}
    Alert Text Should Be   A senha é obrigatória


Email Não informado
    auth.Go To Login Page
    
    #email nao inserido
    auth.Login With               ${EMPTY}                pwd123
    Alert Text Should Be     O e-mail é obrigatório

Email e Senha não informados
    auth.Go To Login Page
    
    # O email e a senha não serão inseridos
    auth.Login With               ${EMPTY}  ${EMPTY} 
    Alert Text Should Be     O e-mail é obrigatório
    Alert Text Should Be     A senha é obrigatória

