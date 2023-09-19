*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

Test Setup          Acessar Site Walkdog para ser Dog Walker
Test Teardown       Close Browser

*** Variables ***
${join_community_link}    //a[@href='/signup']
${name_input}             //input[@name='name']
${email_input}            //input[@name='email']
${cpf_input}              //input[@name='cpf']
${cep_input}              //input[@name='cep']
${buscar_cep_btn}         //input[@type='button'][@value='Buscar CEP']
${street_input}           //input[@name='addressStreet']
${number_input}           //input[@name='addressNumber']
${details_input}          //input[@name='addressDetails']
${district_input}         //input[@name='addressDistrict']
${city_uf_input}          //input[@name='addressCityUf']
${cuidar_img}             //ul[@class='walker-service']//li[1]/img
${adestrar_img}           //ul[@class='walker-service']//li[2]/img
${file_path}              ${EXECDIR}/resources/RG-FAKE-2.jpg
${file_upload_field}      //input[@type='file']
${submit_btn}             //button[@class='button-register']
${popup_icon}             //div[class='swal2-icon swal2-success swal2-icon-show']
${popup_confirm_button}   //button[contains(text(),'Voltar')]
${popup_title}            Obrigado!
${popup_content}          Recebemos o seu cadastro e em breve retornaremos o contato.
${name_input_err}         //span[@class='alert-error' and text()='Informe o seu nome completo']
${email_input_err}        //span[@class='alert-error' and text()='Informe o seu melhor email']
${cpf_input_err}          //span[@class='alert-error' and text()='Informe o seu CPF']
${cep_input_err}          //span[@class='alert-error' and text()='Informe o seu CEP']
${number_input_err}       //span[@class='alert-error' and text()='Informe um número maior que zero']
${document_err}           //span[@class='alert-error' and text()='Adcione um documento com foto (RG ou CHN)']
${invalid_email_err}      //span[@class='alert-error' and text()='Informe um email válido']
${invalid_cpf_err}        //span[@class='alert-error' and text()='CPF inválido']
${invalid_cep_err}        //span[@class='alert-error' and text()='Informe um CEP válido']
${invalid_number_err}     //span[@class='alert-error' and text()='Informe um número maior que zero']

*** Keywords ***
Acessar Site Walkdog para ser Dog Walker
    Set Selenium Timeout    15 seconds
    Open Browser    https://walkdog.vercel.app    Chrome
    Wait Until Element Is Enabled    ${join_community_link}
    Click Element    ${join_community_link}
    Wait Until Element Is Enabled    ${submit_btn}

Preencher Formulário com Dados Válidos
    Input Text    ${name_input}    Seu Nome
    Input Text    ${email_input}    seu_email@example.com
    Input Text    ${cpf_input}    12345678901
    Input Text    ${cep_input}    12345-678
    Click Element    ${buscar_cep_btn}
    Input Text    ${number_input}    123
    Input Text    ${details_input}    Complemento
    Click Element    ${cuidar_img}
    Click Element    ${adestrar_img}
    Choose File    ${file_upload_field}    ${file_path}
    Click Element    ${submit_btn}

Validar Pop Up de Sucesso
    Wait Until Element Is Visible    ${popup_icon}
    Wait Until Element Is Visible    ${popup_title}
    Wait Until Element Is Visible    ${popup_content}
    Wait Until Element Is Visible    ${popup_confirm_button}
    Capture Page Screenshot    ${TEST NAME}.png
    Click Element    ${popup_confirm_button}
    Wait Until Element Is Enabled    ${join_community_link}

Validar Alerta de Erro com Mensagem
    [Arguments]    ${expected_error_message}
    Wait Until Element Is Visible    ${expected_error_message}
#    Page Should Contain    ${expected_error_message}
    Capture Element Screenshot    ${expected_error_message}    ${TEST NAME}.png

*** Test Cases ***
Cadastro de Dog Walker com sucesso
    [Documentation]    Cadastro de Dog Walker com dados válidos
    [Tags]    DadosValidos
    Preencher Formulário com Dados Válidos
    Validar Pop Up de Sucesso

Cadastro de Dog Walker com CPF inválido
    [Documentation]    Cadastro de Dog Walker com CPF incorreto
    [Tags]    CPFInvalido
    Input Text    ${cpf_input}    12345
    Click Element    ${submit_btn}
    Validar Alerta de Erro com Mensagem    ${invalid_cpf_err}

Cadastro de Dog Walker com email inválido
    [Documentation]    Cadastro de Dog Walker com email incorreto
    [Tags]    EmailInvalido
    Input Text    ${email_input}    email_invalido.com
    Click Element    ${submit_btn}
    Validar Alerta de Erro com Mensagem    ${invalid_email_err}

Cadastro de Dog Walker com CEP inválido
    [Documentation]    Cadastro de Dog Walker com CEP incorreto
    [Tags]    CEPInvalido
    Input Text    ${cep_input}    12345
    Click Element    ${buscar_cep_btn}
    Validar Alerta de Erro com Mensagem    ${invalid_cep_err}

Cadastro de Dog Walker sem dados
    [Documentation]    Cadastro de Dog Walker com dados vazios
    [Tags]    SemDados
    Click Element    ${submit_btn}
    Wait Until Element Is Visible        ${name_input_err}
    Capture Element Screenshot        ${name_input_err}
    Wait Until Element Is Visible        ${email_input_err}
    Capture Element Screenshot        ${email_input_err}
    Wait Until Element Is Visible        ${cpf_input_err}
    Capture Element Screenshot        ${cpf_input_err}
    Wait Until Element Is Visible        ${cep_input_err}
    Capture Element Screenshot        ${cep_input_err}
    Wait Until Element Is Visible        ${number_input_err}
    Capture Element Screenshot        ${number_input_err}
    Wait Until Element Is Visible        ${document_err}
    Capture Element Screenshot        ${document_err}
