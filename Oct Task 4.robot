*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Flight Booking MakeMyTrip
	[Tags]    makemytrip
	Open Browser    https://www.makemytrip.com/flights/    chrome
	Maximize Browser Window
	Set Selenium Speed    2s
    Click Element    xpath://span[@class='commonModal__close']
    Click Element    xpath://label[@for='fromCity']
    Input Text    xpath://input[@placeholder='From']    bangalore
    Click Element    xpath://ul[@role='listbox']/li[1]
    Click Element    xpath://label[@for='toCity']
    Input Text    xpath://input[@placeholder='To']    hyderabad
    Click Element    xpath://ul[@role='listbox']/li[1]
    Click Element    xpath:(//div[@class="dateInnerCell"])[14]
    Click Element    xpath://a[.='Search']
    Sleep    20

    Wait Until Element Is Visible    xpath://div[@class='commonOverlay ']/span    timeout=30
    TRY
        Click Element    xpath://div[@class='commonOverlay ']/span
    EXCEPT
    	CONTINUE
    END
    Click Element    xpath:(//span[.='View Prices'])[1]
    Click Element    xpath:(//button[.='Book Now'])[1]
    Switch Window    new

    Scroll Element Into View    xpath://input[@id='cb_gst_info']/..
    Click Element    xpath://input[@id='cb_gst_info']/..
    Scroll Element Into View    xpath:(//input[@type="radio"])[2]/..
    Click Element    xpath:(//input[@type="radio"])[2]/..

    Scroll Element Into View    xpath://button[.='+ ADD NEW ADULT']
    Click Element    xpath://button[.='+ ADD NEW ADULT']
    Scroll Element Into View    xpath://button[.='+ ADD NEW ADULT']
    Click Element    xpath://input[@placeholder="First & Middle Name"]
    Input Text    xpath://input[@placeholder="First & Middle Name"]    chanikya varma    TAB
    Input Text    xpath://input[@placeholder="Last Name"]    nalla
    Click Element     xpath://label[.='MALE']

    Scroll Element Into View    xpath://input[@placeholder="Mobile No"]
    Click Element    xpath://input[@placeholder="Mobile No"]
    Input Text    xpath://input[@placeholder="Mobile No"]    8985873519
    Click Element    xpath://input[@placeholder="Email"]
    Input Text    xpath://input[@placeholder="Email"]    nchanikyavarma04@gmail.com

    Double Click Element    xpath://button[.='Continue']
    Click Element    xpath://button[.='CONFIRM']
    Click Element    xpath://button[.='PROCEED']

    Scroll Element Into View    xpath://span[.='Skip to add-ons']
    Click Element    xpath://span[.='Skip to add-ons']

    Scroll Element Into View    xpath://button[.='Proceed to pay']
    Click Element    xpath://button[.='Proceed to pay']
    Sleep    15

    Page Should Contain Element    xpath://span[.='Your Booking']
    Log To Console    ${\n}Booking Done




