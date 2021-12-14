*** Settings ***
Library    SeleniumLibrary
Resource    testDetails.robot

*** Test Cases ***
Log In
    Login   ${my_email}  ${my_pw}

