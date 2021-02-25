*** Settings ***
Resource    ../Resource/Configuration/${ENV}/ServerConfig.robot
Resource    ../Resource/Configuration/${ENV}/UserData.robot
Resource    ../Resource/Locator/LoginPageLocator.robot
Resource    ../Resource/Locator/QuotationPageLocator.robot

*** Variables ***
${ENV}    UAT