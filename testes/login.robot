***Settings***
Documentation       Suite de testes dos cenários de Login do Administrador

Library     Browser

***Test Cases***
Login do Administrador
    # [tags]          temp

    # 1 definir o browser e depois abrir new page
    #(Safari é feito com base no Webkit, e para automatizar testes para safari usar webkit)
    # headless(2º parametro) = True -> navegador fica oculto e não vejo a automação
    New Browser     chromium    True
    New Page        https://bodytest-web-muginoski.herokuapp.com/
    
    # 2 automatizar tela de login
    Fill Text   css=input[name=email]       admin@bodytest.com
    Fill Text   css=input[name=password]    pwd123      #estratégia de seletor css
    Click       text=Entrar                 #usando estratégia de texto ->entrar
    
    # 3 validar se login foi efetuado como deveria
    Get Text    css=aside strong            should be       Administrador
    Take Screenshot

Senha incorreta
    [tags]          temp
    New Browser     chromium    False
    New Page        https://bodytest-web-muginoski.herokuapp.com/

    Fill Text   css=input[name=email]       admin@bodytest.com
    Fill Text   css=input[name=password]    abc123
    Click       text=Entrar

    #busca elemento pela class (.) / pelo id (#)
    # Como esperar a api responder com mensagem de erro (aguarda até 5s para aparecer o toaster e verif.)
    # pode levar de 0 a 5seg -> sleep congela até o tempo explicito

    Wait For Elements State      css=.Toastify__toast-body   visible    5
    Get Text                css=.Toastify__toast-body   should be       Usuário ou senha inválido

    # BONUS ==outra forma de fazer, combinando duas estratégias de loc em 1 unica linha
    # Wait For Elements State      css=.Toastify__toast-body >> text=Usuário ou senha inválido        visible      5

Email incorreto
    [Tags]          temp
    New Browser     chromium    False
    New Page        https://bodytest-web-muginoski.herokuapp.com/
    
    # email incorreto sendo inserido
    Fill Text   css=input[name=email]       admin&bodytest.com
    Fill Text   css=input[name=password]    pwd123
    Click       text=Entrar

    Wait For Elements State     css=form span >> text=Informe um e-mail válido     visible     5

Senha não informada
    [Tags]          temp
    New Browser     chromium    False
    New Page        https://bodytest-web-muginoski.herokuapp.com/
    
    # A senha não será inserida
    Fill Text   css=input[name=email]       admin@bodytest.com
    Fill Text   css=input[name=password]    ${EMPTY}
    Click       text=Entrar

    Wait For Elements State     css=form span >> text=A senha é obrigatória     visible     5

Email Não informado
    [Tags]          temp
    New Browser     chromium    False
    New Page        https://bodytest-web-muginoski.herokuapp.com/
    
    # A senha não será inserida
    Fill Text   css=input[name=email]       ${EMPTY}
    Fill Text   css=input[name=password]    pwd123
    Click       text=Entrar

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório     visible     5

Email e Senha não informados
    [Tags]          temp
    New Browser     chromium    False
    New Page        https://bodytest-web-muginoski.herokuapp.com/
    
    # A senha não será inserida
    Fill Text   css=input[name=email]       ${EMPTY}
    Fill Text   css=input[name=password]    ${EMPTY}
    Click       text=Entrar

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório     visible     5
    Wait For Elements State     css=form span >> text=A senha é obrigatória      visible     5