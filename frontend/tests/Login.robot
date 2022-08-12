*** Settings ***
Documentation   Login Test Suite

Resource		${EXECDIR}/resources/Base.robot

Test Setup			Start Session
Test Teardown		After Test

*** Test Cases ***
User login
  [Tags]    smoke

  ${user}		Factory User    login

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  User Should Be Logged In    ${user}

Incorrect Password
  [Tags]    incorrect_password

  ${user}   Create Dictionary   email=testerlogin@getgeeks.com    password=abc123

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  Modal Content Should Be   Usuário e/ou senha inválidos.

User Not Found
  [Tags]    user_not_found

  ${user}   Create Dictionary   email=usernotfound@getgeeks.com    password=pwd123

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  Modal Content Should Be   Usuário e/ou senha inválidos.

Incorrect Email
  [Tags]    incorrect_email

  ${user}   Create Dictionary   email=testerlogin&getgeeks.com    password=pwd123

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  Should Be Type Email

Required Email
  ${user}   Create Dictionary   email=${EMPTY}    password=pwd123

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  Alert Span Should Be    E-mail obrigatório

Required Password
  ${user}   Create Dictionary   email=testerlogin@getgeeks.com    password=${EMPTY}

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  Alert Span Should Be    Senha obrigatória

Required Fields
  @{expect_alerts}		Create List
	...									E-mail obrigatório
	...									Senha obrigatória

  Go To Login Page
  Submit Credentials
  Alert Spans Should Be   ${expect_alerts}