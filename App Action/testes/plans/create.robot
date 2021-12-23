***Settings***
Documentation   Suite da tela de Cadastro de planos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Session
Test Setup      Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenário: Calcular preço total do plano
    [Tags]  calc
    &{plan}     Create Dictionary       title=Papito Teste      duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form          ${plan}
    Total Plan Should Be    ${plan.total}
    
#CADASTRO, CONSULTA, EXCLUSAO E ATUALIZAÇÃO