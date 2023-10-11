*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Book Hotel
	[Tags]    book
	Open Browser    https://www.makemytrip.com/hotels/   chrome
	Maximize Browser Window
	Set Selenium Speed    2s
	Click Element    xpath://span[@class='commonModal__close']
	Click Element    id:hsw_search_button
	Click Element    id:htl_id_seo_201809171729412453

	Switch Window    new
	Wait Until Element Is Visible    id:detpg_headerright_book_now    timeout=15
	Click Element    id:detpg_headerright_book_now

	Scroll Element Into View    xpath://a[.='+ Add Guest']
	Input Text    id:fName    chanikya varma
	Input Text    id:lName    nalla
	Input Text    id:email    nchanikyavarma04@gmail.com
	Input Text    id:mNo    8985873519
	Scroll Element Into View    xpath://a[.='Pay Now']
	Click Element    xpath://a[.='Pay Now']

	Wait Until Element Is Visible    xpath://button[.='verify & pay']    timeout=10
	Scroll Element Into View    xpath:(//span[@class='push-right rupees'])[3]
	${price}    Get Text    xpath:(//span[@class='push-right rupees'])[3]
	Log To Console    ${\n}Price of the Room: ${price}
