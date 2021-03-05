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
Suite Teardown      Close All Browsers
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

Test Normal Product Key
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
        Verify Search Is Not Found    ${dicAllTestData}    ${index}

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

