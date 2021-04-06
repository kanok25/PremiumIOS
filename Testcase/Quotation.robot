*** setting ***
Library    ExcelLibrary
Library    Collections
Library    String
Library    BuiltIn
Library    SeleniumLibrary
Resource    ../Keyword/CommonKeyword.robot
Resource    ../Keyword/LoginKeyword.robot
Resource    ../Keyword/QuotationKeyword.robot
Resource    ../Resource/init.robot
Suite Setup       Go To URL And Quotation Menu
# Suite Teardown      Close All Browsers
***Variables***

*** test case ***
Test_Premium_Insurance
    ${dicAllTestData}    Read all Excel By Columns Name    D:${/}Premium${/}PremiumData.xlsx    ${sheetdata}
    Log Dictionary    ${dicAllTestData}
    ${countRows}    Get Length    ${dicAllTestData["ประเภทรถ"]}
    ${countRows}    Get Length    ${dicAllTestData["ประเภทการจดทะเบียน"]}
    ${countRows}    Get Length    ${dicAllTestData["ประเภทการจดทะเบียน"]}
    ${countRows}    Get Length    ${dicAllTestData["ยี่ห้อ"]}
    ${countRows}    Get Length    ${dicAllTestData["รุ่น"]}
    ${countRows}    Get Length    ${dicAllTestData["ปีรุ่นรถ"]}
    ${countRows}    Get Length    ${dicAllTestData["รุ่นย่อย"]}
    ${countRows}    Get Length    ${dicAllTestData["อักษรทะเบียน"]}
    ${countRows}    Get Length    ${dicAllTestData["เลขทะเบียน"]}
    ${countRows}    Get Length    ${dicAllTestData["จังหวัด"]}
    ${countRows}    Get Length    ${dicAllTestData["ปีเกิดผู้เอาประกัน"]} 
    ${countRows}    Get Length    ${dicAllTestData["ประเภทการซ่อม"]}
    ${countRows}    Get Length    ${dicAllTestData["ประเภทประกัน"]}  
    ${countRows}    Get Length    ${dicAllTestData["ชื่อบริษัท"]}
    ${countRows}    Get Length    ${dicAllTestData["ชื่อลูกค้า"]}
    ${countRows}    Get Length    ${dicAllTestData["เบอร์โทร"]} 
    ${countRows}    Get Length    ${dicAllTestData["บัตรประชาชน"]}
    # log    ${ALLTESTDATA["ประเภทรถ"]}[${0}]
    # Open Excel Document	    filename=D:${/}Premium${/}PremiumData.xlsx     doc_id=doc1
    #เริ่มจาก 0
    # Input All Cars Details    ${dicAllTestData}    ${countRows}
    FOR    ${INDEX}    IN RANGE    0    ${countRows}    #${ROWLENGTH}
        # Set To Dictionary    ${ALLTESTDATA}    ${AllColumn[${INDEX}]}=${AllRow}
        # log    ${ALLTESTDATA["ประเภทรถ"]}[${index}]
        sleep    6s
        Click Button Name    ${menu_quotation}
        sleep    10s
        Create Quotation    ${dicAllTestData}    ${index}
        Verify Search Is Not Found    ${dicAllTestData}    ${index}
        # Verify Data For Quotation    ${index}
    END

Test_Normal_Product_Key
    ${dicAllTestData}    Read all Excel By Columns Name    D:${/}Premium${/}PremiumData.xlsx    ${sheetdata}
    Log Dictionary    ${dicAllTestData}
    ${countRows}    Get Length    ${dicAllTestData["ประเภทรถ"]}
    ${countRows}    Get Length    ${dicAllTestData["ประเภทการจดทะเบียน"]}
    ${countRows}    Get Length    ${dicAllTestData["ประเภทการจดทะเบียน"]}
    ${countRows}    Get Length    ${dicAllTestData["ยี่ห้อ"]}
    ${countRows}    Get Length    ${dicAllTestData["รุ่น"]}
    ${countRows}    Get Length    ${dicAllTestData["ปีรุ่นรถ"]}
    ${countRows}    Get Length    ${dicAllTestData["รุ่นย่อย"]}
    ${countRows}    Get Length    ${dicAllTestData["อักษรทะเบียน"]}
    ${countRows}    Get Length    ${dicAllTestData["เลขทะเบียน"]}
    ${countRows}    Get Length    ${dicAllTestData["จังหวัด"]}
    ${countRows}    Get Length    ${dicAllTestData["ปีเกิดผู้เอาประกัน"]} 
    ${countRows}    Get Length    ${dicAllTestData["ประเภทการซ่อม"]}
    ${countRows}    Get Length    ${dicAllTestData["ประเภทประกัน"]}  
    ${countRows}    Get Length    ${dicAllTestData["ชื่อบริษัท"]}
    ${countRows}    Get Length    ${dicAllTestData["ชื่อลูกค้า"]}
    ${countRows}    Get Length    ${dicAllTestData["เบอร์โทร"]} 
    ${countRows}    Get Length    ${dicAllTestData["บัตรประชาชน"]}
    FOR    ${INDEX}    IN RANGE    0    ${countRows}
        sleep    6s
        Click Button Name    ${menu_quotation}
        sleep    10s
        Create Quotation    ${dicAllTestData}    ${index}
        # Verify Search Is Not Found    ${dicAllTestData}    ${index}
    END

TC
    Go To    https://sas-front-uat.ntl.co.th:8101/master/index/205
    Select Frame    ${iframe}
    Click Verify Icon
    Click ON In Customer Infomation Modal
    Input Data Customer Information Type

    Input Customer Info In Selling

***Keywords***
Create Quotation
    [Arguments]    ${dicAllTestData}    ${index}
    Select Frame    ${iframe}
    Verify Quotation Page
    #เริ่มจาก 0
    # ${indexWriteExcel}    Evaluate    ${index}+1
    Select Radio Car Type    ${dicAllTestData["ประเภทรถ"]}[${index}]    #รถเก๋ง
    Select Data In Car Property    ${dicAllTestData["ประเภทการจดทะเบียน"]}[${index}]    #110 รถยนต์ส่วนบุคคล
    Select Data In Car Brand    ${dicAllTestData["ยี่ห้อ"]}[${index}]    #HONDA (ยี่ห้อ)
    Select Data In Car Model    ${dicAllTestData["รุ่น"]}[${index}]    #CITY (รุ่น)
    Select Data In Car Year     ${dicAllTestData["ปีรุ่นรถ"]}[${index}]   #2018  ปีรุ่นรถ
    Select Data In Car Sub Model    ${dicAllTestData["ปีรุ่นรถ"]}[${index}]    #${dicAllTestData["รุ่นย่อย"]}[${index}]    #MY17 Sedan 4dr S i-VTEC CVT FWD 1.5i (2018)
    Input Value In Car Prefix    ${dicAllTestData["อักษรทะเบียน"]}[${index}]    #1กก
    Input Value In Car License No    ${dicAllTestData["เลขทะเบียน"]}[${index}]    #4311
    Select Data In Province    ${dicAllTestData["จังหวัด"]}[${index}]    #กรุงเทพมหานคร
    Input Data In Year Of Birth    ${dicAllTestData["ปีเกิดผู้เอาประกัน"]}[${index}]    #2529
    Select Cliam Type    ${dicAllTestData["ประเภทการซ่อม"]}[${index}]    #ซ่อมอู่
    Click Search Button
    sleep    18s

# Normal quote
Click Verify Icon  
    [Documentation]    สำหรับ Verify Normal Quote - click รูปเครื่องหมาย ถูก
    [Arguments]
    # Scroll Element Into View    //tr//a[contains(text(),"QT210350398")]//..//..//img[@title="Verify"]
    sleep    10s
    Wait Until Page Contains Element    //tr//a[contains(text(),"QT210350476")]//..//..//img[@title="Verify"]    50s
    CLick Element    //tr//a[contains(text(),"QT210350476")]//..//..//img[@title="Verify"]

Click ON In Customer Infomation Modal
    [Documentation]    Model for เสียบบัตรประชาชน
    Wait Until Page Contains Element    //div[@id="modalSmartCard"]//h4[contains(text(),"Customer Information")]    20s
    Wait Until Element Is Visible    //button[@data-btn="on"]
    sleep    10s
    Click Button    //button[@data-btn="on"]

Input Data Customer Information Type
    [Documentation]    ระบุข้อมูล Customer Information
    ${RegisType}=    Create List    นิติบุคคล
    ${ResultType}    Run Keyword And Return Status    Should Contain Any    นิติบุคคล    @{RegisType}
    Run Keyword If    '${ResultType}' == 'True'    Customer Type Is Juristic
    Run Keyword If    '${ResultType}' == 'False'    Customer Type Is Individual


Customer Type Is Juristic
    [Documentation]    ระบุข้อมูล Customer Information Juristic Type
    # Click Element    //li[@id="liCompanyInfo"]
    # Click Element    //div[@id="companyInfo"]
    # Mouse Over    //div[@id="companyInfo"]//select[@class="form-control input-sm"]/option[text()='กท.สำรอง']
    Click Element    //div[@id="companyInfo"]//select[@class="form-control input-sm"]/option[text()='กท.สำรอง']
    Click Element    //input[@placeholder="วันจดทะเบียน"]
    Input Text    //input[@placeholder="วันจดทะเบียน"]    05/03/2560
    Press Keys    //input[@placeholder="วันจดทะเบียน"]    RETURN
    sleep    5s
    CLick Element    //input[@placeholder="วันออกหนังสือ"]
    Input Text    //input[@placeholder="วันออกหนังสือ"]    05/03/2562
    Press Keys    //input[@placeholder="วันออกหนังสือ"]    RETURN
    sleep    5s
    CLick Element    //button[@id="btModalSave"]
    Select Company For Create Quotation

Customer Type Is Individual
    [Documentation]    ระบุข้อมูล Customer Information Individual Type
    # Click Element    //li[@id="liCustomerInfo"]
    # Click Element    //div[@id="customerInfo"]
    Click Element    //div[@id="customerInfo"]//select[@data-field="titleKey"]/option[text()='นาย']
    Click Element    //input[@id="txtCustLastNameTH"]
    Input Text    //input[@id="txtCustLastNameTH"]    ส่วนบุคคล
    CLick Element    //div[@id="customerInfo"]//input[@placeholder="วันเดือนปีเกิด" and @data-field="birthDate"]
    Input Text    //div[@id="customerInfo"]//input[@placeholder="วันเดือนปีเกิด" and @data-field="birthDate"]    05/03/2530
    Press Keys    //div[@id="customerInfo"]//input[@placeholder="วันเดือนปีเกิด" and @data-field="birthDate"]    RETURN
    CLick Element    //button[@id="btModalSave"]
    Select Company For Create Quotation

Select Company For Create Quotation
    [Documentation]    เลือก บริษัท สำหรับ สร้างใบเสนอราคา นำไป Selling
    sleep    10s
    # Wait Until Page Contains    //div[@class="panel-heading"]//h4[contains(text(),"ข้อมูลใบเสนอราคา")]
    # Scroll Element Into View    //table[@id="SAF"]//button[@id="btnSelected"]
    Click Element     //table[@id="SAF"]//button[@id="btnSelected"]
    CLick Element    //button[@id="btnVerify"]

Input Customer Info In Selling
    [Documentation]    ระบุข้อมูลลูกค้า
    # sleep    10s
    # Wait Until Page Contains    //div[@id="CustomerView"]//h2[contains(text(),"ข้อมูลลูกค้า")]    50s
    Scroll Element Into View    //table[@id="Table3"]//td[1]/span[@class="k-widget k-dropdown k-header"]
    Click Element    //table[@id="Table3"]//td[1]/span[@class="k-widget k-dropdown k-header"]
    Mouse Over    //li[text()='กลุ่มธุรกิจโรงแรม']
    Click Element    //li[text()='กลุ่มธุรกิจโรงแรม']