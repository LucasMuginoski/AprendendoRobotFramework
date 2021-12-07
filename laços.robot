***Settings***
Documentation   Suite para exemplificar laços de repetição (Loops) em Robot Framework

***Variables***
@{AVENGERS}     Black Widow     Hulk    Ironman    Thor    Cap
@{JUSTICE}      Superman    Wonder Woman    Arrow   Batman

***Test Cases***
Meu primeiro loop
    
    FOR     ${item}     IN  @{AVENGERS}
        IF  '${item}' == 'Ironman'
            Log To Console  Obtendo Vingador: ${item}
        END
    END

Outro Loop
    [tags]  thor

    FOR     ${item}     IN  @{AVENGERS}
        Exit For Loop If    '${item}' == 'Thor' 
        Log To Console  Obtendo Vingador: ${item}
    END