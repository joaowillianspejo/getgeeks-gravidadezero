*** Settings ***
Documentation		Signup Test Suite

Resource		${EXECDIR}/resources/Base.robot

Test Setup			Start Session
Test Teardown		After Test

*** Test Cases ***
Register a new user
	[Tags]		smoke

	${user}		Factory User		faker

	Go To Signup Form
	Fill Signup Form		${user}
	Submit Signup Form
	User Should Be Registered

Duplicate user
	[Tags]		attempt_signup

	${user}		Factory User		faker

	Add User From Database		${user}

	Go To Signup Form
	Fill Signup Form		${user}
	Submit Signup Form
	Modal Content Should Be  Já temos um usuário com o e-mail informado.

Wrong Email
	[Tags]		attempt_signup		wrong_email

	${user}		Factory User		wrong_email

	Go To Signup Form
	Fill Signup Form		${user}
	Submit Signup Form
	Alert Span Should Be		O email está estranho

Required Fields
	[Tags]		attempt_signup		required_fields

	@{expect_alerts}		Create List
	...									Cadê o seu nome?
	...									E o sobrenome?
	...									O email é importante também!
	...									Agora só falta a senha!

	Go To Signup Form
	Submit Signup Form
	Alert Spans Should Be		${expect_alerts}

Short Password
	[Tags]		attempt_signup		short_password
	[Template]		Signup With Short Password
	1
	12
	123
	1234
	12345
	a
	ab
	abc
	abcd
	abcde
	1a
	1a2
	1a2b
	1a2bc

*** Keywords ***
Signup With Short Password
	[Arguments]		${short_password}

	${user}		Create Dictionary
	...				name=Tester									lastname=Getgeeks
	...				email=tester@getgeeks.com		password=${short_password}

	Go To Signup Form
	Fill Signup Form		${user}
	Submit Signup Form
	Alert Span Should Be		Informe uma senha com pelo menos 6 caracteres