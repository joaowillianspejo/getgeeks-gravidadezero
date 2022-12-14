*** Settings ***
Documentation		Base Test

Library			Browser
Library			Collections
Library			String

Library			factories/Users.py
Library			Utils.py

Resource		actions/SharedActions.robot
Resource		actions/SignupActions.robot
Resource		actions/LoginActions.robot
Resource		actions/BeGeekActions.robot

Resource		Database.robot
Resource		Helpers.robot
Resource		Services.robot

*** Variables ***
${BASE_URL}		https://getgeeks-joaowillian.herokuapp.com

*** Keywords ***
Start Session
	New Browser					${BROWSER}		headless=${HEADLESS}		slowMo=00:00:00.5
	New Page						${BASE_URL}
	Set Viewport Size		1280		768

After Test
	${screenshot_name}		Screenshot Name

	Take Screenshot		fullPage=True		filename=${screenshot_name}