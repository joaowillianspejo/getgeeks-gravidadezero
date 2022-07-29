*** Settings ***
Documentation   Shared Actions

*** Keywords ***
Modal Content Should Be
	[Arguments]		${expect_message}

	${title}			Set Variable		css=.swal2-title
	${content}		Set Variable		css=.swal2-html-container

	Wait For Elements State		${title}		visible
	Get Text									${title}		equal		Oops...

	Wait For Elements State		${content}		visible	
	Get Text									${content}		equal		${expect_message}