*** setting ***
# Library             ExcelLibrary
# Library             Collections
Library    SeleniumLibrary
Library    String
Resource    ../Keyword/CommonKeyword.robot
Resource    ../Keyword/LoginKeyword.robot
Resource    ../Resource/init.robot

# Suite Setup         Open Browser Desktop Mode    https://uat.areegator.com/Login
# Test setup          Open Browser Desktop Mode    https://uat.areegator.com/login
Suite Teardown      Close All Browsers
# Test Teardown       Close All Browsers

***Variables***

*** test case ***
TC_aree_010_01_01
    [Documentation]   
    [Tags]    UAT    IOS    Quotation    Premium
    Open Browser Desktop Mode    ${url_ios}
    Login IOS System    ${userlogin}    ${passlogin}
    Click Button Name    ${menu_quotation}
    CLick Element    //select[@id="input-car-propertiestab1"]
    # Click Button Name    //button[@class="btn btn-warning btn-xs"]
    # Wait Until Element Is Enabled    //div[@id="group-input-car-propertiestab1"]    30s

    # Click Element    //input[@id="opt-pickup-case"]