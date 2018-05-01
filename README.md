## CrossBrowserTesting/Robot Integration
#### Setup
You will need to install the [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) for Robot.
```
pip install robotframework-seleniumlibrary
```
#### Usage
See *crossbrowsertesting.robot* for a working example. You will need to put in your CBT credentials for ${CBTUser} and ${CBTAuth}. Once that is done, all you need to do is run the test suite.
```
robot crossbrowsertesting.robot
```
You should be able to see your test running in the [dashboard](https://app.crossbrowsertesting.com/selenium?tab=recent).