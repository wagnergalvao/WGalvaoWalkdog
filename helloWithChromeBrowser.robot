*** Settings ***
Library           SeleniumLibrary
Library           webdrivermanager

Suite Setup       Setup Webdriver

*** Test Cases ***
HelloWorldWithChromeBrowser
    Open Browser    https://www.example.com    chrome
    Title Should Be    Example Domain
    Page Should Contain    This domain is for use in illustrative examples in documents.
    Close Browser

*** Keywords ***
Setup Webdriver
    # Use o webdrivermanager para baixar e configurar o driver do Chrome
    Create Webdriver    Chrome