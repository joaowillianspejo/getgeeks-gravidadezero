*** Settings ***
Documentation   Sessions Route Test Suite

Resource    ${EXECDIR}/resources/Base.robot

*** Variables ***
&{incorrect_password}   email=testerapi@getgeeks.com    password=abc123
&{incorrect_email}      email=testerapi#getgeeks.com    password=pwd123
&{user_not_found}       email=user@outlook.com          password=pwd123
&{empty_password}       email=testerapi@getgeeks.com    password=${EMPTY}
&{empty_email}          email=${EMPTY}                  password=pwd123
&{without_password}     email=testerapi@getgeeks.com
&{without_email}        password=pwd123

*** Test Cases ***
User session
  ${payload}    Factory User Session    signup
  
  POST User     ${payload}

  ${payload}    Factory User Session    login

  ${response}   POST Session    ${payload}

  Status Should Be    200                   ${response}

  ${size}             Get Length            ${response.json()}[token]
  Should Be True      ${size} > 0
  
  Should Be Equal     10d                   ${response.json()}[expires_in]

Should not get token
  [Template]    Attempt POST Session

  ${incorrect_password}   401   Unauthorized
  ${incorrect_email}      400   Incorrect email
  ${user_not_found}       401   Unauthorized
  ${empty_password}       400   Required pass
  ${empty_email}          400   Required email
  ${without_password}     400   Required pass
  ${without_email}        400   Required email

***Keywords***
Attempt POST Session
  [Arguments]   ${payload}    ${status_code}    ${error_message}

  ${response}   POST Session    ${payload}

  Status Should Be    ${status_code}      ${response}
  Should Be Equal     ${error_message}    ${response.json()}[error]