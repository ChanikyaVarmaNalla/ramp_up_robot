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

	Click Element    xpath:(//div[contains(@class,'yt-spec-touch-feedback-shape yt-spec-touch')])[5]
	Click Element    xpath://yt-formatted-string[.='Unsubscribe']
	Click Element    xpath://button[@aria-label='Unsubscribe']

	${channel_name}    Get Text    xpath://div[@id='meta']//div[@id='text-container']
	Log To Console    ${\n}Name of the Channel: ${channel_name}

	${links}    Get All Links
	${links_count}    Get Length    ${links}
	Log To Console    ${\n}Total Links in the URL: ${links_count}

	${all_elements}    Get Webelements    xpath://*
    ${elements_count}    Get Length    ${all_elements}
    Log To Console    ${\n}Total Elements in the URL: ${elements_count}

    ${elements_text}    Create List
    FOR    ${i}    IN    @{all_elements}[0:20]
        ${tt}    Get Text    ${i}
        ${len}    Get Length    ${tt}
        Run Keyword If    ${len} > 0    Append To List    ${elements_text}    ${tt}
    END
    ${elements_text_count}    Get Length    ${elements_text}
    Log To Console    ${\n}Total Texts in the URL: ${elements_text_count}

    Click Element    xpath://yt-formatted-string[.='Home']
    ${video_name}    Get Text    xpath:(//a[@id='video-title-link'])[1]
    Click Element    xpath:(//a[@id='video-title-link'])[1]
    Click Element    xpath:(//div[@id='segmented-like-button'])[1]
    ${likes_count}    Get Text    xpath:(//div[@id='segmented-like-button'])[1]//button/div[2]
    Log To Console    ${\n}The Video '${video_name}' has a total of '${likes_count}' likes.
    Click Element    xpath:(//div[@id='segmented-like-button'])[1]

