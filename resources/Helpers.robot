*** Settings ***
Documentation   Test Helpers

*** Keywords ***
Add User
  [Arguments]   ${user}

  Go To Signup Form
	Fill Signup Form		${user}
	Submit Signup Form
	User Should Be Registered

Add User From Database
  [Arguments]   ${user}

  Connect To Postgres
  Insert User   ${user}
  Disconnect From Database

Do Login
  [Arguments]   ${user}

  Go To Login Page
  Fill Credentials    ${user}
  Submit Credentials
  User Should Be Logged In    ${user}