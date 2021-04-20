*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary
Library  ImapLibrary2
Library  OperatingSystem
Library  String

*** Variables ***
${codigo}  000000
${device}  Felipe
 

*** Test Cases ***
Loga na conta e cria uma chave
	[Documentation]  
    [Tags]  Log In
	Start
	Login 
	Sleep  15
	Email Verification
	Sleep  3
	Click Button  //html/body/main/div/div/div/div/button[1]
	Wait Until Page Contains  Identificar dispositivo
	Sleep  2
	Input Text  id:Name  ${device}  
	Click Button  //button[@type='submit']


*** Keywords ***

Email Verification
    Open Mailbox  host=outlook.office365.com  user=gestaomassas@primecontrol.com.br  password=b1g86jPrime
    ${LATEST} =  Wait For Email  sender=no-reply@meuacesso.com.br  timeout=60
    ${HTML} =  Get Email Body  ${LATEST}
	Create File  test1.txt  ${HTML}  encoding=UTF-8
	${Text}  Get File  test1.txt
	Mark Email As Read  ${LATEST}
	#${codigo}  Extract Email Content  ${Text}
	${codigo}  Get Line  ${Text}  14
	${codigo1}  Get Substring  ${codigo}  0  1
	${codigo2}  Get Substring  ${codigo}  1  2
	${codigo3}  Get Substring  ${codigo}  2  3
	${codigo4}  Get Substring  ${codigo}  3  4
	${codigo5}  Get Substring  ${codigo}  4  5
	${codigo6}  Get Substring  ${codigo}  5  6
	Input Text  id:Token_0_  ${codigo1}  
	Input Text  id:Token_1_  ${codigo2}
	Input Text  id:Token_2_  ${codigo3}  
	Input Text  id:Token_3_  ${codigo4}  
	Input Text  id:Token_4_  ${codigo5}  
	Input Text  id:Token_5_  ${codigo6}  
	Close Mailbox



Start
	Open Browser  https://account.meuacesso.com.br/  chrome

Finish
	Close Browser

Login
    Wait Until Page Contains  Olá, acesse sua conta!
    #Click Link  link:Log In
	Input Text  id:CustomerCode  367.375.528-54
	Input Password  id:Password  Fm101010
	Sleep  2
	Click Button  //button[@type='submit']
	

	
	
	