*** Settings ***
Library    String
Library    BuiltIn
Library    SeleniumLibrary
Resource    ../Resource/init.robot
Resource    ../Keyword/CommonKeyword.robot

*** Variables ***
${timeout}        30s

*** Keywords ***
Input Username On Login Page
    [Documentation]    Input username on Login Page
    [Arguments]    ${UserData}
    Click Element Name    ${txt_username}
    Input Value    ${txt_username}    ${UserData}

Input Password On Login Page
    [Documentation]    Input password on Login Page
    [Arguments]    ${PasswordData}
    Click Element Name    ${txt_password}
    Input Value    ${txt_password}    ${PasswordData}

Login IOS System
    [Documentation]    Go to login IOS system with in username/password
    [Arguments]    ${UserData}    ${PasswordData}
    Input Username On Login Page    ${UserData}
    Input Password On Login Page    ${PasswordData}
    Click Button Name    ${btn_signin}

Click Quotation Menu
    [Documentation]    Click quotation menu after that login complate
    # sleep    2s
    Click Button Name    ${menu_quotation}
    sleep    2s

