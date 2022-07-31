*** Settings ***
Documentation		Base Test

Library			Browser
Library			Collections

Library			factories/Users.py

Resource		actions/SharedActions.robot
Resource		actions/SignupActions.robot
Resource		actions/LoginActions.robot
Resource		actions/BeGeekActions.robot

Resource		Database.robot
Resource		Helpers.robot

*** Variables ***
${BASE_URL}		https://getgeeks-joaowillian.herokuapp.com

*** Keywords ***
Start Session
	New Browser		chromium		headless=False		slowMo=00:00:00.5
	New Page			${BASE_URL}

Finish Session
	Take Screenshot		fullPage=True