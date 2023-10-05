*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Login
	Open Browser    https://www.booking.com/    chrome
	Maximize Browser Window
