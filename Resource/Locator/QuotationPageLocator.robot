*** Variables ***
#menu insurance quotation
${menu_quotation}    //a[@id="m_201"]
${radio_cartype}    //input[@id="opt-default-case"]
${radio_pickuptype}    //input[@id="opt-pickup-case"]
${radio_specialtype}    //input[@id="opt-special-case"]
${radio_employeetype}    //input[@id="opt-employee-case"]
#create insurance quotation
${ddl_car_register}    //select[@id="input-car-propertiestab1"]
${ddl_car_brand}    //input[@id="txt-input-car-brandtab1"]
${ddl_car_model}    //input[@id="input-car-modeltab1"]
${ddl_car_register_year}    //select[@id="input-register-yeartab1"]
${ddl_car_submodel}    //select[@id="input-car-model-subtab1"]
${txt_car_prefix}    //input[@id="input-regis-no-pretab1"]
${txt_car_postfix}    //input[@id="input-regis-no-posttab1"]
${ddl_car_province}    //select[@id="input-provincetab1"]
${input_year_of_birth}    //input[@id="input-yearofbirthtab1"]
#cliam type
${radio_cliam_garage}    //input[@id="input-cliam-type-Btab1"]
${radio_cliam_shop}    //input[@id="input-cliam-type-Atab1"]
#button
${btn_search_company}    //button[@id="btn-searchtab1"]
${btn_clear_search}    //button[@id="btn-canceltab1"]
#Tab Insurance type
${tab_insurance_type_1}    //a[@data-ins-type="1"]
${tab_insurance_type_2}    //a[@data-ins-type="2"]
${tab_insurance_type_2+}    //a[@data-ins-type="22"]
${tab_insurance_type_3}    //a[@data-ins-type="3"]
${tab_insurance_type_3+}    //a[@data-ins-type="33"]

#data
${DataInDropdown}    //option[text()='v_value']
# 110 รถยนต์ส่วนบุคคล

#FrameID
${iframe}    //iframe[@id="iframe_content"]

#Quotation page
${data_quotenumber}    //tr[@id="1"]//td/a[@data-toggle="modal"]
${link_quotenumber}    //a[contains(text(),"v_value")]
${label_title}    //table[@id="v_value"]//td[@title="v_title"]

${btn_quote_close_modal}    //button[@id="closemodal"]