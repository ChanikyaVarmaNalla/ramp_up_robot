*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Test Youtube
	Open Browser    https://www.youtube.com/@RajiRaji-nd4sg    chrome    options=add_argument("--disable-notifications")
	Maximize Browser Window
	Set Selenium Speed    2s
	Click Element    xpath:(//a[@aria-label='Sign in'])[1]
	Input Text    id:identifierId    nchanikyavarma04@gmail.com
	Click Element    xpath://div[@id='identifierNext']/div/button
	Wait Until Element Is Visible    xpath://span[.='Welcome']    timeout=10
	Input Text    name:Passwd    Kingsman@7
	Click Element    xpath://span[.='Next']
	Wait Until Element Is Visible    xpath://div[@id='subscribe-button']//yt-smartimation/yt-button-shape/button   timeout=10
	Click Element    xpath://div[@id='subscribe-button']//yt-smartimation/yt-button-shape/button

	${channel_name}    Get Text    xpath://div[@id='meta']//div[@id='text-container']
	Log To Console    ${\n}Name of the Channel: ${channel_name}

	${links}    Get All Links
	${links_count}    Get Length    ${links}
	Log To Console    ${\n}Total Links in the URL: ${links_count}

	${all_elements}    Get Webelements    xpath://*
	${elements_count}    Get Length    ${all_elements}
	Log To Console    ${\n}Total Elements in the URL: ${elements_count}

	${texts}    Create List
    FOR    ${i}    IN RANGE    @{all_elements}
        ${tt}    Get Text    ${i}
        Append To List    ${texts}    ${tt}
    END

    ${texts_count}    Get Length    ${texts}
    Log To Console    ${\n}Total Texts in the URL: ${texts_count}
