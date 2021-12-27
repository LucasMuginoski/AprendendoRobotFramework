***Settings***
Documentation   Ações de autorização

**Keywords***
Go To Login Page
    #função para abertura do chrome e acesso a aplicação
    Go To   https://bodytest-web-muginoski.herokuapp.com/

Login With  
    
    #função de localização, preenchimento e envio dos elementos e credenciais de acesso
    [Arguments]     ${email}    ${password}

    Fill Text   css=input[name=email]            ${email}
    Fill Text   css=input[placeholder*=senha]    ${password}
    Click       text=Entrar
