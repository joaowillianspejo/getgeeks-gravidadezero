*** Settings ***
Documentation   Login Test Suite

Resource		${EXECDIR}/resources/Base.robot

Test Setup			Start Session
Test Teardown		Finish Session

*** Test Cases ***
User login
  ${user}		Factory User Login

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  User Should Be Logged In    ${user}

Incorrect Password
  [Tags]    incorrect_password

  ${user}   Create Dictionary   email=tester@getgeeks.com    password=abc123

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  Modal Content Should Be  Usuário e/ou senha inválidos.

User Not Found
  [Tags]    user_not_found

  ${user}   Create Dictionary   email=usernotfound@getgeeks.com    password=pwd123

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  Modal Content Should Be  Usuário e/ou senha inválidos.

Incorrect Email
  [Tags]    incorrect_email

  ${user}   Create Dictionary   email=tester&getgeeks.com    password=pwd123

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  Should Be Type Email