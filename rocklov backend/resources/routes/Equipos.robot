***Settings***
Documentation    Encapsulamento das rotas da API EQUIPOS

Library    OperatingSystem

***Keywords***
POST Equipo
    [Arguments]     ${equipo}           ${token}           
    &{headers}      Create Dictionary    user_token=${token}
    ${bin_image}    Get Binary File      ${EXECDIR}/resources/fixtures/equipos/thumbnails/${equipo}[thumb]

    &{thumbnail}    Create Dictionary      thumbnail=${bin_image}
    ${response}     POST                   ${base_url}/equipos       data=${equipo}[payload]    headers=${headers}
    ...             files=${thumbnail}
    ...             expected_status=any

    [Return]    ${response}

Get Unic Equipo
    [Arguments]     ${token}        ${equipo_id}
    &{headers}      Create Dictionary    user_token=${token}

    ${response}     GET     ${base_url}/equipos/${equipo_id}
    ...             headers=${headers}
    ...             expected_status=any

    [Return]        ${response}