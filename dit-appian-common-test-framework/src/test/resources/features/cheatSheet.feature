Feature: Cucumber for Appian Cheatsheet
  This feature file is intended as a cheatsheet of supported functions. The
  scenarios are not structured as valid test cases and are not intended to be
  run as is.

  While the examples use "Given...", you can use any standard Gherkin
  keywords e.g. When, Then, And...

  When using these examples you will will also need to replace the quoted
  placeholder or data table with actual parameters. e.g.
    Given I click on menu "TEMPO_MENU_NAME"
  should be replaced with:
    Given I click on menu "Actions"

  If the same label is used for multiple fields, tasks, records, etc. in the
  same interface, indexing is necessary. In order to select the second iteration
  of the same label, use LABEL[2].



  Scenario: Initialization
    # Initialize Selenium Web Driver and open an instance of the specified browser:
    Given I setup with "BROWSER_NAME" browser

    # Configure custom login page fields:
    Given I setup login with username field "<field ID/Name/Value attribute>" and password field "<field ID/Name/Value attribute>" and login button "<field ID/Name/Value attribute>"


  Scenario: Navigation Methods
    # Navigate to tempo tab:
    Given I click on menu "TEMPO_MENU_NAME"

    # Click on a menu widget:
    Given I click on menu widget "MENU_WIDGET or MENU_WIDGET[INDEX] or [INDEX]"

    # Search for a term on News, Reports, or Record List:
    Given I search for "SEARCH_TERM"

    # Clears search field in Records:

    Given I clear search value

  Scenario: News Methods
    # Verify a news post containing specific text is present. The method will wait for the timeout period and refresh up to the configured number of refresh times before failing:
    Given I verify news feed containing text "NEWS_TEXT" is present

    # Verify a news post containing specific text is not present:
    Given I verify news feed containing text "NEWS_TEXT" is not present

    # Verify a news post containing specific text with a specific label and value is present:
    Given I verify news feed containing text "NEWS_TEXT" and more info with label "LABEL" and value "VALUE" is present

    # Verify a news post containing specific text with a specific tag is present:
    Given I verify news feed containing text "NEWS_TEXT" tagged with "TAG_NAME" is present

    # Verify a news post with a particular title and comment is present:
    Given I verify news feed containing text "NEWS_TEXT" commented with "COMMENT" is present

    # Clicks on the news post containing the specific text and verifies that the browser is directed to a URL with the appropriate ID of the news post
    Given I verify news feed containing "MESSAGE" link navigation

    # Hover over the user profile circle on a news post containing specific text:
    Given I verify hover over news poster circle on post containing "MESSAGE"

    # Hover over the user profile link on a news post containing specific text:
    Given I verify hover over news poster link on post containing "MESSAGE"

    # Verify that a news post containing specific text is starred:
    Given I verify post "MESSAGE" is starred

    # Click on the record tag on a particular news post:
    Given I click on news feed "NEWS_TEXT" record tag "RECORD_TAG"

    # Click the user profile circle on a news post containing specific text:
    Given I click user profile circle on post containing "MESSAGE"

    # Click the user profile link on a news post containing specific text:
    Given I click user profile link on post containing "MESSAGE"

    # Toggle the 'more info' on a news post containing specific text:
    Given I toggle more info for news feed containing text "NEWS_TEXT"

    # Delete a news post containing specific text:
    Given I delete news post "NEWS_TEXT"

    # Send a news post to a list of participants:
    Given I send post "MESSAGE" to "RECIPIENTS"

    # Send a news post:
    Given I send post "MESSAGE"

    # Post a kudos message about a user:
    Given I send kudos "MESSAGE" to "RECIPIENT"

    # Send a locked or unlocked news post to a list of recipients:
    Given I send "LOCKED or UNLOCKED" message "MESSAGE" to "RECIPIENTS"

    # Add a comment to a news post containing specific text:
    Given I add comment "COMMENT" to post containing "MESSAGE"

    # Star a news post containing specific text:
    Given I star post containing "MESSAGE"

    # Filter news feed on supplied filter:
    Given I filter news on "FILTER_NAME"


  Scenario: Tasks Methods
    # Click on the supplied task name, use TASK_NAME[INDEX] to click on the 2nd, 3rd, ... record type with the same name:
    Given I click on task "TASK_NAME or TASK_NAME[INDEX]"

    # Click on task report:
    Given I click on task report "TASK_REPORT_NAME"

    # Verify if task is present in the user interface. This is useful for determining if security is applied correctly:
    Given I verify task "TASK_NAME or TASK_NAME[INDEX]" is present

    # Verify if task is not present in the user interface. This is useful for determining if security is applied correctly:
    Given I verify task "TASK_NAME or TASK_NAME[INDEX]" is not present

    # Verify a task with a specific name has a specific deadline (e.g. 1h):
    Given I verify task "TASK_NAME or TASK_NAME[INDEX]" has a deadline of "DEADLINE_TEXT"

    # Accept a task. This will not return an error if task is already accepted:
    Given I accept task

    # Send a task to a recipient from the news message box:
    Given I send task "TASK_MESSAGE" to "RECIPIENT"

    # Close the social task containing supplied text and add a comment:
    Given I close social task containing "MESSAGE" with comment "COMMENT"

    # Verify a social task item containing specific text is not present:
    Given I verify task feed containing text "TASK_TEXT" is not present


  Scenario: Records Methods
    # Click on a record type, use RECORD_NAME[INDEX] to click on the 2nd, 3rd, ... record type with the same name:
    Given I click on record type "RECORD_TYPE_NAME or RECORD_TYPE_NAME[INDEX]"

    # Populate a user filter with a value:
    Given I populate record type user filter "USER_FILTER_NAME" with "USER_FILTER_VALUE"

    # Clear a user filter:
    Given I clear record type user filter "USER_FILTER_NAME"

    # Page through a record grid view. Options include "First", "Previous", "Next", or "Last":
    Given I click on record grid navigation "NAVIGATION_OPTION"

    # Verify a particular record type user filter is present:
    Given I verify record type user filter "USER_FILTER_NAME" is present

    # Verify a record is present:
    Given I verify record "RECORD_NAME or RECORD_NAME[INDEX]" is present

    # Verify a record is not present:
    Given I verify record "RECORD_NAME or RECORD_NAME[INDEX]" is not present

    # Sort a record grid view by column:
    Given I sort record grid by column "COLUMN_NAME"

    # Click on a record. Works for both record list view and record grid view:
    Given I click on record "RECORD_NAME or RECORD_NAME[INDEX] or [INDEX]"

    # Click on a record view:
    Given I click on record view "VIEW_NAME"

    # Click on a related action. Works for quick links and on the related action view:
    Given I click on record related action "RELATED_ACTION_NAME"

    # Verify a record related action is present:
    Given I verify record related action "RELATED_ACTION_NAME" is present

    # Verify a record related action is not present:
    Given I verify record related action "RELATED_ACTION_NAME" is not present


  Scenario: Reports Methods
    # Click on a report, use REPORT_NAME[INDEX] to click on the 2nd, 3rd, ... record type with the same name:
    Given I click on report "REPORT_NAME or REPORT_NAME[INDEX]"

    # Verify a report is present:
    Given I verify report "REPORT_NAME or REPORT_NAME[INDEX]" is present

    # Verify a report is not present:
    Given I verify report "REPORT_NAME or REPORT_NAME[INDEX]" is not present


  Scenario: Actions Methods
    # Click on an action. Use ACTION_NAME[INDEX] to click on the 2nd, 3rd, ... action with the same name:
    Given I click on action "ACTION_NAME or ACTION_NAME[INDEX]"

    # Star an action:
    Given I star action "ACTION_NAME"

    # Verify an action is present:
    Given I verify action "ACTION_NAME or ACTION_NAME[INDEX]" is present

    # Verify an action is not present:
    Given I verify action "ACTION_NAME or ACTION_NAME[INDEX]" is not present

    # Click on an actions application filter:
    Given I click on application filter "APP_FILTER"

    # Verify an application is present:
    Given I verify application filter "APPLICATION_NAME" is present

    # Verify an application is not present:
    Given I verify application filter "APPLICATION_NAME" is not present


  Scenario: Interface Methods
    # For populating all types of fields. When populating checkbox, radio, or select fields, [INDICES] can be used.  When populating picker fields the display value must be used:
    Given I populate field "FIELD_LABEL or [INDEX] or FIELD_LABEL[INDEX]" with "VALUE"
    # If the field can accept multiple values, you can specify a list of values to use:
    Given I populate field "FIELD_LABEL or [INDEX] or FIELD_LABEL[INDEX]" with
      | Value 1 |
      | Value 2 |

    # Populate a picker field in the case where the displayed suggestions only partially contain the input. The first suggestion is selected:
    Given I populate picker field "FIELD_LABEL or [INDEX] or FIELD_LABEL[INDEX]" with partially matching suggestions for "VALUE"
    # If the picker field can accept multiple values, you can specify a list of values to use:
    Given I populate picker field "FIELD_LABEL or [INDEX] or FIELD_LABEL[INDEX]" with partially matching suggestions for
      | Value 1 |
      | Value 2 |

    # Populate the 1st, 2nd, 3rd, ... field of a specific type with no label, currently only compatible with FIELD_TYPE(s) of TEXT, PARAGRAPH, and FILE_UPLOAD. WARNING - Integer, Decimal, and Encrypted text fields will be considered as Text fields:
    Given I populate field type "FIELD_TYPE" named "FIELD_LABEL or [INDEX] or FIELD_LABEL[INDEX]" with "VALUE"
    # If the field can accept multiple values, you can specify a list of values to use:
    Given I populate field type "FIELD_TYPE" named "FIELD_LABEL or [INDEX] or FIELD_LABEL[INDEX]" with
      | Value 1 |
      | Value 2 |

    # Populate a field in a section with no label:
    Given I populate field "FIELD_LABEL OR [FIELD_INDEX]" in section "SECTION_NAME" with "VALUE"
    # If the field can accept multiple values, you can specify a list of values to use:
    Given I populate field "FIELD_LABEL OR [FIELD_INDEX]" in section "SECTION_NAME" with
      | Value 1 |
      | Value 2 |

    # Populate a field with placeholder:
    Given I populate field with placeholder "PLACEHOLDER" with "VALUE"
    # If the field can accept multiple values, you can specify a list of values to use:
    Given I populate field with placeholder "PLACEHOLDER" with
      | Value 1 |
      | Value 2 |

    # Populate a field with instructions:
    Given I populate field with instructions "INSTRUCTIONS" with "VALUE"
    # If the field can accept multiple values, you can specify a list of values to use:
    Given I populate field with instructions "INSTRUCTIONS" with
      | Value 1 |
      | Value 2 |

    # Populate a field with tooltip:
    Given I populate field with tooltip "TOOLTIP" with "VALUE"
    # If the field can accept multiple values, you can specify a list of values to use:
    Given I populate field with tooltip "TOOLTIP" with
      | Value 1 |
      | Value 2 |

    # Populate a dropdown field's search box
    Given I populate dropdown "FIELD_LABEL or [INDEX] or FIELD_LABEL[INDEX]" search box with "VALUE"

    # Populate a grid field with a value (Column and Row Numbers should be in square brackets []):
    Given I populate grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" with "VALUE"
    # If the grid field can accept multiple values, you can specify a list of values to use:
    Given I populate grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" with
      | Value 1 |
      | Value 2 |

    # Populate a grid field with a single value:
    Given I populate grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" with value "VALUE"

    # Populate a picker field in a grid cell (Column and Row Numbers should be in square brackets []). This is useful when the picker field suggestions are only a partial match to the input values:
    Given I populate grid "GRID_NAME or GRID[INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" with partially matching picker field suggestions for "VALUE"
    # If the grid field can accept multiple values, you can specify a list of values to use:
    Given I populate grid "GRID_NAME or GRID[INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" with partially matching picker field suggestions for
      | Value 1 |
      | Value 2 |

    # Clear a field:
    Given I clear field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]"

    # Remove a specific value from a picker:
    Given I clear field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" of "VALUE_TO_REMOVE"
    # If field can accept multiple values, you can specify a list of values to remove:
    Given I clear field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" of
      | Value to remove 1 |
      | Value to remove 2 |

    # Verify a tag field is present:
    Given I verify tag field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" is present
    # Verify a tag item is present:
    Given I verify tag item "ITEM_LABEL or [ITEM_INDEX] or ITEM_LABEL[INDEX]" is present
    # Click on a tag field's tag item:
    Given I click on tag field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" tag item "ITEM_LABEL or [ITEM_INDEX] or ITEM_LABEL[INDEX]"
    # Click on a tag item:
    Given I click on tag item "ITEM_LABEL or [ITEM_INDEX] or ITEM_LABEL[INDEX]"

    # Clear a grid field (Column and Row Numbers should be in square brackets []):
    Given I clear grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]"

    # Verify field contains value:
    Given I verify field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" contains "VALUE"
    # If the field can accept multiple values, you can specify a list of values to verify:
    Given I verify field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" contains
      | Value 1 |
      | Value 2 |

    # Verify field is not blank:
    Given I verify field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" is not blank

    # Verify field with placeholder contains value:
    Given I verify field with placeholder "PLACEHOLDER" contains "VALUE"
    # If the field can accept multiple values, you can specify a list of values to verify:
    Given I verify field with placeholder "PLACEHOLDER" contains
      | Value 1 |
      | Value 2 |

    # Verify field with instructions contains value:
    Given I verify field with instructions "INSTRUCTIONS" contains "VALUE"
    # If the field can accept multiple values, you can specify a list of values to verify:
    Given I verify field with instructions "INSTRUCTIONS" contains
      | Value 1 |
      | Value 2 |

    # Verify field with tooltip contains value:
    Given I verify field with tooltip "TOOLTIP" contains "VALUE"
    # If the field can accept multiple values, you can specify a list of values to verify:
    Given I verify field with tooltip "TOOLTIP" contains
      | Value 1 |
      | Value 2 |

    # Verify field in section contains a value:
    Given I verify field "FIELD_LABEL or [FIELD_INDEX]" in section "SECTION_NAME" contains "VALUE"
    # If the field can accept multiple values, you can specify a list of values to verify:
    Given I verify field "FIELD_LABEL or [FIELD_INDEX]" in section "SECTION_NAME" contains
      | Value 1 |
      | Value 2 |

    # Verify field with label is present:
    Given I verify field "FIELD_LABEL or [FIELD_INEDX] or FIELD_LABEL[INDEX]" is present

    # Verify field with label is not present:
    Given I verify field "FIELD_LABEL or [FIELD_INEDX] or FIELD_LABEL[INDEX]" is not present

    # Verify field with label contains a specific validation message:
    Given I verify field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" contains validation message "VALIDATION_MESSAGE"
    # If the field has multiple validation messages, you can specify a list of validation messages to verify:
    Given I verify field "FIELD_LABEL or [FIELD_INDEX] or FIELD_LABEL[INDEX]" contains validation message
      | Value 1 |
      | Value 2 |

    # Verify link containing text is present:
    Given I verify link "LINK_TEXT or LINK_TEXT[INDEX]" is present
    
    # Verify link containing text is not present:
    Given I verify link "LINK_TEXT or LINK_TEXT[INDEX]" is not present

    # Verify link URL contains specific text:
    Given I verify link "LINK_TEXT or LINK_TEXT[INDEX]" URL contains "URL_TEXT"

    # Verify a milestone is at a particular step:
    Given I verify milestone "MILESTONE_LABEL OR MILESTONE_LABEL[INDEX] or [MILESTONE_INDEX]" step is "STEP"

    # Verify a gauge field is at a particular percentage:
    Given I verify gauge field "GAUGE_FIELD_LABEL OR GAUGE_FIELD_LABEL[INDEX] OR [GAUGE_FIELD_INDEX]" percentage is "PERCENTAGE"

    # Verify a stamp field with label is present:
    Given I verify stamp field "STAMP_FIELD_LABEL OR STAMP_FIELD_LABEL[INDEX]" is present

    # Verify a stamp field with label contains text:
    Given I verify stamp field "STAMP_FIELD_LABEL OR STAMP_FIELD_LABEL[INDEX]" contains text "TEXT"

    # Verify button with label is present:
    Given I verify button "BUTTON_NAME or BUTTON_NAME[INDEX]" is present

    # Verify button with label is not present:
    Given I verify button "BUTTON_NAME or BUTTON_NAME[INDEX]" is not present

    # Verify button with label is enabled:
    Given I verify button "BUTTON_NAME or BUTTON_NAME[INDEX]" is enabled

    # Verify button with label is disabled:
    Given I verify button "BUTTON_NAME or BUTTON_NAME[INDEX]" is disabled

    # Verify section with label contains a specific validation message:
    Given I verify section "SECTION_NAME" contains validation message "VALIDATION_MESSAGE"
    # If the section has multiple validation messages, you can specify a list of validation messages to verify:
    Given I verify section "SECTION_NAME" contains validation message
      | Value 1 |
      | Value 2 |

    # Verify a grid field contains a value (Column and Row Numbers should be in square brackets []):
    Given I verify grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" contains "VALUE"
    # If the grid field can accept multiple values, you can specify a list of values to verify:
    Given I verify grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" contains

    # Verify a grid field contains a single value:
    Given I verify grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" contains value "VALUE"

    # Verify if row in grid is selected (Row Numbers should be in square brackets []):
    Given I verify grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" row "[ROW_INDEX]" is selected

    # Verify a grid field is not blank (Column and Row Numbers should be in square brackets []):
    Given I verify grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]" is not blank

    # Verify a box with given label is present:
    Given I verify box "BOX_LABEL" is present

    # Verify a box with given label is not present:
    Given I verify box "BOX_LABEL" is not present

    # Verify a section with given label is present:
    Given I verify section "SECTION_LABEL" is present

    # Verify a section with given label is not present:
    Given I verify section "SECTION_LABEL" is not present

    # Verify a card with given accessibility text is present:
    Given I verify card "CARD_ACCESSIBILITY_TEXT" is present

    # Verify a card with given accessibility text is not present:
    Given I verify card "CARD_ACCESSIBILITY_TEXT" is not present

    # Verify a chart with given label is present:
    Given I verify chart "CHART_LABEL" is present

    # Verify a chart with given label is not present:
    Given I verify chart "CHART_LABEL" is not present

    # Verify a video with given source is present. You can provide a substring of the source:
    Given I verify video "VIDEO_SOURCE or VIDEO_SOURCE[INDEX]" is present

    # Verify a video with given label is not present. You can provide a substring of the source:
    Given I verify video "VIDEO_SOURCE or VIDEO_SOURCE[INDEX]" is not present

    # Verify a web content with given source is present. You can provide a substring of the source:
    Given I verify web content "WEB_CONTENT_SOURCE or WEB_CONTENT_SOURCE[INDEX]" is present

    # Verify a web content with given source is not present. You can provide a substring of the source:
    Given I verify web content "WEB_CONTENT_SOURCE or WEB_CONTENT_SOURCE[INDEX]" is not present

    # Click on the save changes link:
    Given I click on save changes

    # Click on a button:
    Given I click on button "BUTTON_NAME or BUTTON_NAME[INDEX]"

    # Click on a button with tooltip:
    Given I click on button with tooltip "TOOLTIP"

    # Click on a link:
    Given I click on link "LINK_NAME or LINK_NAME[INDEX]"

    # Click on a icon link:
    Given I click on icon link "ALT_TEXT_NAME or ALT_TEXT_NAME[INDEX]"

    # Click on a document image link:
    Given I click on document image link "ALT_TEXT_NAME or ALT_TEXT_NAME[INDEX]"

    # Click on a bar chart with label at bar:
    Given I click on bar chart "CHART_LABEL or CHART_LABEL[INDEX]" bar "[BAR_INDEX]"

    # Click on a column chart with label at column:
    Given I click on column chart "CHART_LABEL or CHART_LABEL[INDEX]" column "[COLUMN_INDEX]"

    # Click on a pie chart with label at pie slice:
    Given I click on pie chart "CHART_LABEL or CHART_LABEL[INDEX]" pie slice "[SLICE_INDEX]"

    # Click on a line chart with label at point:
    Given I click on line chart "CHART_LABEL or CHART_LABEL[INDEX]" point "[POINT_INDEX]"

    # Click on a menu or menu_icon styled record action field and on action
    Given I click on record action field "[INDEX]" menu action "ACTION_NAME or [ACTION_INDEX]"

    # Verify a confirmation dialog header:
    Given I verify confirmation dialog header "HEADER_TEXT" is present

    # Verify a confirmation dialog message:
    Given I verify confirmation dialog message "MESSAGE_TEXT" is present

    # Click on a milestone step:
    Given I click on milestone "MILESTONE_NAME or MILESTONE_NAME[INDEX] or [MILESTONE_INDEX]" step "STEP"

    # Select a radio option:
    Given I click on radio option "RADIO_OPTION or RADIO_OPTION[INDEX]"

    # Check a checkbox option with the given choice label:
    Given I click on checkbox option "CHECKBOX_OPTION or CHECKBOX_OPTION[INDEX]"

    # Click on an image or text link in a grid cell. Useful for clicking the "delete row" X cell to delete a row:
    Given I click on grid "GRID_NAME or GRID_NAME[INDEX] or [GRID_INDEX]" column "COLUMN_NAME or [COLUMN_INDEX]" row "[ROW_INDEX]"

    # Click on the add row link for a grid:
    Given I click on grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" add row link

    # Navigate through pages of a grid. Valid navigations are "first", previous, next, or "last":
    Given I click on grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" navigation "NAV_REFERENCE"

    # Click on a card:
    Given I click on card "CARD_LINK_NAME or CARD_LINK_NAME[INDEX]"

    # Toggle visibility of section:
    Given I toggle section "SECTION_NAME" visibility

    # Toggle visibility of box:
    Given I toggle box "BOX_NAME  or [BOX_INDEX] or BOX_NAME[INDEX]" visibility

    # Select row in grid (Row Numbers should be in square brackets []):
    Given I select grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" row "[ROW_INDEX]"

    # Select all rows in a grid.  Can also be used to de-select all rows:
    Given I select all rows in grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]"

    # Sort grid by column name:
    Given I sort grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" by column "COLUMN_NAME"

    # Return count of rows in an editable or paging grid:
    Given I count grid "GRID_NAME or [GRID_INDEX] or GRID_NAME[INDEX]" rows

    # Verify the signature field with the specified label is present:
    Given I verify signature field "SIGNATURE_FIELD or SIGNATURE_FIELD[INDEX]" is present

    # Click on a signature field:
    Given I click on signature field "SIGNATURE_FIELD or SIGNATURE_FIELD[INDEX]"

    # Draw a signature on the signature panel:
    Given I draw signature

  Scenario: Sites Methods
    # Navigate to an Appian Site:
    Given I navigate to site "SITE_URL"

    # Navigate to specific page on an Appian Site:
    Given I navigate to site "SITE_URL" page "PAGE_URL"

    # Click on an Appian Site page from within a site. Although pages are capitalized on the site, the SITE_PAGE must match what is entered when creating the page:
    Given I click on site page "SITE_PAGE"

    # Open settings menu from a site:
    Given I open settings menu

    # Navigate to the user profile from the sites menu:
    Given I open user profile

    # Navigate to another site from Sites Discoverability menu:
    Given I use discoverability to navigate to "SITE_NAME"


  Scenario: Utility Methods
    # Initialize Selenium Web Driver and open browser. Options include FIREFOX, CHROME, REMOTE_FIREFOX, REMOTE_CHROME:
    Given I setup with "BROWSER_NAME" browser

    # Tear down Selenium Web Driver and close browser:
    Given I tear down

    # Call a web API with a body and return result as a string. User defined by username must have permission to access the web API:
    Given I post web api "WEB_API_ENDPOINT" with body "BODY" with username "USERNAME"

    # Call a web API with a body and return result as a string. User defined by role must have permission to access the web API:
    Given I post web api "WEB_API_ENDPOINT" with body "BODY" with role "ROLE_NAME"

    # Set the default Appian URL:
    Given I set appian url to "APPIAN_URL"

    # Set the default Appian version:
    Given I set appian version to "APPIAN_VERSION"

    # Set the Appian locale used for date and datetime formatting, options include en_US or en_GB (defaults to en_US):
    Given I set appian locale to "APPIAN_LOCALE"

    # Used as relative datetime for date/time fields:
    Given I set start datetime

    # Used as the wait timeout in between each command:
    Given I set timeout seconds to "TIMEOUT_SECONDS"

    # Set the folder where screenshots will be saved. This will create new folders if necessary. Terminate path with "/" to ensure folder creation (Defaults to ${automated.testing.home}/screenshots/):
    Given I set screenshot path to "SCREENSHOT_PATH"

    # Take screenshots for every failed test case if provided value is true (Default true):
    Given I set take error screenshots to "SCREENSHOT_BOOLEAN"

    # Stop Cucumber test on any error if provided value is true (Default false):
    Given I set stop on error to "STOP_ON_ERROR_BOOLEAN"

    # Set a test variable with a value. The variable can then be accessed by using tv!VARIABLE_NAME:
    Given I set test variable "VARIABLE_NAME" with "VALUE"

    # Take a screenshot and name the file (do not include the extension):
    Given I take screenshot "FILE_NAME"

    # Login to the given Appian URL with a username and the associated password for the user provided in the configs/user.properties file:
    Given I login to url "APPIAN_URL" with username "USERNAME"
    
    # Login to the previously set Appian URL with a username and the associated password for the user provided in the configs/user.properties file:
    Given I login with username "USERNAME"

    # Login to the given Appian URL with a username/password that has an associated role provided in the configs/user.properties file:
    Given I login to url "APPIAN_URL" with role "USER_ROLE"
    
    # Login to the previously set Appian URL with a username/password that has an associated role provided in the configs/user.properties file:
    Given I login with role "USER_ROLE"

    # Login to the previously set Appian URL with the given username and password
    Given I login with username "USERNAME" and password "PASSWORD"

    # Login to the previously set Appian URL, containing terms and conditions, with the given username and password:
    Given I login with terms with username "USERNAME" and password "PASSWORD"

    # Login to the previously set Appian URL, containing terms and conditions, with the given username and the associated password provided in the configs/user.properties file:
    Given I login with terms with username "USERNAME"

    # Login to the previously set Appian URL containing terms and conditions, with a username/password that has an associated role provided in the configs/user.properties file:
    Given I login with terms with role "USER_ROLE"

    # Wait for relative amount of time (e.g. +1 days, +1 hours):
    Given I wait for "RELATIVE_PERIOD"

    # Wait until relative time (e.g. 2018-01-11 12:31):
    Given I wait until "RELATIVE_PERIOD"

    # Wait for a certain amount of seconds (e.g. 2 seconds, 6 seconds):
    Given I wait for "SECONDS" seconds

    # Wait for a certain amount of minutes (e.g. 2 minutes, 6 minutes):
    Given I wait for "MINUTES" minutes

    # Wait for working based on the settings:
    Given I wait for working

    # Wait for progress bar:
    Given I wait for progress bar

    # Resize the browser window:
    Given I resize window width "WIDTH" height "HEIGHT"

    # Click on x and y coordinates on the monitor
    Given I click on x and y coordinates on the monitor

    # Open a particular URL, useful for logging in if using SSO:
    Given I open "URL"

    # Refresh screen:
    Given I refresh

    # Logout of Appian site:
    Given I logout

    # Verify if text is present anywhere in the user interface:
    Given I verify text "TEXT_ON_INTERFACE" is present
    
    # Verify if text is not present anywhere in the user interface:
    Given I verify text "TEXT_ON_INTERFACE" is not present
