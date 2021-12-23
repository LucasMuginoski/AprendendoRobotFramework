***Settings***
Documentation   Ações do menu superior de navegação

**Keywords***
User Should Be Logged in
    [Arguments]     ${user_name}
    Get Text        css=aside strong    should be       ${user_name}

Go To Students
    Click   css=a[href$=alunos]
    Wait For Elements State     css=h1 >> text=Gestão de Alunos     visible     5

Go To Plans
    Click   css=a[href$=planos]
    Wait For Elements State     css=h1 >> text=Gestão de Planos     visible     5

Go To Enrolls
    Click   css=a[href$=matriculas]
    Wait For Elements State     css=h1 >> text=Gestão de Matrículas     visible     5