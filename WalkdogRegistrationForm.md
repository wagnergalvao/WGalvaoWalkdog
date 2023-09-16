Utilizando as variáveis abaixo, construa testes automatizados em português para robot framework, conforme orientações abaixo:

Funcionalidade: Cadastro de Dog Walkers
  Para que eu possa ter uma nova fonte de renda
  Como visitante do site Walk Dog
  Gostaria de fazer meu cadastro como Dog Walker

*** Home Variables ***
${join_community_link} //a[@href='/signup']

*** Registration Form Variables ***
${name_input}          //input[@name='name']
${email_input}         //input[@name='email']
${cpf_input}           //input[@name='cpf']
${cep_input}           //input[@name='cep']
${buscar_cep_btn}      //input[@type='button'][@value='Buscar CEP']
${street_input}        //input[@name='addressStreet']
${number_input}        //input[@name='addressNumber']
${details_input}       //input[@name='addressDetails']
${district_input}      //input[@name='addressDistrict']
${city_uf_input}       //input[@name='addressCityUf']
${cuidar_img}          //ul[@class='walker-service']//li[1]/img
${adestrar_img}        //ul[@class='walker-service']//li[2]/img
${submit_btn}          //button[@class='button-register']

*** Success PopUp Variables ***
${popup_confirm_button} //button[@class='swal2-confirm']
${popup_deny_button}    //button[@class='swal2-deny']
${popup_cancel_button}  //button[@class='swal2-cancel']
${popup_title}           Obrigado!
${popup_content}         Recebemos o seu cadastro e em breve retornaremos o contato.

*** Error Messages Variables ***
${name_input_err}      Informe o seu nome completo
${email_input_err}     Informe o seu melhor email
${cpf_input_err}       Informe o seu CPF
${cep_input_err}       Informe o seu CEP
${number_input_err}    Informe um número maior que zero
${document_err}      Adcione um documento com foto (RG ou CHN)

*** Invalid Messages Variables ***
${invalid_name_err}      Nome Inválido
${invalid_email_err}     email_invalido.com
${invalid_cpf_err}       Informe um CPF válido
${invalid_cep_err}       Informe um CEP válido
${invalid_number_err}    Informe um número maior que zero


Outros elementos:
visito o site Walkdog deve abrir o navegador e acessar a url padrão.
quero ser Dog Walker deve clicar no link signup
submeto o formulário deve preencher os campos habilitados e clicar nas imagens e no botão
o upload do documento deve usar o arquivo RG-FAKE-2.jpg na pasta raiz do projeto
vejo o Pop Up de sucesso deve validar todas mensagens do popup e clicar no botão

Cenários de Aceite:

Contexto:

  Dado que visito o site Walkdog
  E que quero ser Dog Walker

Cenário: Cadastro de Dog Walker com sucesso

  Quando submeto o formulário com dados válidos
  Então vejo o Pop Up de sucesso informando o recebimento do cadastro

Cenário: Cadastro de Dog Walker com CPF inválido

  Quando submeto o formulário com o CPF incorreto
  Então vejo o Alerta de Erro com a mensagem "CPF inválido"

Cenário: Cadastro de Dog Walker com email inválido

  Quando submeto o formulário com o email incorreto
  Então vejo o Alerta de Erro com a mensagem "Informe um email válido"

Cenário: Cadastro de Dog Walker com CEP inválido

  Quando busco o CEP incorreto
  Então vejo o Alerta de Erro com a mensagem "Informe um CEP válido"

Cenário: Cadastro de Dog Walker sem dados

  Quando submeto o formulário com dados vazios
  Então vejo os Alertas de Erros dos campos obrigatórios
