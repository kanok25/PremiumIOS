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
# # Go To Tracking Page
# # Go To URL And Quotation Menu
# Test setup          Select Frame    ${iframe}
# Test Teardown       Unselect Frame
# Suite Teardown      Close All Browsers
***Variables***


*** test case ***
Test_Excel_All_Rows
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
    # Open Excel Document	    filename=D:${/}Premium${/}PremiumData.xlsx     doc_id=doc1
    Input All Cars Details    ${dicAllTestData}    ${countRows}
    # ExcelLibrary.Save Excel Document    D:${/}Premium${/}PremiumData.xlsx
    # Close All Excel Documents
   
***Keywords***
    #${AllTestData}    ReadAllTestData   Y:${/}Areegator New Project${/}QA${/}PrepareDate${/}Renew.xlsx    New Requirement
    # Open Excel Document    filename=D:${\}Premium${\}PremiumData.xlsx    Data
Read all Excel By Columns Name
    [Arguments]    ${EXCELPATH}    ${SHEETNAME}
    ${dicAllTestData}    Create Dictionary
    Open Excel Document    filename=${EXCELPATH}    doc_id=doc1
    ${AllColumn}    Read Excel Row    row_num=1    sheet_name=${SHEETNAME}
    Log List    ${AllColumn}
    ${CountAllColumn}    Get Length    ${AllColumn}
    FOR    ${INDEX}    IN RANGE    0    ${CountAllColumn}
        ${ColumnIndex}    Evaluate    ${Index}+1
        ${AllRow}    Read Excel Column    col_num=${ColumnIndex}    sheet_name=${SHEETNAME}
        Collections.Remove From List    ${AllRow}    0    #ลบ Row แรก
        # Collections.Remove From List    ${AllRow}    0    #ลบ Row สอง
        log    ${AllColumn[${INDEX}]}
        Set To Dictionary    ${dicAllTestData}    ${AllColumn[${INDEX}]}=${AllRow}
    END
    [Teardown]    Close All Excel Documents
    [Return]    ${dicAllTestData} 

Input All Cars Details
    [Arguments]    ${ALLTESTDATA}    ${ROWLENGTH}
    # ${dicAllTestData}    Create List
    FOR    ${INDEX}    IN RANGE    0    ${ROWLENGTH}
        # Set To Dictionary    ${ALLTESTDATA}    ${AllColumn[${INDEX}]}=${AllRow}
        # Create Premium Data    ${dicAllTestData}
        # log    ${ALLTESTDATA["ประเภทรถ"]}[${index}]
        sleep    6s
        Click Button Name    ${menu_quotation}
        sleep    12s
        Select Frame    ${iframe}
        # Click Button Name    ${menu_quotation}
        # sleep    15s
        Verify Quotation Page
        Select Radio Car Type    ${dicAllTestData["ประเภทรถ"]}[${index}]    #รถเก๋ง
        Select Data In Car Property    ${dicAllTestData["ประเภทการจดทะเบียน"]}[${index}]    #110 รถยนต์ส่วนบุคคล
        Select Data In Car Brand    ${dicAllTestData["ยี่ห้อ"]}[${index}]    #HONDA (ยี่ห้อ)
        Select Data In Car Model    ${dicAllTestData["รุ่น"]}[${index}]    #CITY (รุ่น)
        Select Data In Car Year     ${dicAllTestData["ปีรุ่นรถ"]}[${index}]   #2018  ปีรุ่นรถ
        Select Data In Car Sub Model    ${dicAllTestData["รุ่นย่อย"]}[${index}]    #MY17 Sedan 4dr S i-VTEC CVT FWD 1.5i (2018)
        Input Value In Car Prefix    ${dicAllTestData["อักษรทะเบียน"]}[${index}]    #1กก
        Input Value In Car License No    ${dicAllTestData["เลขทะเบียน"]}[${index}]    #4311
        Select Data In Province    ${dicAllTestData["จังหวัด"]}[${index}]    #กรุงเทพมหานคร
        Input Data In Year Of Birth    ${dicAllTestData["ปีเกิดผู้เอาประกัน"]}[${index}]    #2529
        Select Cliam Type    ${dicAllTestData["ประเภทการซ่อม"]}[${index}]    #ซ่อมอู่
        Click Search Button
        sleep    18s
        Select Insurance Type    ${dicAllTestData["ประเภทประกัน"]}[${index}]    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    #2+
        # ${DataTotal}    Replace String    //span/input[@value="v_company" and @data-id="v_value"]//../../..//div[contains(text(),'ทุนประกัน')]//..//strong    v_value    ${dicAllTestData["ประเภทประกัน"]}[${index}]
        # Log    ${DataTotal}
        # ${ResultTotal}    Replace String    ${DataTotal}    v_company    ${dicAllTestData["ชื่อบริษัท"]}[${index}] 
        # Log    ${ResultTotal}
        # ${DataPremium}    Replace String        //span/input[@value="v_company" and @data-id="v_value"]//../../..//div[contains(text(),'เบี้ยประกัน')]//..//strong    v_value    ${dicAllTestData["ประเภทประกัน"]}[${index}]
        # Log    ${DataPremium}
        # ${ResultPremium}    Replace String    ${DataTotal}    v_company    ${dicAllTestData["ชื่อบริษัท"]}[${index}] 
        # Log    ${ResultPremium}
        # Set Variable    ${ResultTotal}    ${ResultPremium}
        # [Return]    ${ResultTotal}    ${ResultPremium}
        # Get Value In Company    ${dicAllTestData["ประเภทประกัน"]}[${index}]    ${dicAllTestData["ชื่อบริษัท"]}[${index}]
        Click Print Quotation
        Input Information Insurance    ${dicAllTestData["บัตรประชาชน"]}[${index}]    ${dicAllTestData["ชื่อลูกค้า"]}[${index}]    ${dicAllTestData["เบอร์โทร"]}[${index}]
        # Open Excel Document     ${filepath}    Data
        ${indexWriteExcel}    Evaluate    ${index}+1
# Check Message error
        ${resultmessage}    Verify Thai ID And Mobile Number    ${indexWriteExcel}
        Return From Keyword If    '${resultmessage}' == 'True'
        # Insert Data Special Quote For Renew    ${AllDataInsurance}
        # Click Element    //button[@id="btn-print-normal"]
        # SeleniumLibrary.Handle Alert    10s
        # Close Browser
        Unselect Frame

        Switch Window    MAIN
        sleep    4s
        Select Frame    ${iframe}
        sleep    1s
        Wait Until Element Is Visible    ${data_quotenumber}     10s
        ${ResultQuotation}    Get text    ${data_quotenumber}
        # Log    ${ResultQuotation}
        # [Return]    ${ResultQuotation}
        # Create And Update Status Last Column    D:${/}PremiumData.xlsx    Data    Quotation Number    ${ResultQuotation}    1
        # Get CLick in Quotation
        # //a[contains(text(),"QT210250554")]
        sleep    2s
        Replace String Text    ${link_quotenumber}    ${ResultQuotation}
        # Click Link    //a[contains(text(),"${ResultQuotation}")]
        # CLick Element    ${data_quotenumber}
        Sleep    10s
        # Get value in Quotation
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ชีวิตบุคคลภายนอกต่อคน    ${ResultA}
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ชีวิตบุคคลภายนอกต่อครั้ง    ${ResultB}
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ทรัพย์สินบุคคลภายนอก    ${ResultC}
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ค่าเสียหายส่วนแรก(ภายนอก)    ${ResultD}
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    รถยนต์เสียหาย    ${ResultE}
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ค่าเสียหายส่วนแรก    ${ResultF}   
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    รถยนต์เสียหาย / ไฟไหม้    ${ResultG}
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    อุบัติเหตุส่วนบุคคล    ${ResultH}
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ค่ารักษาพยาบาล    ${ResultI}    
        Get Value In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ประกันตัวผู้ขับขี่    ${ResultJ}  
        # ${ResultA}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="ชีวิตบุคคลภายนอกต่อคน"]
        # Log    ${ResultA}
        # ${ResultB}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="ชีวิตบุคคลภายนอกต่อครั้ง"]
        # Log    ${ResultB}   
        # ${ResultC}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="ทรัพย์สินบุคคลภายนอก"]
        # Log    ${ResultC}
        # ${ResultD}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="ค่าเสียหายส่วนแรก(ภายนอก)"]
        # Log    ${ResultD}
        # ${ResultE}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="รถยนต์เสียหาย"]
        # Log    ${ResultE}
        # ${ResultF}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="ค่าเสียหายส่วนแรก"]
        # Log    ${ResultF}
        # ${ResultG}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="รถยนต์เสียหาย / ไฟไหม้"]
        # Log    ${ResultG}
        # ${ResultH}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="อุบัติเหตุส่วนบุคคล"]
        # Log    ${ResultH}
        # ${ResultI}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="ค่ารักษาพยาบาล"]
        # Log    ${ResultI}
        # ${ResultJ}    Get text    //table[@id="${dicAllTestData["ชื่อบริษัท"]}[${index}]"]//td[@title="ประกันตัวผู้ขับขี่"]
        # Log    ${ResultJ}
        Wait Until Element Is Visible    ${btn_quote_close_modal}    10s
        CLick Element    ${btn_quote_close_modal}
        Unselect Frame
        Open Excel Document     D:${/}Premium${/}PremiumData.xlsx    ${sheetdata}
        ${indexWriteExcel}    Evaluate    ${index}+1
        Write Excel By Columns Name    ทุนประกัน    ${indexWriteExcel}    ${ResultTotal}
        Write Excel By Columns Name    เบี้ยประกัน    ${indexWriteExcel}    ${ResultPremium}
        Write Excel By Columns Name    ชีวิตบุคคลภายนอกต่อคน    ${indexWriteExcel}    ${ResultA}
        Write Excel By Columns Name    ชีวิตบุคคลภายนอกต่อครั้ง    ${indexWriteExcel}    ${ResultB}
        Write Excel By Columns Name    ทรัพย์สินบุคคลภายนอก    ${indexWriteExcel}    ${ResultC}
        Write Excel By Columns Name    ค่าเสียหายส่วนแรก(ภายนอก)    ${indexWriteExcel}    ${ResultD}        
        Write Excel By Columns Name    ค่าเสียหายส่วนแรก    ${indexWriteExcel}    ${ResultE}
        Write Excel By Columns Name    ค่าเสียหายส่วนแรก    ${indexWriteExcel}    ${ResultF}
        Write Excel By Columns Name    รถยนต์เสียหาย / ไฟไหม้    ${indexWriteExcel}    ${ResultG}
        Write Excel By Columns Name    อุบัติเหตุส่วนบุคคล    ${indexWriteExcel}    ${ResultH}
        Write Excel By Columns Name    ค่ารักษาพยาบาล    ${indexWriteExcel}    ${ResultI}
        Write Excel By Columns Name    ประกันตัวผู้ขับขี่    ${indexWriteExcel}    ${ResultJ}
        Write Excel By Columns Name    ผลลัพธ์    ${indexWriteExcel}    Pass
        ExcelLibrary.Save Excel Document    filename=D:${\}Premium${\}PremiumData.xlsx
        Close All Excel Documents
    
    END

Go To URL And Quotation Menu
    ${dicAllTestData}    Read All Excel By Columns Name    D:${/}Premium${/}PremiumData.xlsx    ${sheetdata}
    Log Dictionary    ${dicAllTestData}
    Set Global Variable     ${dicAllTestData}
    Open Browser Desktop Mode    ${url_ios}
    Login IOS System    ${userlogin}    ${passlogin}
    Click Button Name    //li[@id="107"]
    # Click Button Name    ${menu_quotation}
    # sleep    15s

# Create Premium Data
#     [Documentation]    Create premium data
#     [Arguments]    ${dicAllTestData}
#     Verify Quotation Page
#     # Wait Until Page Contains    //*[contains(text()," ใบเสนอราคา 1")]    30s
#     ${dicAllTestData["Type of Garage"]}
#     Select Radio Car Type    รถเก๋ง
#     Select Data In Car Property    110 รถยนต์ส่วนบุคคล
#     Select Data In Car Brand    HONDA
#     Select Data In Car Model    CITY
#     Select Data In Car Year    2018
#     Select Data In Car Sub Model    MY17 Sedan 4dr S i-VTEC CVT FWD 1.5i (2018)
#     Input Value In Car Prefix    1กก
#     Input Value In Car License No    4311
#     Select Data In Province    กรุงเทพมหานคร
#     Input Data In Year Of Birth    2529
#     Select Cliam Type    ซ่อมอู่
#     Click Search Button
#     sleep    18s
#     Select Insurance Type    2+
#     # Scroll Element Into View    //div[@id="result0"]//label[contains(text(),'เลือกจำนวนงวด :')]
#     Select Company    2+    NSI
#     # Verify Alert Warning
#     # Unselect Frame
#     # Wait Until Element Is Visible    //div[@id="div_Quote_V"]    60s
#     # Click Element    //input[@id="opt-pickup-case"]
#     # //div[@id="div_Quote_P"]//input[@id="opt-pickup-case"]


# Read All Excel TestData
#     [Arguments]    ${dicAllTestData}
#     [Documentation]    Read data for excel file
#     # Open Excel Document    filename=D:${/}Premium${/}PremiumData.xlsx    doc_id=doc1
#     # ${AllExcelRow}    ExcelLibrary.Read Excel Row    row_num=1    sheet_name=Data
#     # ${CountExcelRow}    BuiltIn.Get Length    ${AllExcelRow}
#     # ${CountExcelResult}    Evaluate    ${CountExcelRow}+1
#     #Create list column name
#     # ${ColumnListName}=      Create List     ประเภทรถ    ประเภทการจดทะเบียน    ยี่ห้อ    รุ่น    ปีรุ่นรถ    รุ่นย่อย    อักษรทะเบียน    เลขทะเบียน
#     # ${ListAllExcelColumn}    BuiltIn.Create List
#     FOR    ${INDEX}    IN RANGE    1    ${CountExcelResult}
#         sleep    0.01    #delay loop
#         Log    ${AllExcelRow}[${INDEX}]
#         ${ExcelColumnByList}    ExcelLibrary.Read Excel Column    col_num=${INDEX}    sheet_name=Data
#         # ${CountExcelRow}    BuiltIn.Get Length    ${AllExcelRow}
#         # Remove From List    ${ExcelColumnByList}    0
#         # ${ColumnIndex}    Evaluate    ${Index}+1
#         # ${value1}=    Set Variable     ${dicAllTestData["ประเภทรถ"]}[${INDEX}]
#         # Log    ${value1}
#         # ${value2}=    Set Variable     ${dicAllTestData["ประเภทการจดทะเบียน"]}[${INDEX}] 
#         # Append To List    ${ListAllExcelColumn}    ${value1}    ${value2}
#         # Append To List    ${ListAllExcelColumn}    ${dicAllTestData["ประเภทการจดทะเบียน"]}[${INDEX}]
#         # Log    ${ListAllExcelColumn}
#         # ${RowAll}    Read Excel Row    row_num=${RowIndex}    sheet_name=Data
#         # Remove From List    ${ListAllExcelColumn}    0  
#         ${value1}=   Set Variable     ${dicAllTestData["ประเภทรถ"]}[${INDEX}]
#         Log    ${value1}
#         # ${value2}=   Set Variable     ${dicAllTestData["ประเภทการจดทะเบียน"]}[${INDEX}]   
#         # ${value3}=   Set Variable     ${dicAllTestData["ยี่ห้อ"]}[${INDEX}]
#         # ${value4}=   Set Variable     ${dicAllTestData["รุ่น"]}[${INDEX}]    
#         # ${value5}=   Set Variable     ${dicAllTestData["ปีรุ่นรถ"]}[${INDEX}]
#         # ${value6}=   Set Variable     ${dicAllTestData["รุ่นย่อย"]}[${INDEX}]   
#         # ${value7}=   Set Variable     ${dicAllTestData["อักษรทะเบียน"]}[${INDEX}]
#         # ${value8}=   Set Variable     ${dicAllTestData["เลขทะเบียน"]}[${INDEX}]
#         # ${value9}=   Set Variable     ${dicAllTestData["จังหวัด"]}[${INDEX}]
#         # ${value10}=   Set Variable     ${dicAllTestData["ปีเกิดผู้เอาประกัน"]}[${INDEX}]   
#         # ${value11}=   Set Variable     ${dicAllTestData["ประเภทการซ่อม"]}[${INDEX}]
#         # ${value12}=   Set Variable     ${dicAllTestData["ประเภทประกัน"]}[${INDEX}]    
#         # ${value13}=   Set Variable     ${dicAllTestData["ชื่อบริษัท"]}[${INDEX}]
#         # ${value14}=   Set Variable     ${dicAllTestData["ชื่อลูกค้า"]}[${INDEX}]
#         # ${value15}=   Set Variable     ${dicAllTestData["เบอร์โทร"]}[${INDEX}]  
#         # ${value16}=   Set Variable     ${dicAllTestData["บัตรประชาชน"]}[${INDEX}]
#         # ${value17}=   Set Variable     ${dicAllTestData[16]}[${INDEX}]
#         # ${value18}=   Set Variable     ${dicAllTestData[17]}[${INDEX}]   
#         # ${value19}=   Set Variable     ${dicAllTestData[18]}[${INDEX}]    
#         # ${ListAllExcelColumnA}    Set Variable    ${dicAllTestData}[${INDEX}]
#         Collections.Append To List    ${ListAllExcelColumn}    ${value1}    
#         # Log    ${ListAllExcelColumn}
#         # Log    ${ListDataCar}
#     END
#     set global variable    ${ListAllExcelColumn}
#     # Collections.Log List    ${ListAllExcelColumn}  
#     # [Teardown]    ExcelLibrary.Close All Excel Documents
#     # [Teardown]    ExcelLibrary.Close All Excel Documents
#     Log    ${ListAllExcelColumn}
#     [Return]    ${ListAllExcelColumn} 
  

# Read Excel By Row
#     [Arguments]    ${dicAllTestData}
#     Log List    ${dicAllTestData}
#     ${CountdicAllTestData}    Get Length    ${dicAllTestData}
#     FOR    ${INDEX}    IN RANGE    0    ${CountdicAllTestData}
#         ${RowIndex}    Evaluate    ${Index}+1
#         ${RowAll}    Read Excel Row    row_num=${RowIndex}    sheet_name=Data
#         log    ${RowIndex[${INDEX}]}
#         Set To Dictionary    ${dicAllRowTestData}    ${RowIndex[${INDEX}]}
#     END
#     # [Teardown]    ExcelLibrary.Close All Excel Documents
#     [Return]    ${dicAllRowTestData}