*** Settings ***
Library           SeleniumLibrary

Suite Setup       Setup Webdriver
Suite Teardown    Close Browser

*** Variables ***
${signup_xpath}    //a[@href='/signup']

*** Test Cases ***
Deve acessar a pagina home
    Title Should Be    Walkdog by Papito

Deve conter o logo walkdog
    Page Should Contain Image    //*[@id="page-home"]/div[1]/main/img

Deve conter o atributo alt no logo walkdog
    ${alt_text} =    Get Element Attribute    //*[@id="page-home"]/div[1]/main/img    alt
    Should Be Equal As Strings    ${alt_text}    Walkdog

Deve conter o titulo Cuidado e diversão em cada passo
    ${h1_content} =    Get Text    //h1
    Should Be Equal As Strings    ${h1_content}    Cuidado e diversão em cada passo

Deve conter o paragrafo Quer gerar uma renda extra passeando com pets? Faça parte da nossa comunidade de dog walkers.
    ${p_content} =    Get Text    //p
    Should Be Equal As Strings    ${p_content}    Quer gerar uma renda extra passeando com pets? Faça parte da nossa comunidade de dog walkers.

Deve conter o botao Quero ser Dog Walker
    Page Should Contain Element    ${signup_xpath}
    Element Text Should Be    ${signup_xpath}    Quero ser Dog Walker
    ${href_value} =    Get Element Attribute    ${signup_xpath}    href
    Should Be Equal As Strings    ${href_value}    https://walkdog.vercel.app/signup

*** Keywords ***
Setup Webdriver
    Create Webdriver    Chrome
    Open Browser    https://walkdog.vercel.app    chrome



