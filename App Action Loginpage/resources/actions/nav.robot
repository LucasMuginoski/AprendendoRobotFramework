***Settings***
Documentation   Ações do menu superior de navegação

**Keywords***
User Should Be Logged in
    [Arguments]     ${user_name}
    Get Text        css=aside strong    should be       ${user_name}