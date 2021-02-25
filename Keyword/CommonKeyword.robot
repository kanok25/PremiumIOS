*** Settings ***
# Library    RequestsLibrary
# Library    ExcelLibrary
# Library    Collections
Library    String
Library    BuiltIn
Library    SeleniumLibrary
Resource    ../Resource/init.robot

*** Variables ***
${timeout}        10s

*** Keywords ***
Open Browser Desktop Mode
    [Documentation]    Open browser chrome on Web (Chrome)
    [Arguments]    ${url}    ${browser}=chrome
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method    ${chrome options}  add_argument  --disable-infobars
    Call Method    ${chrome options}    add_argument    --disable-notifications
    Call Method    ${chrome options}    add_argument    --start-maximized
    ${options.prefs}=    Create Dictionary    credentials_enable_service    false
    Call Method    ${chrome options}    add_experimental_option    prefs     ${options.prefs}
    Create WebDriver    Chrome    chrome_options=${chrome options}
    Go To    ${url}

Click Button Name
    [Documentation]    For click button
    [Arguments]    ${btn_name}
    Wait Until Element Is Enabled    ${btn_name}    ${timeout}
    Click Element    ${btn_name}

Input Value
    [Documentation]    For input data/value in object
    [Arguments]    ${object_name}    ${object_value}
    Wait Until Element Is Visible    ${object_name}    ${timeout}
    Input Text    ${object_name}    ${object_value}

Click Element Name
    [Documentation]    For click element
    [Arguments]    ${element_name}
    Wait Until Element Is Visible   ${element_name}    ${timeout}
    Click Element    ${element_name}

# Replace String Text Is Visible
#     [Documentation]    For replace word to element
#     [Arguments]    ${ElementPath}
#     ${element_value}    Replace String    ${ElementPath}    v_variable    ${variable_text}
#     Wait Until Element Is Visible    ${element_value}    ${timeout}

Replace String Text Is Page Contains
    [Documentation]    For replace word to element
    [Arguments]    ${ElementPath}
    ${element_value}    Replace String    ${ElementPath}    v_variable    ${variable_text}
    Wait Until Page Contains Element    ${element_value}    ${timeout}

# Replace String Regexp With Space
#     [Documentation]    For replace string and delete space bar
#     [Arguments]    ${ElementPath}
#     ${element_value}    Replace String Using Regexp    ${ElementPath}    ${SPACE}    ${Empty}
#     # [Return]    ${element_value}
#     Wait Until Page Contains Element    ${element_value}    ${timeout}

Click Element For Dropdown List
    [Documentation]    Focus to element for dropdown list
    [Arguments]    ${element_for_dropdownlist}
    Wait Until Element Is Visible    ${element_for_dropdownlist}    ${timeout}
    Mouse Over    ${element_for_dropdownlist}
    Click Element    ${element_for_dropdownlist}

Select Value For Dropdown List
    [Documentation]    Focus to element for DropDown List
    [Arguments]    ${select_value_dropdownlist}
    Mouse Over    ${select_value_dropdownlist}
    Click Element    ${select_value_dropdownlist}