***Settings***
Documentation   Suite para testar a classe ContaLibrary

Library         app/ContaLibrary.py

***Test Cases***
Quando abro uma nova conta deve retornar saldo ZERADO
    Abrir Conta

    ${saldo_final}     Obter saldo
    ${saldo_esperado}   Convert To Number   0.0
    Should Be Equal     ${saldo_final}  ${saldo_esperado}

Quando faço um deposito deve refletir o valor no meu saldo
    Abrir Conta
    
    ${Valor_deposito}   Convert To Number   100.00
    Deposita            ${Valor_deposito}
    
    ${saldo_final}      Obter Saldo
    Should Be Equal     ${saldo_final}      ${Valor_deposito}

Quando faço um saque deve deduzir o valor do meu saldo
    Abrir Conta
     ${Valor_deposito}   Convert To Number   1024.00
    Deposita    ${Valor_deposito}

    ${valor_saque}      Convert To Number   100.00
    Saca        ${valor_saque}

    ${saldo_esperado}   Evaluate    ${Valor_deposito} - ${valor_saque} - 2
    ${saldo_final}      Obter Saldo

    Should Be Equal     ${saldo_final}      ${saldo_esperado}