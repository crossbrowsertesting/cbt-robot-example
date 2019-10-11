<h1><strong>Getting Started with Robot and CrossBrowserTesting</strong></h1>
<p><em>For this document, we provide an example test located in our <a href="https://github.com/crossbrowsertesting/cbt-robot-example">Robot Github Repository</a>.</em></p>
<p>Want a powerful and easy to use command line tool for running Selenium tests? <a href="https://robotframework.org/">Robot</a> might be the option for you. Robot provides language-bindings for the powerful browser-driving tool <a href="http://www.seleniumhq.org/docs/" rel="nofollow">Selenium</a>.</p>
<p><a href="https://robotframework.org/">Robot</a> is a open source automation framework for acceptance testing that uses an easy-to-use tabular test data syntax and keyword driven testing approach. Robot integrates easily with the CrossBrowserTesting platform, so you can perform tests on a wide variety of OS/Device/Browser combinations, all from one test.</p>
<h3>Let’s walk through getting setup.</h3>
<div class="blue-alert">You’ll need to use your Username and Authkey to run your tests on CrossBrowserTesting. To get yours, sign up for a&nbsp;<a href="https://crossbrowsertesting.com/freetrial"><b>free trial</b></a>&nbsp;or purchase a&nbsp;<a href="https://crossbrowsertesting.com/pricing"><b>plan</b></a>.</div>
<p>First we need to create a new folder and get Selenium for Robot installed. You can do this using pip:</p>
<pre><code>pip install robotframework-seleniumlibrary</code></pre>
<p>Next we need to create a test. This will be the Robot commands that work with the Selenium language bindings to create the logic of our test. Save the following as crossbrowsertesting.robot:</p>
<pre><code>*** Settings ***
Documentation     Simple example using SeleniumLibrary and CBT.
Library           SeleniumLibrary

*** Variables ***
${CBTUser}     YOUR_CBT_USERNAME 
${CBTAuth}     YOUR_CBT_AUTHKEY
${Username}      tester@crossbrowsertesting.com 
${Password}      test123 
${SiteUrl}        http://crossbrowsertesting.github.io/login-form.html
${Delay}         5s 
${RemoteUrl}   http://${CBTUser}:${CBTAuth}@hub.crossbrowsertesting.com:80/wd/hub
${Browser}  Chrome
${Version}  77
${Platform}  Windows 10
${Resolution}  1366x768
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
    [Teardown]    Close Browser    </code></pre>
<p>Be sure to add your CBT username and CBT authkey to your script.</p>
<p>Congratulations! You have successfully integrated CBT and Robot. Now you are ready to run your test using the command:</p>
<pre><code>robot crossbrowsertesting.robot</code></pre>
<p>As you can probably make out from our test, we visit our simple login page example, interact with our page to log in, and use assertions to verify that our log in was successful.</p>
<p>We kept it short and sweet for our purposes, but there is so much more you can do with Robot! Being built on top of Selenium means the sky is the limit as far as what you can do. If you have any questions or concerns, feel <a href="mailto:info@crossbrowsertesting.com">free to get in touch</a>.</p>
