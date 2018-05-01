*** Settings ***
Documentation     Simple example using SeleniumLibrary and CBT.
Library           SeleniumLibrary

*** Variables ***
${CBTUser}     YOUR_CBT_USERNAME_OR_EMAIL 
${CBTAuth}     YOUR_CBT_AUTHKEY
${Username}      tester@crossbrowsertesting.com 
${Password}      test123 
${SiteUrl}        http://crossbrowsertesting.github.io/login-form.html
${Delay}         5s 
${RemoteUrl}   http://${CBTUser}:${CBTAuth}@hub.crossbrowsertesting.com:80/wd/hub
${Browser}  Firefox
${Version}  27
${Platform}  Windows 7 64-bit
${Resolution}  1024x768
${ExpectedMessage}  You are now logged in!
${Message}  Successful Login!
*** Keywords ***
Open LoginPage
    Open Browser   url=${SiteUrl}   browser=${Browser}   remote_url=${RemoteURL}   desired_capabilities=name:${TestName},browserName:${Browser},version:${Version},platform:${Platform},screen_resolution:${Resolution}
Maximize Browser
    Maximize Browser Window
Enter User Name
    Input Text   name=username   ${Username}
Enter Password
    Input Text   name=password    ${Password}
Click Login
    Click Button  id=submit 
Assert Warning Message
    Element Text Should Be   id=logged-in   ${ExpectedMessage}   ${Message}

*** Test Cases ***
Login Should Succeed 
    Open LoginPage
    Enter User Name
    Enter Password
    Click Login
    sleep    ${Delay}
    Assert Warning Message
    [Teardown]    Close Browser    