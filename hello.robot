*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
HelloWorldSeleniumTest
    Open Browser    https://www.example.com    chrome
    Title Should Be    Example Domain
    Page Should Contain    This domain is for use in illustrative examples in documents.
    Close Browser
