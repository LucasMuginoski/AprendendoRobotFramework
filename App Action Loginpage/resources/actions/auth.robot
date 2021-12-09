***Settings***
Documentation   Ações de autorização

**Keywords***
Go To Login Page

    #função para abertura do chrome e acesso a aplicação
    New Browser     chromium    False
    New Page        https://bodytest-web-muginoski.herokuapp.com/

Login With  
    
    #função de localização, preenchimento e envio dos elementos e credenciais de acesso
    [Arguments]     ${email}    ${password}

    Fill Text   css=input[name=email]            ${email}
    Fill Text   css=input[placeholder*=senha]    ${password}
    Click       text=Entrar

Toaster Text Should Be 
    [Arguments]     ${expected_text}
    Wait For Elements State      css=.Toastify__toast-body >> text=${expected_text}        visible      5

Alert Text Should Be
    [Arguments]     ${expected_text}
    Wait For Elements State     css=form span >> text=Informe um e-mail válido     visible     5
