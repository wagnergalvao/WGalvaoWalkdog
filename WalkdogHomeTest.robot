*** Settings ***
Library           SeleniumLibrary

Suite Setup       Setup Webdriver

*** Test Cases ***
DeveAcessarAPaginaHome
    Open Browser    https://walkdog.vercel.app    chrome
    Title Should Be    Walkdog by Papito
    Close Browser

DeveConterTitulo
    Open Browser    https://walkdog.vercel.app    chrome
    Page Should Contain    Cuidado e diversão em cada passo
    Close Browser

*** Keywords ***
Setup Webdriver
    Create Webdriver    Chrome
