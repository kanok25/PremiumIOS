*** Settings ***
Library    ExcelLibrary
Library    Collections
Library    String
Library    BuiltIn
Library    SeleniumLibrary
Resource    ../Resource/init.robot

*** Variables ***
${timeout}        10s

*** Keywords ***
Verify Quotation Page
    [Documentation]    Verify quotation page
    [Arguments]
    Wait Until Element Is Visible    //*[contains(text(),'ข้อมูลรถลูกค้า')]    60s

Replace String Text Is Visible
    [Documentation]    Replace string text to element
    [Arguments]    ${ElementPath}    ${variable_text}
    ${element_value}    Replace String    ${ElementPath}    v_value   ${variable_text}
    Wait Until Element Is Visible    ${element_value}    ${timeout}

Select Radio Car Type
    [Documentation]    Select car type (รถเก๋ง, รถกระบะ, รถตู้ส่วนบุคคล)
    [Arguments]    ${DataCarType}
    Log     ${DataCarType}
    ${DataCarType}    Convert To String    ${DataCarType}
    Wait Until Element Is Visible      //div[@id="div_Quote_S"]    ${timeout}
    ${CarType}=    Create List    รถกระบะ    รถตู้ส่วนบุคคล
    ${ResultCar}    Run Keyword And Return Status    Should Contain Any    ${DataCarType}    @{CarType}
    Run Keyword If    '${ResultCar}' == 'True' and '${DataCarType}' == 'รถกระบะ'    Click element    //div[@id="div_Quote_P"]//input
    Run Keyword If    '${ResultCar}' == 'True' and '${DataCarType}' == 'รถตู้ส่วนบุคคล'    Click element    //div[@id="div_Quote_V"]//input
    # Run Keyword If    '${DataCarType}' == 'รถเก๋ง'     Click element    //div[@id="div_Quote_S"]//input

Select Data In Car Property
    [Documentation]    Select data car property in dropdown list
    [Arguments]    ${DataCarType}
    # ${GroupPremium}    Create List    110 รถยนต์ส่วนบุคคล    120 รถยนต์ใช้เพื่อการพาณิชย์    320 เพื่อการพาณิชย์    210 รถยนต์ส่วนบุคคล 
    # ${status}    Run Keyword And Return Status    Should Contain Any    ${DataCarType}    @{GroupPremium}
    # Run Keyword if    '${status}' == 'True'    Replace String Text And Select Value In Dropdown List    ${ddl_car_register}    ${DataInDropdown}    ${DataCarType}
    Run Keyword if    '${DataCarType}' == '110 รถยนต์ส่วนบุคคล'    Replace String Text And Select Value In Dropdown List    ${ddl_car_register}    ${DataInDropdown}    ${DataCarType}
    Run Keyword if    '${DataCarType}' == '120 รถยนต์ใช้เพื่อการพาณิชย์'    Replace String Text And Select Value In Dropdown List    ${ddl_car_register}    ${DataInDropdown}    ${DataCarType}
    Run Keyword if    '${DataCarType}' == '320 เพื่อการพาณิชย์'    Replace String Text And Select Value In Dropdown List    ${ddl_car_register}    ${DataInDropdown}    ${DataCarType}
    Run Keyword if    '${DataCarType}' == '210 รถยนต์ส่วนบุคคล'    Replace String Text And Select Value In Dropdown List    ${ddl_car_register}    ${DataInDropdown}    ${DataCarType}
    
Replace String Text And Select Value In Dropdown List
    [Documentation]    Replace string text and select data in dropdown list
    [Arguments]    ${ddl_element}    ${ElementPath}    ${DataValue}
    ${element_value}    Replace String    ${ElementPath}    v_value    ${DataValue}
    sleep    2s
    Wait Until Element Is Visible    ${ddl_element}    40s
    sleep    6s
    Click Element    ${ddl_element}
    Click Element    ${element_value}
    # sleep    2s
    Click Element    ${ddl_element}
    # Select All From List    ${ddl_element}    ${element_value}

Replace String Text
    [Documentation]    Replace string for element
    [Arguments]    ${path_element}    ${DataValue}
    ${element_name}    Replace String    ${path_element}    v_value    ${DataValue}
    Wait Until Element Is Visible    ${element_name}    20s
    Click Element    ${element_name}

Get Value In Quotation
    [Documentation]    Get value in quotation
    [Arguments]    ${DataCompanyName}    ${DataColumnName}    ${text_results}    
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_name}
    ${element_title}    Replace String    ${element_name}    v_title    ${DataColumnName}
    Wait Until Element Is Visible    ${element_title}    20s
    ${text_results}    Get Text    ${element_title}
    # //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="ชีวิตบุคคลภายนอกต่อคน"]

Select Data In Car Brand
    [Documentation]    Select data car barnd in Dropdown list 
    [Arguments]    ${DataCarBrand}
    sleep    4s
    CLick Element    //input[@id="txt-input-car-brandtab1"]//..//span[@data-btncombobox="1"]
    Input Text    //input[@id="txt-input-car-brandtab1"]    ${DataCarBrand}
    Click Element    //li[@class="ui-menu-item"]/div[1]

Select Data In Car Model
    [Documentation]    Select data car model in Dropdown list 
    [Arguments]    ${DataCarModel}
    Click Element    //input[@id="txt-input-car-modeltab1"]//..//span[@data-btncombobox="1"]
    Input Text    //input[@id="txt-input-car-modeltab1"]    ${DataCarModel}
    Click Element    //ul[2]//li[@class="ui-menu-item"]/div[1]

Select Data In Car Year
    [Documentation]    Select data car year in dropdown list (ex. 2010)
    [Arguments]    ${DataCarYear}
    ${DataCarYear}    Convert To String    ${DataCarYear}
    Replace String Text And Select Value In Dropdown List    ${ddl_car_register_year}    ${DataInDropdown}    ${DataCarYear}

Select Data In Car Sub Model
    [Documentation]    Select data car model in Dropdown list 
    [Arguments]    ${DataCarSubModel}
    Click Element    //input[@id="txt-input-car-model-subtab1"]//..//span[@data-btncombobox="1"]
    Input Text    //input[@id="txt-input-car-model-subtab1"]    ${DataCarSubModel}
    Click Element    //ul[3]//li[@class="ui-menu-item"]/div[1]

Input Value In Car Prefix
    [Documentation]    Input data car prefix in text box (ex. 1กก)
    [Arguments]    ${DataCarPrefix}
    ${DataCarPrefix}    Convert To String    ${DataCarPrefix}
    Scroll Element Into View    //input[@id="input-regis-no-pretab1"]
    Wait Until Element Is Visible    //input[@id="input-regis-no-pretab1"]    10s
    Input Text    //input[@id="input-regis-no-pretab1"]    ${DataCarPrefix}
    
Input Value In Car License No
    [Documentation]    Input data car license No in text box (ex. 1234)
    [Arguments]    ${DataCarLicense}
    Wait Until Element Is Visible    //input[@id="input-regis-no-posttab1"]    10s
    Input Text    //input[@id="input-regis-no-posttab1"]    ${DataCarLicense}

Select Data In Province
    [Documentation]    Select data car province in dropdown list (ex. กระบี่)
    [Arguments]    ${DataProvince}
    Replace String Text And Select Value In Dropdown List    //select[@id="input-provincetab1"]    ${DataInDropdown}    ${DataProvince}
    
Input Data In Year Of Birth
    [Documentation]    Input data year of birth (ระบุคนที่อายุต่ำที่สุด ex. 2000)
    [Arguments]    ${DataYearOfBirth}
    Wait Until Element Is Visible    //input[@id="input-yearofbirthtab1"]    10s
    Scroll Element Into View    //input[@id="input-yearofbirthtab1"] 
    Run Keyword If    '${DataYearOfBirth}' != 'None'     Input Text    //input[@id="input-yearofbirthtab1"]    ${DataYearOfBirth}

Select Data In Driver Age
    [Documentation]    Select data Driver Age in dropdown list (ex. อายุ 18-24ปี)
    [Arguments]    ${DataDriveAge}
    Replace String Text And Select Value In Dropdown List    //select[@id="input-provincetab1"]    ${DataInDropdown}    ${DataDriveAge}

Select Cliam Type
    [Documentation]    Select radio Cliam type (ex. ซ่อมห้าง, ซ่อม่)
    [Arguments]      ${DataCliamType}
    ${CliamA}    Create List    ห้าง
    ${CliamB}    Create List    อู่    #ไม่ใช้
    ${ResultDataCliam}    Run Keyword And Return Status    Should Be Equal    ${DataCliamType}    ${CliamA}
    # ${DataCliamB}    Run Keyword And Return Status    Should Be Equal    ${DataCliamType}    ${CliamB}
    Run Keyword If    '${ResultDataCliam}' == 'True'    Select redio In Cliam Type A
    # Run Keyword If    '${DataCliamA}' == 'True'    Select redio In Cliam Type A
    # Run Keyword If    '${CarType}' == 'True'and'${DataCliamType}' == 'True'    Select redio In Cliam Type A
    # Run Keyword If    '${CarType}' == 'False'     Select Insurance Type Normal    ${AllDataInsurance}   ${DataInsuranceType}

Select redio In Cliam Type A
    [Documentation]    Select radio box for select Cliam type 
    Wait Until Element Is Visible    //input[@id="input-cliam-type-Atab1"]    15s
    Scroll Element Into View    //input[@id="input-cliam-type-Atab1"]
    Click Element    //input[@id="input-cliam-type-Atab1"]

Select redio In Cliam Type B
    [Documentation]    Select radio box for select Cliam type (ยังไม่ใช้เพราะเป็นค่า Default)
    Wait Until Element Is Visible    //input[@id="input-cliam-type-Btab1"]    15s
    Scroll Element Into View    //input[@id="input-cliam-type-Btab1"]
    Click Element    //input[@id="input-cliam-type-Btab1"]

Click Search Button
    [Documentation]    Click search button on Quotation page
    Wait Until Element Is Enabled    //button[@id="btn-searchtab1"]    15s
    Click Element    //button[@id="btn-searchtab1"]

Verify Alert Warning
    [Documentation]    After search premium then system display message error
    Wait Until Element Is Visible    //div[@id="div-search-result"]//div[@class="alert alert-warning"]    15s
    Element Should Contain        //div[@class="alert alert-warning"]/h1[text()="Warning!!"]    Warning!!

Click Clear button
    [Documentation]    After search then clear data for search
    Wait Until Element Is Visible    //button[@id="btn-reEdittab1"]    15s
    Click Element    //button[@id="btn-reEdittab1"]

Select Insurance Type
    [Documentation]    After search data then system click tab Insurance type (ex. ประเภท1, ประเภท2)
    [Arguments]    ${DataInsuranceType}    ${DataCompanyName}
    # sleep    10s
    ${InsuranceType}    Run Keyword And Return Status    Should Be Equal    ${DataInsuranceType}    1
    Run Keyword If    '${InsuranceType}' == 'True'    Click Element    ${tab_insurance_type_1}
    ${InsuranceType}    Run Keyword And Return Status    Should Be Equal    ${DataInsuranceType}    2
    Run Keyword If    '${InsuranceType}' == 'True'    Click Element    ${tab_insurance_type_2}
    ${InsuranceType}    Run Keyword And Return Status    Should Be Equal    ${DataInsuranceType}    2+
    Run Keyword If    '${InsuranceType}' == 'True'    Click Element    ${tab_insurance_type_2+}
    ${InsuranceType}    Run Keyword And Return Status    Should Be Equal    ${DataInsuranceType}    3
    Run Keyword If    '${InsuranceType}' == 'True'    Click Element    ${tab_insurance_type_3}
    ${InsuranceType}    Run Keyword And Return Status    Should Be Equal    ${DataInsuranceType}    3+
    Run Keyword If    '${InsuranceType}' == 'True'    Click Element    ${tab_insurance_type_3+}
    ${DataInsuranceType}    Set Variable If    '${DataInsuranceType}' == '1'    1    ${DataInsuranceType}
    ${DataInsuranceType}    Set Variable If    '${DataInsuranceType}' == '2+'    22    ${DataInsuranceType}
    ${DataInsuranceType}    Set Variable If    '${DataInsuranceType}' == '2'    2    ${DataInsuranceType}
    ${DataInsuranceType}    Set Variable If    '${DataInsuranceType}' == '3+'    33    ${DataInsuranceType}
    ${DataInsuranceType}    Set Variable If    '${DataInsuranceType}' == '3'    3    ${DataInsuranceType}
    ${element_value}    Replace String        //span/input[@value="v_company" and @data-id="v_value"]//..//img    v_value    ${DataInsuranceType}
    Log    ${element_value}
    ${radio_xpath}    Replace String    ${element_value}    v_company    ${DataCompanyName}   
    Log    ${radio_xpath}
    sleep    5s
    Wait Until Element Is Visible    ${radio_xpath}    10s
    Click Element    ${radio_xpath}
    ${DataTotal}    Replace String        //span/input[@value="v_company" and @data-id="v_value"]//../../..//div[contains(text(),'ทุนประกัน')]//..//strong    v_value    ${DataInsuranceType}
    Log    ${DataTotal}
    ${ElementTotal}    Replace String    ${DataTotal}    v_company    ${DataCompanyName}   
    ${ResultTotal}    Get Text    ${ElementTotal}
    ${DataPremium}    Replace String        //span/input[@value="v_company" and @data-id="v_value"]//../../..//div[contains(text(),'เบี้ยประกัน')]//..//strong    v_value    ${DataInsuranceType}
    Log    ${DataPremium}
    ${ElementPremium}    Replace String    ${DataPremium}    v_company    ${DataCompanyName}   
    ${ResultPremium}    Get Text    ${ElementPremium}
    Set Global Variable    ${ResultTotal}    
    Set Global Variable    ${ResultPremium}
    # [Return]    ${ResultTotal}    ${ResultPremium}

# //div[contains(text(),'ทุนประกัน')]//..//strong

Verify Value In Insurance Company
    [Documentation]    Mapping Insurance company name
    [Arguments]        ${DataInsurerName}
    log    ${DataInsurerName}
    Select Company    ${DataInsuranceType}    ${DataCompanyName}

Click Print Quotation
    [Documentation]    Print QT Number
    Wait Until Element Is Visible    //button[@id="btn-print"]    10s
    Scroll Element Into View    //button[@id="btn-print"]
    CLick button    //button[@id="btn-print"]

Input Information Insurance
    [Documentation]    Input data Information
    [Arguments]    ${DataIDCard}    ${DataFirstName}    ${DataMobile}
    Wait Until Element Is Visible    //div[@id="modal-print"]//h4[@class="modal-title"]    10s
    Element Should Contain    //div[@id="modal-print"]//h4[@class="modal-title"]    ข้อมูลผู้เอาประกัน
    Wait Until Element Is Visible    //input[@id="modal-input-idcard"]    5s    
    Input Text    //input[@id="modal-input-idcard"]    ${DataIDCard}
    Input Text    //input[@id="modal-input-fname"]    ${DataFirstName}
    # Input Text    //input[@id="modal-input-lname"]    ${DataLastName}
    Input Text    //input[@id="modal-input-phone"]    ${DataMobile}
    Wait Until Element Is Visible    //button[@id="btn-print-normal"]    5s
    Click Element    //button[@id="btn-print-normal"]
    sleep    3s
    Handle Alert    ACCEPT    10s

Verify Thai ID And Mobile Number
    [Documentation]    Verify ID and Mobile number then system validate is duplicate
    [Arguments]    ${ROWCOUNT}
    ${resultmessage}    Run Keyword And Return Status    Verify Error Message For ThaiID And Mobile Number
    Run Keyword If    '${resultmessage}' == 'True'    Write Message Error    ${ROWCOUNT}    ThaiID or Mobile Number is duplicate
    [Return]     ${resultmessage}

Verify Message
    [Arguments]
    Handle Alert    ACCEPT    10s

Verify Error Message For ThaiID And Mobile Number
    [Documentation]    Click element for message error
    Wait Until Element Is Visible    //div[@class="modal-dialog"]//h4[contains(text(),'ข้อมูลผู้เอาประกัน')]    2s

Write Message Error
    [Documentation]    Write Log Error
    [Arguments]    ${ROWCOUNT}    ${VALUE}
    Open Excel Document     D:${/}Premium${/}PremiumData.xlsx    Data
    Write Excel By Columns Name    ผลลัพธ์    ${ROWCOUNT}    ${VALUE}
    ExcelLibrary.Save Excel Document    filename=D:${/}Premium${/}PremiumData.xlsx
    Close All Excel Documents
    Click Cancel Create Quotation

# Search And Select Agent Profile
#     [Arguments]    ${DataAgentCode}      ${AllDataInsurance[42]}     
#     [Documentation]    For Search username,surename,agentID on special quote page
#     Input Data    ${txt_search_agent}    ${DataAgentCode}      
#     Click Element On Page    ${btn_search_agent}
#     ${agentid_locator}    Replace String    ${select_agentid}    v_agent_id    ${DataAgentCode}
#     Wait Until Element Is Visible    ${agentid_locator}      15s
#     Click Element On Page   ${agentid_locator}

#     ${Openfile}   Replace String    ${CURDIR}   ${/}Keyword  ${/}Resource${/}uat${/}TestData${/}PrepareDate  
#     ExcelLibrary.Open Excel Document     filename=${Openfile}${/}data_areegator_202102.xlsx      doc_id=New Requirement

#     ${SearchAgentStatus}    Run Keyword And Return Status    Verify Error Message For Search

#     Run Keyword If    '${SearchAgentStatus}' == 'True'   Write Excel Cell	row_num=${AllDataInsurance[42]}     col_num=41     value=Agent License Expired     sheet_name=New Requirement       
#     Save Excel Document  	   filename=${Openfile}${/}data_areegator_202102.xlsx
#     Close Current Excel Document

#     [Return]    ${SearchAgentStatus}
 
#  --------


#     log     ${DataCarType}
#     ${status}    Run Keyword And Return Status    Should Contain Any    ${DataCarType}    @{names}
#     Run Keyword If    '${status}' == 'True'    Select Value on Car Year Thai    ${DataCarYear}  
#     Run Keyword If    '${status}' == 'False'    Select Value on Car Year Eng    ${DataCarYear}  
    # ${message} =	    SeleniumLibrary.Handle Alert    ACCEPT    10s

    # โทรศัพท์หมายเลข : 0873844085 มีมากกว่า 1 ในระบบ   กรุณาสร้างการขายผ่านหน้า Lead

Click Cancel Create Quotation
    [Documentation]    Click "ยกเลิก" ใน Popup ข้อมูลผู้เอาประกัน
    Wait Until Element Is Visible    //button[@id="btn-cancal-normal"]    5s
    Click Element    //button[@id="btn-cancal-normal"]

Go To Tracking Page
    [Documentation]    Go to "รายการติดตาม" for verify quotation Details
    # Log Dictionary    ${dicAllTestData}
    # Set Global Variable     ${dicAllTestData}
    Open Browser Desktop Mode    ${url_ios}
    Login IOS System    ${userlogin}    ${passlogin}
    Click Button Name    //li[@id="107"]
    sleep    5s
    Click Button    //button[@id="m_203"]
    # Mouse Over    //a[@id="m_205"]
    Click Element    //a[@id="m_205"]
    sleep    5s

Quotation Details
    [Documentation]    Get data to quotation Detail
    [Arguments]    ${DataCompany}
    Get Quotation Details    ${DataCompany}
    # Get Quotation Detail
        
Get Quotation Details
    [Documentation]    Verify Create Quotation
    [Arguments]    ${DataCompany}
    ${ResultQuotation}    Get text    //tr[@id="1"]//td/a[@data-toggle="modal"]
    Log    ${ResultQuotation}
    [Return]    ${ResultQuotation}
    Click Link    //a[contains(text(),"${ResultQuotation}")]
    Sleep    10s
    # Get value in Quotation
    ${ResultA}    Get text    //table[@id="${DataCompany}"]//td[@title="ชีวิตบุคคลภายนอกต่อคน"]
    Log    ${ResultA}
    ${ResultB}    Get text    //table[@id="${DataCompany}"]//td[@title="ชีวิตบุคคลภายนอกต่อครั้ง"]
    Log    ${ResultB}   
    ${ResultC}    Get text    //table[@id="${DataCompany}"]//td[@title="ทรัพย์สินบุคคลภายนอก"]
    Log    ${ResultC}
    ${ResultD}    Get text    //table[@id="${DataCompany}"]//td[@title="ค่าเสียหายส่วนแรก(ภายนอก)"]
    Log    ${ResultD}
    ${ResultE}    Get text    //table[@id="${DataCompany}"]//td[@title="รถยนต์เสียหาย"]
    Log    ${ResultE}
    ${ResultF}    Get text    //table[@id="${DataCompany}"]//td[@title="ค่าเสียหายส่วนแรก"]
    Log    ${ResultF}
    ${ResultG}    Get text    //table[@id="${DataCompany}"]//td[@title="รถยนต์เสียหาย / ไฟไหม้"]
    Log    ${ResultG}
    ${ResultH}    Get text    //table[@id="${DataCompany}"]//td[@title="อุบัติเหตุส่วนบุคคล"]
    Log    ${ResultH}
    ${ResultI}    Get text    //table[@id="${DataCompany}"]//td[@title="ค่ารักษาพยาบาล"]
    Log    ${ResultI}
    ${ResultJ}    Get text    //table[@id="${DataCompany}"]//td[@title="ประกันตัวผู้ขับขี่"]
    Log    ${ResultJ}
    Wait Until Element Is Visible    //button[@id="closemodal"]    10s
    CLick Element    //button[@id="closemodal"]
    # Log    ${ResultG}

Write Excel By Columns Name
    [Arguments]    ${COLUMNNAME}    ${ROWCOUNT}    ${VALUE}
    # Open Excel Document     D:${/}Premium${/}PremiumData.xlsx    Data
    ${AllColumn}    Read Excel Row    row_num=1    sheet_name=Data
    ${ColumnIndex}    Get Index From List    ${AllColumn}    ${COLUMNNAME}
    ${ColumnIndex}    Evaluate    ${ColumnIndex}+1    ##+1 เพราะว่า Column ใน excel เริ่มจาก 1 แต่ List เริ่มจาก 0
    FOR    ${index}    IN RANGE    1    ${ROWCOUNT}+1
        ${RowIndex}    Evaluate    ${index}+1    #+2 เพราะว่าตัด Columnแรกทิ้งป้องกันการเขียนทับ
        # Open Excel Document     D:${/}Premium${/}PremiumData.xlsx    Data
        ExcelLibrary.Write Excel Cell    row_num=${RowIndex}    col_num=${ColumnIndex}    value=${VALUE}    sheet_name=Data
        # ExcelLibrary.Save Excel Document    filename=D:${/}Premium${/}PremiumData.xlsx
        # Close All Excel Documents
    END
    # ExcelLibrary.Save Excel Document    filename=${EXCELPATH}
    # Close All Excel Documents

Click Close Modal
    [Documentation]    
    Wait Until Element Is Visible    ${btn_quote_close_modal}    10s
    CLick Element    ${btn_quote_close_modal}