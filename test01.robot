
*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Library           String
Suite Teardown     Close Browser

*** Variables ***
${browser}      Chrome
${url_google}   http://www.google.com
${test_fb}      Facebook
${day}  xpath =  //*[@id="day"]
${month}  xpath =  //*[@id="month"]
${year}  xpath =  //*[@id="year"]
${fn}  Testdata
${ln}  TestAuto

*** Test Cases ***
Search Facebook from Google
  Open Google
  Serach google
  Click Linked Facebook
  Register

*** Keywords ***
Open Google
  Open Browser  ${url_google}  ${browser}

Serach google
  Input Text  name=q  ${test_fb}
  Submit Form


Click Linked Facebook
  Click Element  //*[@id="rso"]/div[1]/div/div/div/div[1]/a/h3/span
  capture page screenshot  Facebook.png
  Click Element  //*[@id="u_0_2"]



Register
  Wait Until Element Is Visible  name=firstname
  capture page screenshot  before_Register.png
  Input Text  name=firstname  ${fn}
  Input Text  name=lastname  ${ln}
  Click Element  ${day}
  Select From List By Index  ${day}  5
  Click Element  ${month}
  Select From List By Index  ${month}  5
  Click Element  ${year}
  Select From List By Index  ${year}  20
  Select Radio Button  sex  1
  capture page screenshot  register_success.png

[Teardown]     Close Browser





