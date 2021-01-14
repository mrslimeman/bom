*** Settings ***
Library   Selenium2Library

*** Variables ***
${browser}   Chrome
${url_google}   http://www.google.com
${Expected}   6
${Num1}   xpath=//*[@jsname="N10B9"]
${Num2}   xpath=//*[@jsname="lVjWed"]
${Num3}   xpath=//*[@jsname="KN1kY"]
${Num4}   xpath=//*[@jsname="xAP7E"]
${Num5}   xpath=//*[@jsname="Ax5wH"]
${Num6}   xpath=//*[@jsname="abcgof"]
${Num7}   xpath=//*[@jsname="rk7bOd"]
${Num8}   xpath=//*[@jsname="T7PMFe"]
${Num9}   xpath=//*[@jsname="XoxYJ"]
${Num0}   xpath=//*[@jsname="bkEvMb"]
${Divide}   xpath=//*[@jsname="WxTTNd"]
${Result_Plus}   xpath=//*[@jsname="Pt8tGc"]

*** Test Cases ***
Search
  Open Google
  Search google
  Calculator Sum
  Result log

*** Keywords ***
Open Google
  Open Browser  ${url_google}  ${browser}
  Maximize Browser Window

Search google
  Input Text  name=q  Calculator
  Submit Form

Calculator Sum
  Wait Until Element Is Visible  ${Num1}
  Click Element  ${Num1}
  Click Element  ${Num8}
  Click Element  ${Divide}
  Click Element  ${Num3}
  Click Element  ${Result_Plus}
  Sleep  1.5s

Result log
  Wait Until Element Is Visible  id=cwos
  ${result}  Get Text  id=cwos
  Run Keyword If  "${result}"=="${Expected}"  Corrected
  ...  ELSE  Failed

Corrected
  Log to Console  Result is Correctly
  Log to Console  Result is ${Expected}

Failed
  Log to Console  Result is Incorrect
