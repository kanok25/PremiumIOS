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
    Select Data In Car Sub Model    ${dicAllTestData["รุ่นย่อย"]}[${index}]    #MY17 Sedan 4dr S i-VTEC CVT FWD 1.5i (2018)
    Input Value In Car Prefix    ${dicAllTestData["อักษรทะเบียน"]}[${index}]    #1กก
    Input Value In Car License No    ${dicAllTestData["เลขทะเบียน"]}[${index}]    #4311
    Select Data In Province    ${dicAllTestData["จังหวัด"]}[${index}]    #กรุงเทพมหานคร
    Input Data In Year Of Birth    ${dicAllTestData["ปีเกิดผู้เอาประกัน"]}[${index}]    #2529
    Select Cliam Type    ${dicAllTestData["ประเภทการซ่อม"]}[${index}]    #ซ่อมอู่
    Click Search Button
    sleep    18s

Go To URL And Quotation Menu
    ${dicAllTestData}    Read All Excel By Columns Name    D:${/}Premium${/}PremiumData.xlsx    ${sheetdata}
    Log Dictionary    ${dicAllTestData}
    Set Global Variable     ${dicAllTestData}
    Open Browser Desktop Mode    ${url_ios}
    Login IOS System    ${userlogin}    ${passlogin}
    Click Button Name    ${menu_ios}

    
Verify Search Is Not Found
    [Documentation]    ตรวจสอบการ Search ข้อมูล
    [Arguments]    ${dicAllTestData}    ${index}
    #เอาจาก Index 0+1 = Row ใน Excel =1
    ${indexWriteExcel}    Evaluate    ${index}+1
    ${resultsearch}    Verify Search Insurance Datail    ${indexWriteExcel}
    Return From Keyword If    '${resultsearch}' == 'True'
    Select Insurance    ${dicAllTestData["ประเภทประกัน"]}[${index}]    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ${dicAllTestData["บัตรประชาชน"]}[${index}]    ${dicAllTestData["ชื่อลูกค้า"]}[${index}]    ${dicAllTestData["เบอร์โทร"]}[${index}]    ${index}
    Input Information Insurance    ${dicAllTestData["บัตรประชาชน"]}[${index}]    ${dicAllTestData["ชื่อลูกค้า"]}[${index}]    ${dicAllTestData["เบอร์โทร"]}[${index}]    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ${dicAllTestData["ประเภทจดทะเบียน"]}[${index}]    ${index}
    # ${DataIDCard}    ${DataFirstName}    ${DataMobile}    ${DataCompanyName}    ${index}
    # Verify Data For Quotation    ${dicAllTestData}    ${index}

Verify Data For Quotation
    [Arguments]    ${index}
    ${indexWriteExcel}    Evaluate    ${index}+1               # Check Message error
    ${resultmessage}    Verify Thai ID And Mobile Number    ${indexWriteExcel}
    Return From Keyword If    '${resultmessage}' == 'True'
    Get And Write All Data In Quotation    ${index}    ${dicAllTestData["ชื่อบริษัท"]}[${index}]
    # ${dicAllTestData["ชื่อบริษัท"]}[${index}]

# Input All Cars Details
#     [Arguments]    ${ALLTESTDATA}    ${ROWLENGTH}
#     #เริ่มจาก 0
#     FOR    ${INDEX}    IN RANGE    0    ${ROWLENGTH}
#         # Set To Dictionary    ${ALLTESTDATA}    ${AllColumn[${INDEX}]}=${AllRow}
#         # log    ${ALLTESTDATA["ประเภทรถ"]}[${index}]
#         sleep    6s
#         Click Button Name    ${menu_quotation}
#         sleep    10s
#         # ${indexWriteExcel}    Evaluate    ${INDEX}+1
#         Create Quotation    ${dicAllTestData}    ${INDEX}
#         Verify Search Is Not Found    ${dicAllTestData}    ${INDEX}
#     END

    #     sleep    6s
    #     Click Button Name    ${menu_quotation}
    #     sleep    12s
    #     Select Frame    ${iframe}
    #     Verify Quotation Page
    #     Select Radio Car Type    ${dicAllTestData["ประเภทรถ"]}[${index}]    #รถเก๋ง
    #     Select Data In Car Property    ${dicAllTestData["ประเภทการจดทะเบียน"]}[${index}]    #110 รถยนต์ส่วนบุคคล
    #     Select Data In Car Brand    ${dicAllTestData["ยี่ห้อ"]}[${index}]    #HONDA (ยี่ห้อ)
    #     Select Data In Car Model    ${dicAllTestData["รุ่น"]}[${index}]    #CITY (รุ่น)
    #     Select Data In Car Year     ${dicAllTestData["ปีรุ่นรถ"]}[${index}]   #2018  ปีรุ่นรถ
    #     Select Data In Car Sub Model    ${dicAllTestData["รุ่นย่อย"]}[${index}]    #MY17 Sedan 4dr S i-VTEC CVT FWD 1.5i (2018)
    #     Input Value In Car Prefix    ${dicAllTestData["อักษรทะเบียน"]}[${index}]    #1กก
    #     Input Value In Car License No    ${dicAllTestData["เลขทะเบียน"]}[${index}]    #4311
    #     Select Data In Province    ${dicAllTestData["จังหวัด"]}[${index}]    #กรุงเทพมหานคร
    #     Input Data In Year Of Birth    ${dicAllTestData["ปีเกิดผู้เอาประกัน"]}[${index}]    #2529
    #     Select Cliam Type    ${dicAllTestData["ประเภทการซ่อม"]}[${index}]    #ซ่อมอู่
    #     Click Search Button
    #     sleep    18s
    #     Select Insurance    ${dicAllTestData["ประเภทประกัน"]}[${index}]    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    #2+
    #     Click Print Quotation
    #     Input Information Insurance    ${dicAllTestData["บัตรประชาชน"]}[${index}]    ${dicAllTestData["ชื่อลูกค้า"]}[${index}]    ${dicAllTestData["เบอร์โทร"]}[${index}]
    #     Verify Data For Quotation    ${index}    ${dicAllTestData["ชื่อบริษัท"]}[${index}]
    #     # ${indexWriteExcel}    Evaluate    ${index}+1               # Check Message error
    #     # ${resultmessage}    Verify Thai ID And Mobile Number    ${indexWriteExcel}
    #     # Return From Keyword If    '${resultmessage}' == 'True'
    #     # # Unselect Frame
    #     # Get And Write All Data In Quotation    ${dicAllTestData["ชื่อบริษัท"]}[${index}]    ${index}
    # END

