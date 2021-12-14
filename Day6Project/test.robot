*** Settings ***
Library    SeleniumLibrary
Resource    testDetails.robot

*** Variables ***
${link1}     https://app.deriv.com/account/api-token
${link2}     https://app.deriv.com/account/deactivate-account

*** Test Cases ***
Log In
    Login   ${my_email}  ${my_pw}   ${link1}

Checkbox Functionality
    SelectCheckboxScopes

Token Field
    CheckTokenField
Create Button
    CheckCreateButton
API Key
    CreateAPIKey

Project2-LogIn
    Login   ${my_email}  ${my_pw}   ${link2}

Project2-SelectReason
    SelectReason