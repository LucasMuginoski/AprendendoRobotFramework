***Settings***
Documentation   Suite de testes de API do google

Library         RequestsLibrary

***Test Cases***
Quick Get Request
    ${resposta}=     GET    https://www.google.com.br

Quick Get Request with parameters Test
    ${resposta}=     GET    https://www.google.com.br       params=query=ciao       expected_status=200

Queck Get a JSON body test
    ${resposta}=     GET    https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings   1   ${resposta.json()}[id]