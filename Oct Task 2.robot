*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Login
	[Tags]    log
	Open Browser    https://www.goibibo.com/hotels/    chrome
	Maximize Browser Window
	Mouse Over    xpath://div[@class='login__tab_wrapper']
	Sleep    3
	Mouse Over    xpath://button[.='Login/Sign Up']
	Sleep    3
	Click Element    xpath://button[.='Login/Sign Up']
	Sleep    3
	Input Text    name:phone    9666079542
	Sleep    20
	Element Should Be Visible    xpath://span[contains(@class,'uname-truncated')]
	Log To Console    Login Successful

Search Hotels
	[Tags]    search
    Click Element    xpath://div[@data-testid='search-radio-button-wrap']//input
    Input Text    xpath://input[@id='downshift-1-input']    bangalore
    Sleep    3
    Click Element    xpath://span[.='Bangalore, Karnataka, India']
    Click Element    xpath://button[.='Search']
    Sleep    5
    Click Element    xpath://a[@class='close']
    Sleep    3
    Click Element    xpath:(//h4)[1]
    Sleep    3
    Switch Window    new
    Scroll Element Into View    xpath:(//button[@data-testid='selectRoomBtn'])[1]
    Click Element    xpath:(//button[@data-testid='selectRoomBtn'])[1]
    Sleep    5
    Click Element    xpath:(//button)[2]
    Sleep    10
    Element Should Be Visible    xpath://h2[contains(text(),'Pay')]
    Log To Console    ${\n}Booking Done
