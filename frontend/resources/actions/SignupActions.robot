*** Settings ***
Documentation		Signup actions

*** Keywords ***
Go To Signup Form
	Go To		${BASE_URL}/signup
	Wait For Elements State		css=.signup-form		visible

Fill Signup Form
	[Arguments]		${user}

	Fill Text		css=input#name				${user}[name]
	Fill Text		css=input#lastname		${user}[lastname]
	Fill Text		css=input#email				${user}[email]
	Fill Text		css=input#password		${user}[password]

Submit Signup Form
	Click		css=.submit-button >> text=Cadastrar

User Should Be Registered
	${expect_message}		Set Variable		css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

	Wait For Elements State		${expect_message}		visible