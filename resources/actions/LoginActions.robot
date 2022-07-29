*** Settings ***
Documentation		Login actions

*** Variables ***
${INPUT_EMAIL}      css=input#email
${INPUT_PASSWORD}   css=input#password

*** Keywords ***
Go To Login Page
  Go To   ${BASE_URL}
  Wait For Elements State		css=.login-form		visible

Fill Credentials
  [Arguments]   ${user}

  Fill Text		${INPUT_EMAIL}      ${user}[email]
  Fill Text		${INPUT_PASSWORD}   ${user}[password]

Submit Credentials
  Click		css=.submit-button >> text=Entrar

User Should Be Logged In
  [Arguments]   ${user}

  ${element}            Set Variable    css=a[href="/profile"]
  ${expect_fullname}    Set Variable    ${user}[name] ${user}[lastname]

  Wait For Elements State   ${element}    visible
  Get Text                  ${element}    ${expect_fullname}

Should Be Type Email
  Get Property   ${INPUT_EMAIL}   Type    equal   email