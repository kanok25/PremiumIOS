*** Variables ***
#menu insurance quotation
${menu_quotation}    //a[@id="m_201"]
${menu_ios}    //li[@id="107"]
${radio_cartype}    //input[@id="opt-default-case"]
${radio_pickuptype}    //input[@id="opt-pickup-case"]
${radio_specialtype}    //input[@id="opt-special-case"]
${radio_employeetype}    //input[@id="opt-employee-case"]
#create insurance quotation
${ddl_car_register}    //select[@id="input-car-propertiestab1"]
${ddl_car_brand}    //input[@id="txt-input-car-brandtab1"]//..//span[@data-btncombobox="1"]
${ddl_car_model}    //input[@id="txt-input-car-modeltab1"]//..//span[@data-btncombobox="1"]
${ddl_car_register_year}    //select[@id="input-register-yeartab1"]
${ddl_car_submodel}    //input[@id="txt-input-car-model-subtab1"]//..//span[@data-btncombobox="1"]
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
${btn_edit_car_info}     //button[@id="btn-reEdittab1"]
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

#Car Brand
${txt_car_brand}    //input[@id="txt-input-car-brandtab1"]
${select_car_brand}    //li[@class="ui-menu-item"]/div[1]
# Car model
${txt_car_model}    //input[@id="txt-input-car-modeltab1"]
${select_car_model}    //ul[2]//li[@class="ui-menu-item"]/div[1]
# Car submodel
${txt_car_sub_model}    //input[@id="txt-input-car-model-subtab1"]
${select_car_sub_model}    //ul[3]//li[@class="ui-menu-item"]/div[1]
#prefix
${txt_car_prefix}    //input[@id="input-regis-no-pretab1"]
# Car License No
${txt_car_license_no}    //input[@id="input-regis-no-posttab1"]
# Select Insurance
${box_insurance_company}    //span/input[@value="v_company" and @data-id="v_value"]//..//img
${txt_total}    //span/input[@value="v_company" and @data-id="v_value"]//../../..//div[contains(text(),'ทุนประกัน')]//..//strong
${txt_permium}    //span/input[@value="v_company" and @data-id="v_value"]//../../..//div[contains(text(),'เบี้ยประกัน')]//..//strong
# Popup
${modal_customer}    //div[@id="modal-print"]//h4[@class="modal-title"]
${modal_thai_id}    //input[@id="modal-input-idcard"]
${modal_fristname}    //input[@id="modal-input-fname"]
${modal_mobilephone}    //input[@id="modal-input-phone"]
${modal_title_name}    //div[@class="modal-dialog"]//h4[contains(text(),'ข้อมูลผู้เอาประกัน')]
${search_not_found}    //div[@id="div-search-result"]//div[@class="alert alert-warning"]
${btn_print}     //button[@id="btn-print-normal"]
${btn_cancel_modal}    //button[@id="btn-cancal-normal"]
${radio_register_com}    //input[@id="modal-input-customerTypeCode_C"]
${lbl_mainpage_quotation}    //*[contains(text(),'ข้อมูลรถลูกค้า')]
${radio_car_type_s}    //div[@id="div_Quote_S"]
${radio_car_type_p}    //div[@id="div_Quote_P"]//input
${radio_car_type_v}    //div[@id="div_Quote_V"]//input