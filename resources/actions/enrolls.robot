***Settings***
Documentation   Ações da funcionalidade de Gestão de Matrículas

***Keywords***
## ========== Links & Buttons ==========
Go To Form Enroll
    Click   css=a[href$="matriculas/new"]
    Wait For Elements State     css=h1 >> text=Nova matrícula     visible     5

## ========== Forms ==========
Select Student
    [Arguments]     ${name}
    Fill Text       css=input[aria-label=student_id]        ${name}
    Click           css=div[id*=option] >> text=${name}
    # contem option no id.

Select Plan
    [Arguments]     ${tittle}
    Fill Text       css=input[aria-label="plan_id"]       ${tittle}
    Click           css=div[id*=option] >> text=${tittle}
    # contem option no id.

Save Plan
    Click           css=button[form="formEnrollment"]

## ========== Validate ==========
Start Date Should Be Today
    ${start_date}     Get Current Date            result_format=%d/%m/%Y

    Get Attribute       css=input[name="start_date"]        value       equal       ${start_date}

End Date Should Be
    [Arguments]     ${days}
    ${current_date}     Get Current Date
    ${end_date}         Add Time To Date    ${current_date}     ${days} days     result_format=%d/%m/%Y
    Get Attribute       css=input[name="end_date"]          value       equal       ${end_date}
