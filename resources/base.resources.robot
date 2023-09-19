*** Settings ***
Documentation    Recursos para automação do site Walkdog

Library    SeleniumLibrary

*** Variables ***
${join_community_link}      //a[@href='/signup']/strong[text()='Quero ser Dog Walker']
${submit_btn}               //button[@class='button-register']
${return_home_link}         //a[@href='/' and text()='Voltar para home']

*** Keywords ***

Acessar o site walkdog
    [Arguments]    ${url}    ${browser}

    Set Selenium Timeout    15 seconds
    Open Browser    ${url}    ${browser}
    Wait Until Element Is Enabled    ${join_community_link}

Quero ser dog walker

    Click Element    ${join_community_link}
    Wait Until Element Is Enabled    ${return_home_link}
    Wait Until Element Is Enabled    ${submit_btn}

Voltar para home

    Click Element    ${return_home_link}
    Wait Until Element Is Enabled    ${join_community_link}

Evidenciar elemento

    [Arguments]    ${element}
    Capture Element Screenshot    ${element}    ${TEST NAME}.png

Evidenciar pagina

    Capture Page Screenshot    ${TEST NAME}.png
