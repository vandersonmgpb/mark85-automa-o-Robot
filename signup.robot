*** Settings ***
Documentation        Cenários de testes de cadastro de usuários

Library              Browser
Library              FakerLibrary    

*** Test Cases ***
Deve poder cadastrar um novo usuário
    ${name}         FakerLibrary.name
    ${email}        FakerLibrary.Free Email
    ${password}     Set Variable      pwd123

    New Browser                browser=chromium        headless=False
    New Page                   http://localhost:3000/signup

    # Checkpoint
    Wait For Elements State    css=h1    visible      5
    Get Text                   css=h1    equal        Faça seu cadastro

    Fill Text    id=name         ${name}
    Fill Text    id=email        ${email}
    Fill Text    id=password     ${password}

    Click    id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal    Boas vindas ao Mark85, o seu gerenciador de tarefas.    
    Sleep    5