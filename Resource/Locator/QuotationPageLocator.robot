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
${ddl_car_model}    //select[@id="input-car-modeltab1"]
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
