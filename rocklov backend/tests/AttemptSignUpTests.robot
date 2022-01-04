***Settings***
Documentation    Attempts sign up test cases

Resource         ${EXECDIR}/resources/Base.robot
Test Template    Attempt SignUp

***Test Cases***    scenario                        message
Empty Name          empty_name                      required name
Empty Email         empty_email                     required email
Empty Password      empty_pass                      required password
Without Name        without_name                    required name
Without Email       without_email                   required email
Without Password    without_pass                    required password
Wrong Email         wrong_email                     wrong email

***Keywords***
Attempt SignUp
    [Arguments]     ${scenario}         ${message}
    ${attempt}    Get JSON    signup    attempt.json

    # condição do teste
    ${response}             POST User              ${attempt['${scenario}']}
    Status Should Be        412                    ${response}
    Should Be Equal     ${message}        ${response.json()}[error]