package dit.appian.testing.common.framework;

//JUnit Dependencies
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;

//Apache Dependencies

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClients;

//Appian Selenium Dependencies
import com.appiancorp.ps.automatedtest.fixture.SitesFixture;

//Log4J Dependencies
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;

@TestMethodOrder(OrderAnnotation.class)
public class CommonTests {
//	Static Variables
	// private static final Logger LOG = LogManager.getLogger(Tasks.class);
    protected static Logger LOG = LogManager.getLogger(CommonTests.class);
	
	protected static SitesFixture fixture;
	protected static HttpClient httpClient;

	protected static String recordId;

	/**
	* <p>Code to be called when the Tests are setup</p>
	* <p>Initiates Static Variables</p>
	* <p>Logs in With Initiator User (defined in Env Variables)</p>
	* <p>Sets Up Wibe Driver and Navigates to Main Site Page</p>
	*/
	@BeforeAll public static void setUp() {
		// Client for Web Requests
		LOG.debug("START: setUp Method");
		httpClient = HttpClients.createDefault();

		fixture = new SitesFixture();
		fixture = Utils.initialFixtureSetup(fixture, true);

		Utils.navigateToMainSite(fixture, Utils.getSiteUrl(), Utils.getSiteName());
		LOG.debug("END: setUp Method");
	}
	
	/**
	 * <p>Test Cancel is working</p>
	 */
	@Test @Order(1) public void testCancelFlow() {
		LOG.debug("START: testCancelFlow Method");

		Assertions.assertTrue( Utils.verifyAndClickButton(fixture, Utils.getCreateNewRequestButton()) );
		Assertions.assertTrue( 
			Utils.verifyAndClickButton(fixture, Constants.Buttons.CANCEL) ||  
			Utils.verifyAndClickButton(fixture, Constants.Buttons.CANCEL_APPLICATION) 
		);
		Assertions.assertTrue( Utils.verifyAndClickButton(fixture, Constants.Buttons.YES) );

		LOG.debug("END: testCancelFlow Method");
	}

	/**
	 * <p>Clicks the Save Draft Button</p>
	 * <p>Checks the to see whether or not the Draft has saved successfully</p>
	 * <p> Polls a number of times</p>
	 */
	@Test @Order(2) public void testSaveDraftFlow() {

		LOG.debug("START: testSaveDraftFlow Method");

		// Save Draft
		Assertions.assertTrue( Utils.verifyAndClickButton(fixture, Utils.getCreateNewRequestButton()) );
		Assertions.assertTrue( Utils.verifyAndClickButton(fixture, Constants.Buttons.SAVE_DRAFT) );

		// Check Task Grid for Save Draft
		int numRequests = 0;
		String milestoneStatus = "";

		Utils.wait(Constants.Time.MINUTES, 1);
		
		while( (!milestoneStatus.equalsIgnoreCase(Constants.MilestoneStatus.DRAFT)) && numRequests < Constants.APPIAN_API_MAX_REQUESTS) {
			Utils.refreshPage(fixture);
			milestoneStatus = Utils.getGridColumnRowValue(
				fixture,
				Utils.getTaskGrid(), 
				Constants.Components.TASK_GRID_MILESTONE_STATUS_COLUMN_NAME,
				"1"
			);

			Utils.wait(Constants.Time.SECONDS, 1);
			numRequests++;
		}

		// Test Draft was found
		Assertions.assertEquals(milestoneStatus, Constants.MilestoneStatus.DRAFT);

		LOG.debug("END: testSaveDraftFlow Method");
	 }

	/**
	 * <p> Click Link for Task in Grid </p>
	 * <p> Get RecordId From Task Name in Grid </p>
	 * <p> On Submit for click
	 */
	 @Test @Order(3) public void testDiscardFlow() {
		LOG.debug("START: testDiscardFlow Method");

		// Set Record Id
		String taskName = fixture.getGridColumnRowValue(
			Utils.getTaskGrid(), 
			Constants.Components.TASK_GRID_TASK_LINK_COLUMN_NAME,
			"1"
		);
		
		recordId = Utils.formatRecordId(taskName);

		LOG.debug("DEBUG: recordId Is " + recordId);
		
		// Discard the Application
		fixture.clickOnGridColumnRow(
			Utils.getTaskGrid(), 
			Constants.Components.TASK_GRID_TASK_LINK_COLUMN_NAME,
			"1"
		);

		Assertions.assertTrue( Utils.verifyAndClickButton(fixture, Constants.Buttons.DISCARD_APPLICATION) );
		Assertions.assertTrue( Utils.verifyAndClickButton(fixture, Constants.Buttons.YES) );

		// Check Record Search Grid to see if it was Discarded Correctly

		LOG.debug("END: testDiscardFlow Method");
	 }

	//  Virtual / Abstract Methods to be overriden by inheriting class (not actually defined as Abstract)
	/**
	* <p>Blank method as this will need to be implemented in overriding class</p>
	* <p>Because the code for it is unique (different fields need to be filled in on the screen, etc)</p>
	* <p>possibly could make it generic and remove override if we had fields provided via config file / Object</p>
	* <p>that this Test could read</p>
	*/
	@Test @Order(4) public void testSubmitForApprovalFlow() {

	 }

	//  Virtual / Abstract Methods to be overriden by inheriting class (not actually defined as Abstract)
	@Test @Order(5) public void testRequestMoreInformationFlow() {
		/*
		*/
	 }

	//  Virtual / Abstract Methods to be overriden by inheriting class (not actually defined as Abstract)
	@Test @Order(6) public void testForwardIfReceivedInErrorFlow() {
		/*
		*/
	 }

	//  Appian Unit Tests
	 @Test @Order(7) void testCallTestCaseWebApi() {
		/*
		 *
		 */
		LOG.debug("START: testCallTestCaseWebApi Method");

		int id = Utils.startAppianUnitTestsWebApi(httpClient);

		// If 1 request was bad
		Assertions.assertNotEquals(1, id);

		JSONObject response = Utils.getAppianUnitTestResults(httpClient, id);

		// Assert that the Unit Tests Pass
		if(response.getString(Constants.WebApiResponse.STATUS_KEY) == Constants.WebApiResponse.FAIL) {
			LOG.error("ERROR: Unit Tests Failing on Appian Server");
		}
		
		Assertions.assertEquals(Constants.WebApiResponse.PASS, response.getString(Constants.WebApiResponse.STATUS_KEY));

		LOG.debug("END: testCallTestCaseWebApi Method");

	 }

	/**
	 * <p>Code to be called when the tests are finished</p>
	*/
	@AfterAll public static void tearDown() {

		LOG.debug("START: tearDown Method");

		fixture.tearDown();

		LOG.debug("END: tearDown Method");
	}
}
