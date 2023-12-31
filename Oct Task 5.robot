*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Test Wynk Music
	Open Browser    https://wynk.in/music    chrome
	Maximize Browser Window
	Set Selenium Speed    2s
	Click Element    xpath://span[.='Login']
	Input Text    xpath://input[@placeholder='Enter Mobile Number']    8985873519
	Click Element    xpath://button[.='Send OTP']
	Wait Until Element Is Visible    xpath://span[.='My Music']    timeout=35

	Click Element    xpath://a[.='Trending Now']
	Click Element    xpath://button[.='Play Songs']

	Mouse Over    xpath://button[@title='Sound Quality']
	Mouse Over    xpath://button[@title='Sound Quality']//li[2]
	Click Element    xpath://button[@title='Sound Quality']//li[2]

    FOR    ${i}    IN RANGE    4
    	Click Element    xpath://i[@title='Next']
    END

    Click Element    xpath://a[.='Wynk Music']
    Scroll Element Into View    xpath://h2[.='New Releases']
    Click Element    xpath://h2[.='Recently Played']
