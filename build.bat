SET SITE_URL=https://siteUrl.appiancloud.com/suite/
SET DRIVER_FILE_PATH=C:\\Program Files (x86)\\Google\\Driver\\chromedriver.exe
SET INITIATOR_USER=test-user
SET INITIATOR_PASSWORD=test-password
SET SITE_NAME=test-site
set TEST_CASE_WEB_API_KEY=api-key-goes-here
set TEST_CASE_WEB_API_START_ENDPOINT=webapi/startRuleTests
set TEST_CASE_WEB_API_RESULTS_ENDPOINT=webapi/checkRuleTestStatus
set "CREATE_NEW_REQUEST_BUTTON=TestButton"
set TASK_GRID=Paging Grid

./gradlew clean build test --warning-mode all
@REM gradle test -i
