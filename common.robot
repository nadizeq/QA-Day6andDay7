*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
${login_auth_button}    //*[text()="Log in"]
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]

*** Keyword ***
Login
    [arguments]     ${email}    ${pw}
     Open Browser    url=https://app.deriv.com   browser=chrome
     maximize browser window
#	 Set window     1280    1028
     wait until page does not contain element    dt_core_header_acc-info-preloader   60
	 wait until page contains element   ${login_btn}     60
	 Click Element   ${login_btn}
     wait until page contains element   ${email_field}      15
	 input text     ${email_field}      ${email}
	 input text     ${pw_field}      ${pw}
	 Click Element   ${login_auth_button}

RealAcc
     wait until page contains element   dt_core_account-info_acc-info      60
     wait until page does not contain element  dt_core_header_acc-info-preloader    60
     click element      dt_core_account-info_acc-info
	 click element      real_account_tab
	 sleep              2
	 click element      dt_core_account-switcher_demo-tab
	 wait until page does not contain element  dt_core_header_acc-info-preloader    60
	 wait until page does not contain element   sidebar__items  60


BuyRiseContract
    set selenium timeout    2
    Wait Until Page Contains Element    chart_container    120
    click element           //*[contains(@class, 'cq-symbol-select-btn')]
    Sleep    2s
    Wait Until Element Is Visible   //*[contains(@class,"sc-mcd__item sc-mcd__item--1HZ10V")]
    click element           //*[contains(@class,"sc-mcd__item sc-mcd__item--1HZ10V")]
    Sleep    2s
#    Wait Until Element Is Visible   //*[contains(@class,"input trade-container__input range-slider__track")]
#    click element at coordinates    //*[contains(@class,"input trade-container__input range-slider__track")]    1725    199
    Wait Until Element Is Visible   dt_purchase_call_button
    click element           dt_purchase_call_button
    Wait Until Page Contains Element    chart_container    120
    set selenium timeout    0
    sleep   7

BuyLowerContract
    click element           //*[contains(@class, 'cq-symbol-select-btn')]
    sleep   2
    Wait Until Page Contains Element    //*[text()="Forex"]    60
    click element           //*[text()="Forex"]
    sleep   2
    Wait Until Page Contains Element    //*[contains(@class,"sc-mcd__item sc-mcd__item--frxAUDUSD ")]    60
    click element           //*[contains(@class,"sc-mcd__item sc-mcd__item--frxAUDUSD ")]
    sleep  4
    Wait Until Page Contains Element    dt_contract_dropdown     60
    click element   dt_contract_dropdown
    sleep  2
    Wait Until Page Contains Element    dt_contract_high_low_item    60
    click element           dt_contract_high_low_item
    sleep  3
    Wait Until Page Contains Element    //*[@type="number"]    60
    press keys  //*[@type="number"]  CTRL+A  BACKSPACE
    press keys  //*[@type="number"]  2
#    input text  //*[@type="number"]     2
    click element   //*[@id="dc_stake_toggle_item" and contains(@class,"dc-btn dc-btn__toggle dc-button-menu__button")]
    Wait Until Page Contains Element    //*[@type="tel"]    60
    press keys  //*[@id="dt_amount_input"]  CTRL+A  BACKSPACE
    press keys  //*[@id="dt_amount_input"]  15.50
#    input text  //*[@type="tel"]     15.50
    wait until page contains element    //*[@id="dt_purchase_put_button"]   60
    click element   //*[@id="dt_purchase_put_button"]

CheckBarrierError
    sleep   2
    wait until page contains element  //*[@id="dt_barrier_1_input"]  60
    press keys  //*[@id="dt_amount_input"]  CTRL+A  BACKSPACE
    press keys  //*[@id="dt_amount_input"]  10
    wait until page contains element  //*[@id="dt_barrier_1_input"]  60
    sleep   2
    press keys  //*[@id="dt_barrier_1_input"]   CTRL+A  BACKSPACE
    press keys  //*[@id="dt_barrier_1_input"]   SHIFT+=
    press keys  //*[@id="dt_barrier_1_input"]   0.77152
    sleep   2
    ${Status}=     Run Keyword And Return Status    Element Should be Disabled    //*[@id="dt_purchase_put_button"]
    log  Lower button has been disabled. Condition is ${Status}
#    ${ValidateText}=    Return from keyword if  string('//*[text()="Contracts more than 24 hours in duration would need an absolute barrier"]') =="Contracts more than 24 hours in duration would need an absolute barrier"    Error message appear as expected
#    element should be disabled  //*[@id="dt_purchase_put_button"]
    sleep   3
#    wait until page contains    text=Contracts more than 24 hours in duration would need an absolute barrier
    sleep   2
    wait until page contains   Contracts more than 24 hours in duration would need an absolute barrier   30
    ${ValidateText}=     Run Keyword And Return Status    page should contain    Contracts more than 24 hours in duration would need an absolute barrier
    log  Error Text is displayed. Condition is ${ValidateText}

CheckMultiplierContract
    click element           //*[contains(@class, 'cq-symbol-select-btn')]
    sleep   2
    Wait Until Page Contains Element    //*[text()="Synthetic Indices"]    60
    click element           //*[text()="Synthetic Indices"]
    sleep   2
    Wait Until Page Contains Element    //*[contains(@class,"sc-mcd__item sc-mcd__item--R_50 ")]    60
    click element           //*[contains(@class,"sc-mcd__item sc-mcd__item--R_50 ")]






