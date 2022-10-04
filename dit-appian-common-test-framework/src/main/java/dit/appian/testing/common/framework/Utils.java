/*
 * Java class to hold Selenium utilities for interacting with Appian
 */
package dit.appian.testing.common.framework;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.lang.System;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.appiancorp.ps.automatedtest.exception.TimeoutTestException;
import com.appiancorp.ps.automatedtest.fixture.SitesFixture;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.util.EntityUtils;

//Apache Dependencies
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.openqa.selenium.chrome.ChromeDriver;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
public class Utils {
	//	Static Variables
	private static final Logger LOG = LogManager.getLogger(Utils.class);

	// Getting Environment Variables
	public static String getSiteName() {
		return System.getenv(Constants.Env.SITE_NAME);
	}

	public static String getInitiator() {
		return System.getenv(Constants.Env.INITIATOR_USER);
	}

	public static String getPassword() {
		return System.getenv(Constants.Env.INITIATOR_PASSWORD);
	}

	public static String getSiteUrl() {
		return System.getenv(Constants.Env.SITE_URL);
	}

	public static String getDriverFilePath() {
		return System.getenv(Constants.Env.DRIVER_FILE_PATH);
	}

	public static String getTestCaseWebApiKey() {
		return System.getenv(Constants.Env.TEST_CASE_WEB_API_KEY);
	}

	public static String getTestCaseWebApiStartEndpoint() {
		return (
			System.getenv(Constants.Env.SITE_URL) +
			System.getenv(Constants.Env.TEST_CASE_WEB_API_START_ENDPOINT)
		);

	}

	public static String getTestCaseWebApiResultsEndpoint() {
		return (
			System.getenv(Constants.Env.SITE_URL) +
			System.getenv(Constants.Env.TEST_CASE_WEB_API_RESULTS_ENDPOINT)
		);
	}

	public static String getTaskGrid() {
		return System.getenv(Constants.Env.TASK_GRID);
	}

	public static String getCreateNewRequestButton() {
		return System.getenv(Constants.Env.CREATE_NEW_REQUEST_BUTTON);
	}

	/**
	 * 
	 * @param string
	 * @return
	 */
	public static String removeNewLines(String string) {
		return string.replaceAll("\\s{2,}", " ");
	}

	/**
	 * Parse a .json file and return a JSON Object
	 * @param <T>
	 * 
	 * @param jsonFileName
	 * @return
	 */
	public static <T> JSONObject parseJson(Class<T> cls, String jsonFileName) {
		JSONTokener tokener;
		JSONObject jsonObject = null;
		try {
			tokener = new JSONTokener( new InputStreamReader(
				cls.getClassLoader().getResourceAsStream(jsonFileName), 
				"UTF-8"));
			jsonObject = new JSONObject(tokener);

		} catch (UnsupportedEncodingException e) {
			LOG.error(e.getMessage());
		}

		return jsonObject;
	}

	/**
	 * Iterates over a Json Object's fields and uses its data to
	 * populate a form within appian by looping through its json
	 * configuration file.
	 * Finds the relevant fields and gets the label / value to populate
	 * @param jsonObject
	 */
	public static void populateFormViaJsonObject(SitesFixture sitesFixture, JSONObject jsonObject) {
		JSONArray fields = jsonObject.getJSONArray(Constants.JSON.FIELDS);

		for (int i = 0, size = fields.length(); i < size; i++)
		{

			JSONObject field = fields.getJSONObject(i);

			LOG.debug("DEBUG: "+field.toString());
			sitesFixture.populateFieldWithValue(
				field.getString(Constants.JSON.LABEL), 
				field.getString(Constants.JSON.VALUE)
			);
			sitesFixture.waitForProgressBar();
		}
	}

	/**
	* Initial fixture setup, set properties required
	* for the Fixture to run
	* Args: 
	* @param sitesFixture SitesFixture: A SitesFixture to configure
	* @param isLogin boolean: Boolean value to determine whether or not user is logging in
	* 
	* @return SitesFixture: A fully configured SitesFixture
	*/
	public static SitesFixture initialFixtureSetup(SitesFixture sitesFixture, boolean isLogin) {
		//Setting system properties of ChromeDriver
		System.setProperty("webdriver.chrome.driver", getDriverFilePath() );
		sitesFixture.setWebDriver(new ChromeDriver());

		sitesFixture.setTakeErrorScreenshotsTo(true);
		sitesFixture.setAppianUrlTo(getSiteUrl());
		sitesFixture.setTimeoutSecondsTo(Constants.TEST_TIMEOUT);
		sitesFixture.setAppianVersionTo(Constants.TEST_SITE_VERSION);
		sitesFixture.setAppianLocaleTo(Constants.TEST_SITE_LOCALE);
		
		if(isLogin) {
			sitesFixture.loginIntoWithUsernameAndPassword(Constants.URL_LOGIN, getInitiator(), getPassword());
		}
		
		return sitesFixture;
	}

	/**
	 * Logs out an existing user 
	 * and logs back in with a new user
	 * Useful when changing roles, i.e Initiator to Approver
	 * @param sitesFixture
	 * @param user
	 * @param password
	 */
	public static void swapUser(SitesFixture sitesFixture, String user, String password) {

		sitesFixture.logout();
		sitesFixture.loginIntoWithUsernameAndPassword(Constants.URL_LOGIN, user, password);
	}
	
	public static void navigateToMainSite(SitesFixture sitesFixture, String url, String siteName) {
		//Update Base URL because we aren't logging in now
		sitesFixture.setAppianUrlTo(url);
		sitesFixture.navigateToSite(siteName);

	}

	/**
	 * 
	 * @param time
	 * @param unit
	 */
	public static void wait(String unit, int time) {
		try {
			switch(unit) {
				case Constants.Time.MINUTES:
				TimeUnit.MINUTES.sleep(time);
				break;

				case Constants.Time.SECONDS:
				TimeUnit.SECONDS.sleep(time);
				break;

				default:
				TimeUnit.MINUTES.sleep(time);
				break;
			}
		}
		catch (InterruptedException e) {
			LOG.error(e.getMessage());
		}
	}

	/**
	 * 
	 * @param sitesFixture
	 */
	public static void refreshPage(SitesFixture sitesFixture) {
		sitesFixture.refresh();
	}

	/**
	 * <p>Search a string and look for exactly four digits</p>
	 * <p>When found format it to removing the leading zero</p>
	 * @param searchString
	 */
	public static String formatRecordId(String searchString) {
		String recordId;
		Matcher match = Pattern.compile("(?<!\\d)\\d{4}(?!\\d)").matcher(searchString);

		if(match.find())
			recordId = match.group(); // retrieve the matched substring
		else
			recordId = ""; // no match found

		// Strip leading Zero from recordId
		recordId = recordId.replaceAll("0", "");
		return recordId;
	}

	/**
	 * Wrapper for TempoFixture.getGridColumnRowValue
	 * Wraps around and handles for the timeout exception
	 * If Timeout occurs return ""
	 * Else Return the String value that was found
	 * @param sitesFixture
	 * @param gridName
	 * @param columnName
	 * @param rowNum
	 * @return
	 */
	public static String getGridColumnRowValue(
		SitesFixture sitesFixture, 
		String gridName, 
		String columnName, 
		String rowNum
		) {
		
		String result = "";

		try{
			result = sitesFixture.getGridColumnRowValue(gridName, columnName, rowNum);
		}
		catch(TimeoutTestException e){

		}
		
		return result;
	}

	/**
	 * <p>Check whether or not a button exists before clicking on it</p>
	 * @param sitesFixture
	 * @param buttonName
	 * @return
	 */
	public static boolean verifyAndClickButton(SitesFixture sitesFixture, String buttonName) {
		boolean result;
		if ( sitesFixture.verifyButtonIsPresent(buttonName) ) {
			sitesFixture.clickOnButton(buttonName);
			result = true;
		}
		else {
			result = false;
		}

		return result;
	}

	/**
     * <p>Calls an Appian Web API Endpoint to execute</p>
	 * <p>Application's Test Cases.</p>
	 * <p>Returns UnitTestApiResponse: A Model to contan useful information, such as Success</p> 
	 * <p>and also information about failing Unit Tests.</p>
	 * @param httpclient
	 * @return
	 */
	public static int startAppianUnitTestsWebApi(HttpClient httpclient) {
		int result = 1;
		HttpPost httpPost = new HttpPost(getTestCaseWebApiStartEndpoint());
		httpPost.addHeader(Constants.APPIAN_API_KEY_HEADER, getTestCaseWebApiKey());

		try {
			HttpEntity entity = httpclient.execute(httpPost).getEntity();

			if (entity != null) {
				result = Integer.valueOf(EntityUtils.toString(entity));
			}
		}

		catch(ClientProtocolException e) {
			LOG.error("ClientProtocolException: Something has gone wrong");
			LOG.error(e.getMessage());
		}
		catch(IOException e) {
			LOG.error("IOException: Something has gone wrong");
			LOG.error(e.getMessage());
		}

		return result;
	}

	/**
	 * <p>Call the Unit Test API Endpoint and poll every 1 minute.</p>
	 * <p>Timeout after 10 requests if the response is still "IN_PROGRESS"</p>
	 * @param httpClient
	 * @param id
	 * @return
	 */
	public static JSONObject getAppianUnitTestResults(HttpClient httpClient, int id) {
		int numRequests = 0;
		String status = Constants.WebApiResponse.IN_PROGRESS;
		JSONObject response = new JSONObject();
		
		HttpGet httpGet = new HttpGet(getTestCaseWebApiResultsEndpoint());
		httpGet.addHeader(Constants.APPIAN_API_KEY_HEADER, getTestCaseWebApiKey());

		try {
			URI uri;
			uri = new URIBuilder(httpGet.getURI())
			.addParameter(Constants.WebApiResponse.ID_KEY, String.valueOf(id))
			.build();
			httpGet.setURI(uri);
		} 
		catch (URISyntaxException e) 
		{
			LOG.error(e.getMessage());
		}

		while(status.equalsIgnoreCase(Constants.WebApiResponse.IN_PROGRESS) && numRequests < Constants.APPIAN_API_MAX_REQUESTS) {

			try {
				response = new JSONObject(EntityUtils.toString(httpClient.execute(httpGet).getEntity()));

				status = response.getString(Constants.WebApiResponse.STATUS_KEY);
				status = removeNewLines(status);
			}

			catch(ClientProtocolException e) {
				LOG.error("ClientProtocolException: Something has gone wrong");
				LOG.error(e.getMessage());
			}
			catch(IOException e) {
				LOG.error("IOException: Something has gone wrong");
				LOG.error(e.getMessage());
			}

			// Sleep for one minute
			wait(Constants.Time.MINUTES, 1);
			
			numRequests++;
		}

		if( numRequests > Constants.APPIAN_API_MAX_REQUESTS) {
			LOG.error("Appian Web API Timed Out. Please investigate on Appian Server");
			response = response.put(Constants.WebApiResponse.RESPONSE_STATUS_KEY, Constants.WebApiResponse.TIMEOUT);
		}

		else {
			response = response.put(Constants.WebApiResponse.RESPONSE_STATUS_KEY, Constants.WebApiResponse.SUCCESS);
		}
		return response;

	}

}

