***Settings***
Documentation       Suite de testes dos cenários de Login do Administrador

Resource    ../resources/base.robot

***Test Cases***
Login do Administrador
    [tags]          admin

    # 1 definir o browser e depois abrir new page
    #(Safari é feito com base no Webkit, e para automatizar testes para safari usar webkit)
    # headless(2º parametro) = True -> navegador fica oculto e não vejo a automação
    New Browser     chromium    True
    New Page        https://bodytest-web-muginoski.herokuapp.com/
    
    auth.Login With  admin@bodytest.com  pwd123
    
    # 3 validar se login foi efetuado como deveria
    nav.User Should Be Logged in    Administrador
    Take Screenshot

Senha incorreta
    [tags]          temp
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  abc123
    auth.Toaster Text Should Be     Usuário ou senha inválido

Email incorreto
    [Tags]          temp
    auth.Go To Login Page
    
    # email incorreto sendo inserido
    auth.Login With             admin#bodytest.com        pwd123
    auth.Alert Text Should Be   Informe um e-mail válido

Senha não informada
    [Tags]          temp
    auth.Go To Login Page
    
    # A senha não será inserida
    auth.Login With             admin@bodytest.com      ${EMPTY}
    auth.Alert Text Should Be   A senha é obrigatória

Email Não informado
    [Tags]          temp
    auth.Go To Login Page
    
    #email nao inserido
    auth.Login With               ${EMPTY}                pwd123
    auth.Alert Text Should Be     O e-mail é obrigatório

Email e Senha não informados
    [Tags]          temp
    auth.Go To Login Page
    
    # O email e a senha não serão inseridos
    auth.Login With               ${EMPTY}  ${EMPTY} 
    auth.Alert Text Should Be     O e-mail é obrigatório
    auth.Alert Text Should Be     A senha é obrigatória

#Agora temos 100% de App Actions
