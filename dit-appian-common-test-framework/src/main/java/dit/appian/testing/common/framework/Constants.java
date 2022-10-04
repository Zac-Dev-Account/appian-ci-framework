package dit.appian.testing.common.framework;
public class Constants {
	/**
	* <p>Standard Constants for Interacting with Appian via the Selenium API</p>
	*/
	public static final String TEST_BROWSER = "CHROME";
	public static final String TEST_SITE_VERSION = "21.3";
	public static final String URL_LOGIN = "https://appian_url.com/suite/portal/login.jsp";
	public static final String TEST_SITE_LOCALE = "en_US";
	public static final Integer TEST_TIMEOUT = 60; // Time out after 60 seconds
	public static final String SITE_HOME_PAGE = "home";
	public static final String APPIAN_API_KEY_HEADER = "appian-api-key";
	public static final int APPIAN_API_MAX_REQUESTS = 10; 
	public static final int CHECK_SCREEN_MAX_REQUESTS = 10;
	public static final Integer CHECK_SCREEN_POLLING = 10;  // Check Screen every 10 seconds
	/**
	* <p>Constants for our Buttons</p>
	* <p>Contains a list of Strings to define common button names</p>
	* <p>in our appian applications</p>
	*/
	public static class Buttons {
		public static final String CANCEL = "Cancel";
		public static final String CANCEL_APPLICATION = "Cancel Application";
		public static final String DISCARD_APPLICATION = "Discard Application";
		public static final String SAVE_DRAFT = "Save Draft";
		public static final String YES = "Yes";
		public static final String SUBMIT = "Submit";
	}
	/**
	* <p>Constants for Env Variables (accessor names)</p>
	* <p>These allow us to pull Environment variable values from the environment</p>
	*/
	public static class Env {
		// Sites
		public static final String SITE_NAME = "SITE_NAME";
		public static final String SITE_URL = "SITE_URL"; // "https://dptibpmdev.appiancloud.com/suite/";
		
		// Common Users
		public static final String INITIATOR_USER = "INITIATOR_USER";
		public static final String INITIATOR_PASSWORD = "INITIATOR_PASSWORD";
		public static final String APPROVER_USER = "APPROVER_USER";
		public static final String APPROVER_PASSWORD = "APPROVER_PASSWORD";
		
		// Web Driver Filepath
		public static final String DRIVER_FILE_PATH = "DRIVER_FILE_PATH"; // 'C:\Program Files (x86)\Google\Driver\chromedriver.exe'
		
		// Web APIs
		public static final String TEST_CASE_WEB_API_START_ENDPOINT = "TEST_CASE_WEB_API_START_ENDPOINT";
		public static final String TEST_CASE_WEB_API_RESULTS_ENDPOINT = "TEST_CASE_WEB_API_RESULTS_ENDPOINT";
		public static final String TEST_CASE_WEB_API_KEY = "TEST_CASE_WEB_API_KEY";

		// Common Components
		public static final String TASK_GRID = "TASK_GRID";
		public static final String CREATE_NEW_REQUEST_BUTTON = "CREATE_NEW_REQUEST_BUTTON";
	}
	/**
	* <p>Web API response Constants, relates to what is returned</p>
	* <p>via Appian Unit Tests Results function</p>
	*/
	public static class WebApiResponse {
		public static final String COMPLETE = "COMPLETE";
		public static final String FAIL = "FAIL";
		public static final String TIMEOUT = "TIMEOUT";
		public static final String SUCCESS = "SUCCESS";
		public static final String IN_PROGRESS = "IN PROGRESS";
		public static final String PASS = "PASS";
		public static final String RESPONSE_STATUS_KEY = "response_status";
		public static final String STATUS_KEY = "status";
		public static final String ID_KEY = "id";
	}
	/**
	* <p>Common Milestone Statuses that are found</p>
	* <p>in our appian applications</p>
	*/
	public static class MilestoneStatus {
		// Terminal Statuses
		public static final String DECLINED = "Declined";
		public static final String DISCARDED = "Discarded";
		public static final String COMPLETED = "Completed";

		public static final String DRAFT = "Draft";

		// Pending Statuses
		public static final String PENDING_ENDORSEMENT = "Pending Endorsement";
		public static final String PENDING_APPROVAL = "Pending Approval";
		public static final String PENDING_INTERNAL_CLEARANCE = "Pending Internal Clearance";
		public static final String PENDING_COMPLETION = "Approved Pending Completion";

		// Further Info Statuses
		public static final String INTERNAL_CLEARANCE_AWAITING_FURTHER_INFO = "Internal Clearance Awaiting Further Info";
		public static final String ENDORSER_AWAITING_FURTHER_INFO = "Endorser Awaiting Further Info";
		public static final String EXEC_DIRECTOR_AWAITING_FURTHER_INFO = "Exec Director Awaiting Further Info";

		// Error Statuses
		public static final String UNKNOWN = "Unknown";

	}
	public static class Time {
		public static final String MINUTES = "MINUTES";
		public static final String SECONDS = "SECONDS";
	}
	public static class Components {
		public static final String TASK_GRID_MILESTONE_STATUS_COLUMN_NAME = "Milestone Status";
		public static final String TASK_GRID_TASK_LINK_COLUMN_NAME = "Task Name";
	}
	public static class JSON {
		// Section Keys
		public static final String FILE_TYPE = "json";
		public static final String APPROVE = "approve";
		public static final String REQUEST_MORE_INFO = "requestMoreInfo";
		public static final String DECLINE = "decline";
		public static final String FIELDS = "fields";

		// Field keys
		public static final String LABEL = "label";
		public static final String VALUE = "value";
		public static final String TYPE = "type";

	}

}
