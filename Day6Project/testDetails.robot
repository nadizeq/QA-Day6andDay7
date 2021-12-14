*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
${login_auth_button}    //*[text()="Log in"]
${email_field}  name=email
${pw_field}     //*[@type="password"]

*** Keyword ***
Login
    [arguments]     ${email}    ${pw}   ${link}
     Open Browser    ${link}   browser=chrome
     maximize browser window
#	 Set window     1280    1028
     sleep  2
     wait until page contains element   ${login_auth_button}
     Click Element   ${login_auth_button}
     sleep  4
     click element    name=email
     sleep  2
     Click Element   ${login_auth_button}
     sleep  2
     click element  ${pw_field}
     sleep  2
     Click Element   ${login_auth_button}
     sleep  2
	 input text     ${email_field}      ${email}
	 input text     ${pw_field}      ${pw}
	 sleep  2
	 Click Element   ${login_auth_button}

SelectCheckboxScopes
    sleep   2
    wait until page does not contain element    //*[contains(@class, 'initial-loader account__initial-loader')]     60
    sleep   2
    wait until page contains    Read    60
    click element   //*[text()="Read"]
    sleep   1
    click element   //*[text()="Read"]
    sleep   2
    click element   //*[text()="Trade"]
    sleep   1
    click element   //*[text()="Trade"]
    sleep   2
    click element   //*[text()="Payments"]
    sleep   1
    click element   //*[text()="Payments"]
    sleep   2
    click element   //*[text()="Admin"]
    sleep   1
    click element   //*[text()="Admin"]
    sleep   2
    click element   //*[text()="Trading information"]
    sleep   1
    click element   //*[text()="Trading information"]
    sleep   2
    click element   //*[text()="Read"]
    click element   //*[text()="Trading information"]
    sleep   2

CheckTokenField
    sleep   2
    wait until page contains element    //*[@type="text"]   60
    press keys  //*[@type="text"]   SHIFT+8
    press keys  //*[@type="text"]   SHIFT+8
    press keys  //*[@type="text"]   SHIFT+8
    press keys  //*[@type="text"]   SHIFT+8
    sleep   2
    press keys  //*[@type="text"]   CTRL+A  BACKSPACE
    sleep   1
    press keys  //*[@type="text"]   Test1
    sleep   2

CheckCreateButton
    sleep   2
    wait until page contains    Read    60
    click element   //*[text()="Read"]
    click element   //*[text()="Trading information"]
#    sleep   2
#    press keys  //*[@type="text"]   CTRL+A  BACKSPACE
#    sleep   1
#    sleep   1
#    wait until page contains element    //*[contains(@class, 'dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button')]
#    ${ValidateCreateBtn}=     Run Keyword And Return Status    Element Should be Disabled    //*[contains(@class, 'dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button') and @type="submit"]
#    log  Create button has been disabled due to empty scope and null token field. Condition is ${ValidateCreateBtn}
#    sleep   2
#    click element   //*[text()="Read"]
#    click element   //*[text()="Trading information"]
#    sleep   1
#    press keys  //*[@type="text"]   a
#    sleep   1
#    wait until page contains element    //*[contains(@class, 'dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button')]
#    ${ValidateCreateBtn}=     Run Keyword And Return Status    Element Should be Disabled    //*[contains(@class, 'dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button') and @type="submit"]
#    log  Create button has been disabled due to token field less than minimum length(2). Condition is ${ValidateCreateBtn}
#    sleep   2
#    press keys  //*[@type="text"]   CTRL+A  BACKSPACE
#    sleep   1
#    press keys  //*[@type="text"]   kFwZVOVNXdwLqSWYMOlDvfXFsGzQraqqQ
#    sleep   2
#    wait until page contains element    //*[contains(@class, 'dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button')]
#    ${ValidateCreateBtn}=     Run Keyword And Return Status    Element Should be Disabled    //*[contains(@class, 'dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button') and @type="submit"]
#    log  Create button has been disabled due to token field more than maximum length(32). Condition is ${ValidateCreateBtn}
#    sleep   2

CreateAPIKey
    sleep   1
    press keys  //*[@type="text"]   CTRL+A  BACKSPACE
    sleep   1
    press keys  //*[@type="text"]   Test1
    sleep   1
    click element   //*[text()="Read"]
    click element   //*[text()="Trading information"]
    sleep   1
    wait until page contains    Create  60
    click element   //*[text()="Create"]
    sleep   2
    wait until page contains    Delete     30
    sleep   2
#    click element   //*[contains(@class, 'dc-icon dc-clipboard da-api-token__clipboard')]
#    sleep   1
#    press keys  //*[@type="text"]   CTRL+A  BACKSPACE
#    sleep   1
#    press keys  //*[@type="text"]   CTRL+V
    wait until page contains  No
    click element   //*[text()="No"]
    sleep   2
    wait until page contains    Yes     30
    click element   //*[text()="Yes"]
    sleep   2

SelectReason
    sleep   2
    wait until page does not contain element    //*[contains(@class, 'initial-loader account__initial-loader')]     60

    wait until page contains    Continue to account deactivation    60
    click element   //*[contains(text(),'Continue to account deactivation')]
    sleep   2
    wait until page contains   Read     60
    sleep   2
    click element   //*[text()="I want to stop myself from trading.]
    sleep   1
    click element   //*[text()="I want to stop myself from trading"]
    sleep   2
    click element   //*[text()="I'm no longer intrested in trading."]
    sleep   1
    click element   //*[text()="I'm no longer intrested in trading."]
    sleep   2
    click element   //*[text()="I prefer another trading website."]
    sleep   1
    click element   //*[text()="I prefer another trading website."]
    sleep   2
    click element   //*[text()="The platforms aren't user-friendly."]
    sleep   1
    click element   //*[text()="The platforms aren't user-friendly."]
    sleep   2
    click element   //*[text()="Making deposits and withdrawals is difficult."]
    sleep   1
    click element   //*[text()="Making deposits and withdrawals is difficult."]
    sleep   2
    click element   //*[text()="The platforms lack key features or functionality."]
    sleep   1
    click element   //*[text()="The platforms lack key features or functionality."]
    sleep   2
    click element   //*[text()="Customer service was unsatisfactory."]
    sleep   1
    click element   //*[text()="Customer service was unsatisfactory."]
    sleep   2
    click element   //*[text()="I'm deactivating my account for other reasons."]
    sleep   1
    click element   //*[text()="I'm deactivating my account for other reasons."]
    sleep   2










