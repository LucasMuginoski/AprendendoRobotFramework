****Settings***
Documentation   Conhecendo os Dicionarios do Robot (Nativo no python), herança

***Variables***
#variavel simples
${SIMPLES}  Lucas

#Variavel lista
@{CARROS}   Chevet  Opala   Camaro  Mustang

#Variavel dicionario (declaração    chave1=valor1  chave2=valor2  etc...)
&{CARRO}    nome=Chevet    cv=1500  portas=2    cor=preto

***Test Cases***
Obtendo valores de um dicionario
    #Imprimir apenas o valor referente a chave "cv"
    #Podemos criar massas de testes usando os dicionarios
    Log To Console  ${CARRO.cv}
