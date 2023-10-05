*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Login
	Open Browser    https://www.amazon.in/    chrome
	Maximize Browser Window
#	Mouse Over    id:nav-link-accountList
#	Mouse Over    xpath://div[@id='nav-flyout-ya-signin']/a
#	Click Element    xpath://div[@id='nav-flyout-ya-signin']/a
    Click Element    id:nav-link-accountList
	Input Text    id:ap_email    cvarma01@gmail.com
	Click Element    id:continue
	Input Text    id:ap_password    Hiddenleaf@7
	Click Element    id:signInSubmit
	Sleep    5

Select Product
	Input Text    id:twotabsearchtextbox    speaker
	Click Element    id:nav-search-submit-text
	Sleep    3
	Scroll Element Into View    xpath:(//span[@class='a-size-medium a-color-base a-text-normal'])[2]
	Click Element    xpath:(//span[@class='a-size-medium a-color-base a-text-normal'])[1]
	${windows}    Get Window Handles
	Switch Window    ${windows}[-1]
	Click Element    id:add-to-cart-button
	Sleep    3
	Click Element    id:attach-close_sideSheet-link
	Close Window
	Switch Window    ${windows}[0]

Buy Product
	Click Element    id:nav-cart
	Sleep    3
	Click Element    id:sc-buy-box-ptc-button
	Sleep    3
	Click Element    id:orderSummaryPrimaryActionBtn
	Sleep    10
	Click Element    id:orderSummaryPrimaryActionBtn
	Sleep    20
	Click Element    id:submitOrderButtonId
	Wait Until Element Is Visible    xpath://h4[@class='a-alert-heading']
	${confirm}    Get Text    xpath://h4[@class='a-alert-heading']
	Log To Console    ${\n}${confirm}
	Sleep    3
