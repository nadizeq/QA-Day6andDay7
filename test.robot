*** Settings ***

Library  SeleniumLibrary
Resource    common.robot

*** Variables ***




*** Keyword ***

*** Test Cases ***
Open Deriv-Task1
    Login   ${my_email}  ${my_pw}
    RealAcc
BuyRiseContact-Task2
    BuyRiseContract
#    Close Browser
BuyLowContract-Task3
    BuyLowerContract
CheckRelativeBarrierError-Task4
    CheckBarrierError