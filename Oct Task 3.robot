*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Status Update
	[Tags]    status
	Open Browser    https://www.facebook.com/    chrome
	Maximize Browser Window
	Input Text    id:email    nchanikyavarma04@gmail.com
	Input Text    id:pass    Hiddenleaf@7
	Click Element    xpath://button[.='Log in']
	Sleep    15
	Click Element    xpath://div[@class='x9e5oc1']/span/span/div
	Sleep    3
	Mouse Over    xpath://div[@data-visualcompletion='ignore-dynamic']/a[.='Story']
	Sleep    3
	Click Element    xpath://div[@data-visualcompletion='ignore-dynamic']/a[.='Story']
	Sleep    3
	Click Element    xpath://div[contains(text(),'Create a Text Story')]
	Sleep    3
	Click Element    xpath://div[@class='x78zum5 xh8yej3']//textarea
	Press Keys    xpath://div[@class='x78zum5 xh8yej3']//textarea    My New FB Account
	Sleep    3
    Click Element    xpath://div[@aria-label='Share to Story']
    Sleep    15
    Click Element    xpath://a[@aria-label='Home']
    Sleep    3
    Page Should Contain Element    xpath://span[contains(text(),'Your Story')]
    Log To Console    ${\n}Successfully Updated Status In Social Media

