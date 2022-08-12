*** Settings ***
Documentation   Geeks Route

*** Keywords ***
POST Geek
  [Arguments]   ${token}   ${payload}

  ${headers}    Create Dictionary   Authorization=${token}

  ${response}   POST
  ...           ${API_GEEKS}/geeks
  ...           headers=${headers}
  ...           json=${payload}
  ...           expected_status=any

  [Return]      ${response}

GET Geeks
  [Arguments]   ${token}

  ${headers}    Create Dictionary   Authorization=${token}

  ${response}   GET
  ...           ${API_GEEKS}/geeks
  ...           headers=${headers}
  ...           expected_status=any

  [Return]      ${response}