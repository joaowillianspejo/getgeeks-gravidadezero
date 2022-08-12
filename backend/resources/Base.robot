***Settings***
Documentation   Base Test

Library     RequestsLibrary
Library     factories/Users.py

Resource    routes/Sessions.routes.robot
Resource    routes/Users.routes.robot
Resource    routes/Geeks.routes.robot

Resource    Helpers.robot

*** Variables ***
${API_USERS}    https://getgeeks-users-joaowillian.herokuapp.com
${API_GEEKS}    https://getgeeks-geeks-joaowillian.herokuapp.com