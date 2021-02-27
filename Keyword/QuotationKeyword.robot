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

Replace String Text For Click
    [Documentation]    Replace string for element
    [Arguments]    ${path_element}    ${DataValue}
    ${element_name}    Replace String    ${path_element}    v_value    ${DataValue}
    Wait Until Element Is Visible    ${element_name}    20s
    Click Element    ${element_name}

Get Value In Quotation A
    [Documentation]    Get value in quotation ชีวิตบุคคลภายนอกต่อคน 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    ชีวิตบุคคลภายนอกต่อคน
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultA}    Get Text    ${element_title}
    Set Global Variable    ${ResultA}

Get Value In Quotation B
    [Documentation]    Get value in quotation ชีวิตบุคคลภายนอกต่อครั้ง 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    ชีวิตบุคคลภายนอกต่อครั้ง
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultB}    Get Text    ${element_title}
    Set Global Variable    ${ResultB}

Get Value In Quotation C
    [Documentation]    Get value in quotation ชีวิตบุคคลภายนอกต่อครั้ง 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    ทรัพย์สินบุคคลภายนอก
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultC}    Get Text    ${element_title}
    Set Global Variable    ${ResultC}

Get Value In Quotation D
    [Documentation]    Get value in quotation ค่าเสียหายส่วนแรก(ภายนอก) 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    ค่าเสียหายส่วนแรก(ภายนอก)
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultD}    Get Text    ${element_title}
    Set Global Variable    ${ResultD}

Get Value In Quotation E
    [Documentation]    Get value in quotation รถยนต์เสียหาย
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    รถยนต์เสียหาย
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultE}    Get Text    ${element_title}
    Set Global Variable    ${ResultE}

Get Value In Quotation F
    [Documentation]    Get value in quotation ค่าเสียหายส่วนแรก 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    ค่าเสียหายส่วนแรก
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultF}    Get Text    ${element_title}
    Set Global Variable    ${ResultF}

Get Value In Quotation G
    [Documentation]    Get value in quotation รถยนต์เสียหาย / ไฟไหม้ 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    รถยนต์เสียหาย / ไฟไหม้
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultG}    Get Text    ${element_title}
    Set Global Variable    ${ResultG}

Get Value In Quotation H
    [Documentation]    Get value in quotation อุบัติเหตุส่วนบุคคล 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    อุบัติเหตุส่วนบุคคล
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultH}    Get Text    ${element_title}
    Set Global Variable    ${ResultH}

Get Value In Quotation I
    [Documentation]    Get value in quotation ค่ารักษาพยาบาล 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    ค่ารักษาพยาบาล
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultI}    Get Text    ${element_title}
    Set Global Variable    ${ResultI}

Get Value In Quotation J
    [Documentation]    Get value in quotation ประกันตัวผู้ขับขี่ 
    [Arguments]    ${DataCompanyName}
    ${element_company}    Replace String    ${label_title}    v_value    ${DataCompanyName}
    Log    ${element_company}
    ${element_title}    Replace String    ${element_company}    v_title    ประกันตัวผู้ขับขี่
    Wait Until Element Is Visible    ${element_title}    20s
    ${ResultJ}    Get Text    ${element_title}
    Set Global Variable    ${ResultJ}

Get And Write All Data In Quotation
    [Documentation]    Step for get data in quotation
    [Arguments]    ${INDEX}    ${DataCompanyName}    #${dicAllTestData["ชื่อบริษัท"]}[${index}]
    sleep    1s
    Switch Window    MAIN
    sleep    4s
    Select Frame    ${iframe}
    sleep    1s
    Wait Until Element Is Visible    ${data_quotenumber}     10s
    ${ResultQuotation}    Get text    ${data_quotenumber}
    Set Global Variable    ${ResultQuotation}
    sleep    2s
    Replace String Text For Click    ${link_quotenumber}    ${ResultQuotation}
    sleep    10s
    Get Value In Quotation A     ${DataCompanyName}
    Get Value In Quotation B     ${DataCompanyName}        
    Get Value In Quotation C     ${DataCompanyName}
    Get Value In Quotation D     ${DataCompanyName}
    Get Value In Quotation E     ${DataCompanyName}
    Get Value In Quotation F     ${DataCompanyName}  
    Get Value In Quotation G     ${DataCompanyName}
    Get Value In Quotation H     ${DataCompanyName}
    Get Value In Quotation I     ${DataCompanyName}   
    Get Value In Quotation J     ${DataCompanyName} 
    Click Close Modal
    Unselect Frame
    Write Data In Excel    D:${/}Premium${/}PremiumData.xlsx    ${sheetdata}    ${INDEX}

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

Click Clear button
    [Documentation]    After search then clear data for search
    Wait Until Element Is Visible    //button[@id="btn-reEdittab1"]    15s
    Click Element    //button[@id="btn-reEdittab1"]

Select Insurance
    [Documentation]    After search data then system click tab Insurance type (ex. ประเภท1, ประเภท2)
    [Arguments]    ${DataInsuranceType}    ${DataCompanyName}    ${DataIDCard}    ${DataFirstName}    ${DataMobile}    ${index}
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
    Click Print Quotation
    # ${indexWriteExcel}    Evaluate    ${INDEX}+1
    # Input Information Insurance    ${DataIDCard}    ${DataFirstName}    ${DataMobile}    ${DataCompanyName}    ${index}

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
    [Arguments]    ${DataIDCard}    ${DataFirstName}    ${DataMobile}    ${DataCompanyName}    ${index}
    Wait Until Element Is Visible    //div[@id="modal-print"]//h4[@class="modal-title"]    10s
    Element Should Contain    //div[@id="modal-print"]//h4[@class="modal-title"]    ข้อมูลผู้เอาประกัน
    Wait Until Element Is Visible    //input[@id="modal-input-idcard"]    5s    
    Input Text    //input[@id="modal-input-idcard"]    ${DataIDCard}
    Input Text    //input[@id="modal-input-fname"]    ${DataFirstName}
    # Input Text    //input[@id="modal-input-lname"]    ${DataLastName}
    Input Text    //input[@id="modal-input-phone"]    ${DataMobile}
    sleep    1s
    Wait Until Element Is Visible    //button[@id="btn-print-normal"]    5s
    Click Element    //button[@id="btn-print-normal"]
    sleep    3s
    Handle Alert    ACCEPT    15s
    Verify Data For Quotation    ${index}
    # sleep 2
    # Switch Window    MAIN
    # sleep    3s
    # Select Frame    ${iframe}
    # sleep    1s
    # sleep    2s

Verify Thai ID And Mobile Number
    [Documentation]    Verify ID and Mobile number then system validate is duplicate
    [Arguments]    ${index}
    sleep    2s
    ${resultmessage}    Run Keyword And Return Status    Verify Error Message For ThaiID And Mobile Number
    Run Keyword If    '${resultmessage}' == 'True'    Write Message Error Is Data Duplicate    ${index}
    [Return]     ${resultmessage}

Verify Error Message For ThaiID And Mobile Number
    [Documentation]    Click element for message error
    sleep    0.5s
    Wait Until Element Is Enabled    //div[@class="modal-dialog"]//h4[contains(text(),'ข้อมูลผู้เอาประกัน')]    2s
    # //div[@class="modal-dialog"]//h4[contains(text(),'ข้อมูลผู้เอาประกัน')]    2s
    # //button[@id="btn-cancal-normal"]
    
Write Message Error Is Data Duplicate
    [Arguments]    ${indexWriteExcel}
    Click Cancel Create Quotation
    Unselect Frame
    Log    ${indexWriteExcel}
    # ${index}    Evaluate    ${indexWriteExcel}+1
    Write Message Error    ${indexWriteExcel}    ThaiID or Mobile Number is duplicate


Verify Alert Warning
    [Documentation]    After search premium then system display message error
    Wait Until Element Is Visible    //div[@id="div-search-result"]//div[@class="alert alert-warning"]    15s
    # Element Should Contain        //div[@class="alert alert-warning"]/h1[text()="Warning!!"]    Warning!!

Verify Search Insurance Datail
    [Documentation]    Verify Search Insurance Datail
    [Arguments]    ${index}
    # sleep    2s
    ${resultsearch}    Run Keyword And Return Status    Verify Alert Warning
    Run Keyword If    '${resultsearch}' == 'True'    Write Message Error Is Data Not Found    ${index}
    [Return]     ${resultsearch}

Write Message Error Is Data Not Found
    [Arguments]    ${indexWriteExcel}
    Unselect Frame
    Log    ${indexWriteExcel}
    # ${index}    Evaluate    ${indexWriteExcel}+1
    Write Message Error    ${indexWriteExcel}    ไม่พบข้อมูลตามเงื่อนไขที่ท่านระบุ

Write Message Error
    [Documentation]    Write Log Error
    [Arguments]    ${INDEX}    ${VALUE}
    # Click Cancel Create Quotation
    # Unselect Frame
    Open Excel Document     D:${/}Premium${/}PremiumData.xlsx    Data
    # ${indexWriteExcel}    Evaluate    ${index}+1
    Log    ${INDEX}
    Write Excel By Columns Name    ผลลัพธ์    ${INDEX}    ${VALUE}
    ExcelLibrary.Save Excel Document    filename=D:${/}Premium${/}PremiumData.xlsx
    [Teardown]    Close All Excel Documents
    [Return]     ${INDEX}

Click Cancel Create Quotation
    [Documentation]    Click "ยกเลิก" ใน Popup ข้อมูลผู้เอาประกัน
    sleep    2s
    Wait Until Element Is Visible    //button[@id="btn-cancal-normal"]    10s
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

Write Excel By Columns Name
    [Arguments]    ${COLUMNNAME}    ${ROWCOUNT}    ${VALUE}
    # Open Excel Document     D:${/}Premium${/}PremiumData.xlsx    Data
    ${AllColumn}    Read Excel Row    row_num=1    sheet_name=Data
    ${ColumnIndex}    Get Index From List    ${AllColumn}    ${COLUMNNAME}
    ${ColumnIndex}    Evaluate    ${ColumnIndex}+1    ##+1 เพราะว่า Column ใน excel เริ่มจาก 1 แต่ List เริ่มจาก 0
    # FOR    ${index}    IN RANGE    1    ${ROWCOUNT}+1    #1
    FOR    ${index}    IN    ${ROWCOUNT}    #1
        ${RowIndex}    Evaluate    ${index}+1    #+2 เพราะว่าตัด Columnแรกทิ้งป้องกันการเขียนทับ
        # Open Excel Document     D:${/}Premium${/}PremiumData.xlsx    Data
        ExcelLibrary.Write Excel Cell    row_num=${RowIndex}    col_num=${ColumnIndex}    value=${VALUE}    sheet_name=Data
        # ExcelLibrary.Save Excel Document    filename=D:${/}Premium${/}PremiumData.xlsx
        # Close All Excel Documents
    END
    # ExcelLibrary.Save Excel Document    filename=${EXCELPATH}
    # Close All Excel Documents

Write Data In Excel
    [Arguments]    ${EXCELPATH}    ${SHEETNAME}    ${INDEX}
    Open Excel Document     ${EXCELPATH}    ${SHEETNAME}    #D:${/}Premium${/}PremiumData.xlsx    ${sheetdata}
    ${indexWriteExcel}    Evaluate    ${INDEX}+1
    Write Excel By Columns Name    ทุนประกัน    ${indexWriteExcel}    ${ResultTotal}
    Write Excel By Columns Name    เบี้ยประกัน    ${indexWriteExcel}    ${ResultPremium}
    Write Excel By Columns Name    Quotation    ${indexWriteExcel}    ${ResultQuotation}
    Write Excel By Columns Name    ชีวิตบุคคลภายนอกต่อคน    ${indexWriteExcel}    ${ResultA}
    Write Excel By Columns Name    ชีวิตบุคคลภายนอกต่อครั้ง    ${indexWriteExcel}    ${ResultB}
    Write Excel By Columns Name    ทรัพย์สินบุคคลภายนอก    ${indexWriteExcel}    ${ResultC}
    Write Excel By Columns Name    ค่าเสียหายส่วนแรก(ภายนอก)    ${indexWriteExcel}    ${ResultD}        
    Write Excel By Columns Name    รถยนต์เสียหาย    ${indexWriteExcel}    ${ResultE}
    Write Excel By Columns Name    ค่าเสียหายส่วนแรก    ${indexWriteExcel}    ${ResultF}
    Write Excel By Columns Name    รถยนต์เสียหาย / ไฟไหม้    ${indexWriteExcel}    ${ResultG}
    Write Excel By Columns Name    อุบัติเหตุส่วนบุคคล    ${indexWriteExcel}    ${ResultH}
    Write Excel By Columns Name    ค่ารักษาพยาบาล    ${indexWriteExcel}    ${ResultI}
    Write Excel By Columns Name    ประกันตัวผู้ขับขี่    ${indexWriteExcel}    ${ResultJ}
    Write Excel By Columns Name    ผลลัพธ์    ${indexWriteExcel}    Pass
    ExcelLibrary.Save Excel Document    filename=${EXCELPATH}
    [Teardown]    Close All Excel Documents

Click Close Modal
    [Documentation]    CLick close button in modal quotetaion detail 
    Wait Until Element Is Visible    ${btn_quote_close_modal}    10s
    CLick Element    ${btn_quote_close_modal}