*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
${login_auth_button}    //*[text()="Log in"]
${email_field}  name=email
${pw_field}     //*[@type="password"]

*** Keyword ***
Login
    [arguments]     ${email}    ${pw}
     Open Browser    url=https://app.deriv.com/account/api-token   browser=chrome
     maximize browser window
#	 Set window     1280    1028
     sleep  2
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
    click element   //*[text()="Read"]
    sleep   2
    click element   //*[text()="Read"]
    sleep   2

