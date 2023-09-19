*** Settings ***
Documentation    Objetos para automação do do Formulário de Registro

Resource    ${EXECDIR}/resources/base.resources.robot

*** Variables ***
${name_input}             //input[@name='name']
${email_input}            //input[@name='email']
${cpf_input}              //input[@name='cpf']
${cep_input}              //input[@name='cep']
${street_input}           //input[@name='addressStreet']
${district_input}         //input[@name='addressDistrict']
${city_uf_input}          //input[@name='addressCityUf']
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
${popup_icon}             //div[contains(@class,'swal2-icon')]
${popup_title}            //h2[@id='swal2-title' and text()='Obrigado!']
${popup_content}          //div[@id='swal2-html-container' and text()='Recebemos o seu cadastro e em breve retornaremos o contato.']
${popup_confirm_button}   //button[contains(@class,'swal2-confirm') and text()='Voltar']
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

Iniciar sessao
    Acessar o site walkdog    https://walkdog.vercel.app    Chrome
    Quero ser dog walker

Finalizar sessao
    Evidenciar pagina
    Close Browser

Submeter formulário
		[Arguments]    ${name}    ${email}    ${cpf}    ${cep}    ${number}    ${details}    ${image}

    Input Text                    ${name_input}          ${name}
    Capture Element Screenshot    ${name_input}
    Input Text                    ${email_input}         ${email}
    Capture Element Screenshot    ${email_input}
    Input Text                    ${cpf_input}           ${cpf}
    Capture Element Screenshot    ${cpf_input}
    Input Text                    ${cep_input}           ${cep}
    Capture Element Screenshot    ${cep_input}
    Click Element                 ${buscar_cep_btn}
    Capture Element Screenshot    ${street_input}
    Capture Element Screenshot    ${district_input}
    Capture Element Screenshot    ${city_uf_input}
    Input Text                    ${number_input}        ${number}
    Capture Element Screenshot    ${number_input}
    Input Text                    ${details_input}       ${details}
    Capture Element Screenshot    ${details_input}
    Click Element                 ${cuidar_img}
    Click Element                 ${adestrar_img}
    Choose File                   ${file_upload_field}    ${EXECDIR}/resources/${image}
    Click Element                 ${submit_btn}

Validar popup de sucesso

    Wait Until Element Is Visible    ${popup_icon}
    Wait Until Element Is Visible    ${popup_title}
    Wait Until Element Is Visible    ${popup_content}
    Wait Until Element Is Visible    ${popup_confirm_button}

Verificar campos obrigatorios

    Click Element                     ${submit_btn}

    Wait Until Element Is Enabled     ${name_input_err}
    Capture Element Screenshot        ${name_input_err}

    Wait Until Element Is Enabled     ${email_input_err}
    Capture Element Screenshot        ${email_input_err}

    Wait Until Element Is Enabled     ${cpf_input_err}
    Capture Element Screenshot        ${cpf_input_err}

    Wait Until Element Is Enabled     ${cep_input_err}
    Capture Element Screenshot        ${cep_input_err}

    Wait Until Element Is Enabled     ${number_input_err}
    Capture Element Screenshot        ${number_input_err}

    Wait Until Element Is Enabled     ${document_err}
    Capture Element Screenshot        ${document_err}

Verificar dados invalidos

    Wait Until Element Is Enabled     ${invalid_cpf_err}
    Capture Element Screenshot        ${invalid_cpf_err}

    Wait Until Element Is Enabled     ${invalid_email_err}
    Capture Element Screenshot        ${invalid_email_err}

    Click Element                 ${buscar_cep_btn}
    Wait Until Element Is Enabled     ${invalid_cep_err}
    Capture Element Screenshot        ${invalid_cep_err}

    Wait Until Element Is Enabled     ${invalid_number_err}
    Capture Element Screenshot        ${invalid_number_err}
