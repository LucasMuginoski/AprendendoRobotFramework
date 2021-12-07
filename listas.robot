***Settings***
Documentation    Conhecendo as Listas

Library          Collections
#Manipulação de listas

***Variables***
@{AVENGERS}     Black Widow     Hulk    Ironman    Thor    Cap
@{JUSTICE}      Superman    Wonder Woman    Arrow   Batman  
# O @ define o tipo - lista, mas seu simbolo é o $
***Test Cases***
Minha Lista
    #Log To Console  ${AVENGERS}
    #Log To Console  ${AVENGERS[0]}
    # usando biblioteca colections para alterar o nome do ironman de maneira independente da posicao

    # ${index}    Get Index From List     ${AVENGERS}     Ironman
    # Log To Console   ${index}

    # Set List Value   ${AVENGERS}    ${index}    Homem de Ferro
    
    # Log To Console   ${AVENGERS}
    
    #Remover item da lista
    # ${index_Thor}    Get Index From List     ${AVENGERS}     Thor
    #Remove From List    ${AVENGERS}     ${index_Thor}

    #Log To Console   ${AVENGERS} 

    #Combinar Listas
    ${Cross_over}    Combine Lists   ${AVENGERS}     ${JUSTICE}
    Log To Console  ${Cross_over}