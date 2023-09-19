*** Settings ***
Documentation        Testes do formulário de registro Walkdog

Resource    ${EXECDIR}/resources/pages/WalkdogRegistrationPage.robot

Test Setup        Iniciar sessao
Test Teardown     Finalizar sessao

*** Test Cases ***

Cadastro de Dog Walker com sucesso
    [Documentation]    Cadastro de Dog Walker com dados válidos
    [Tags]    registered_successfully

    Submeter formulário    Wagner Galvão    emaildowagner@gmail.com    12345678912    01001-000    1    Catedral Metropolitana    RG-FAKE-2.jpg
    Validar popup de sucesso

Validar campos obrigatórios
    [Documentation]    Validar mensagens de campos obrigatórios
    [Tags]    required_fields

    Verificar campos obrigatorios

Validar preenchimento invalido
    [Documentation]    Cadastro de Dog Walker com dados válidos
    [Tags]    invalid_fields

    Submeter formulário    Wagner Galvão    emailgmail.com    123456789    01001    s/n    Catedral Metropolitana    image=
    Verificar dados invalidos