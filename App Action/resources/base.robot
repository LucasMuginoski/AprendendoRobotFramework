***Settings***
Documentation   Tudo começa aqui, meu arquivo base do projeto de automação

Library     Browser
Library     libs/DeloreanLibrary.py

Resource        actions/auth.robot
#auth de authentificator
Resource        actions/nav.robot
Resource        actions/students.robot
Resource        actions/components.robot


***Keywords***
Start Browser Session
    New Browser     chromium    False
    New Page        about:blank

Take Screenshot And Clear LocalStorage
    Take Screenshot
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]     ${timeout}
    Sleep       ${timeout}
    Take Screenshot

