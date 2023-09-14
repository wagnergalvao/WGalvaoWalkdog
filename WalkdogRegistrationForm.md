Funcionalidade: Cadastro de Dog Walkers
    Para que eu possa ter uma nova fonte de renda
    Como visitante do site Wlak Dog
    Gostaria de fazer meu cadastro como Dog Walker

Modelagem de Dados:
| Nome                                     | Xpath                               | Estado       | Vazio                                     |
| ---------------------------------------- | ----------------------------------- | ------------ | ----------------------------------------- |
| Nome completo                            | //input[@name='name']               | Habilitado   | Informe o seu nome completo               |
| E-mail                                   | //input[@name='email']              | Habilitado   | Informe o seu melhor email                |
| CPF (somente números)                    | //input[@name='cpf']                | Habilitado   | Informe o seu CPF                         |
| CEP                                      | //input[@name='cep']                | Habilitado   | Informe o seu CEP                         |
| Rua                                      | //input[@name='addressStreet']      | Desabilitado |                                           |
| Número                                   | //input[@name='addressNumber']      | Habilitado   | Informe um número maior que zero          |
| Complemento                              | //input[@name='addressDetails']     | Habilitado   |                                           |
| Bairro                                   | //input[@name='addressDistrict']    | Desabilitado |                                           |
| Cidade/UF                                | //input[@name='addressCityUf']      | Desabilitado |                                           |
| Upload do seu documento de identificação | //input[@type='file']               | Habilitado   | Adcione um documento com foto (RG ou CHN) |
| Cadastrar                                | //button[@class='button-register']  | Habilitado   |                                           |
| Cuidar                                   | //ul[@class='walker-service']/li[1] | Habilitado   |                                           |
| Adestrar                                 | //ul[@class='walker-service']/li[2] | Habilitado   |                                           |

Cenários de Aceite:

Contexto:

    Dado que visito o site Walkdog
    E que desejo me tornar um Dog Walker

Cenário: Cadastro de Dog Walker com sucesso

    Quando submeto o formuário com dados válidos
    Então vejo o Pop Up de sucesso informando o recebimento do cadastro

Cenário: Cadastro de Dog Walker com CPF inválido

    Quando submeto o formuário com o CPF incorreto
    Então vejo o Alerta de Erro com a mensagem "CPF inválido"

Cenário: Cadastro de Dog Walker com email inválido

    Quando submeto o formuário com o email incorreto
    Então vejo o Alerta de Erro com a mensagem "Informe um email válido"

Cenário: Cadastro de Dog Walker sem dados

    Quando submeto o formuário com dados vazios
    Então vejo os Alertas de Erros dos campos obrigatórios
