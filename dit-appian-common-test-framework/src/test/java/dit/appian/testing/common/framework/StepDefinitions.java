package dit.appian.testing.common.framework;

import org.json.JSONObject;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

/**
 * <p>A test method for helloWorld</p>
 */
public class StepDefinitions {
    /**
    * <p>A test method for helloWorld</p>
    */
    @Given("Hello {word}") 
    public void helloWorld(String name){
        System.out.println("Hello " + name);
    }

    /**
     * 
     */
    @Given("I setup tests")
    public void iSetupBrowser() {
        CommonTests.setUp();
    }

    /**
     * 
     */
    @Given("I tear down tests")
    public void iTearDownTests() {
        CommonTests.tearDown();
    }

    /**
     * 
     * @param jsonFileName
     */
    @Given("I populate form with {word}")
    public void iPopulateFormWith(String jsonFileName) {
        jsonFileName = jsonFileName + "." + Constants.JSON.FILE_TYPE;
		Utils.verifyAndClickButton(CommonTests.fixture, Utils.getCreateNewRequestButton());
		CommonTests.fixture.waitForProgressBar();
		JSONObject jsonObject = Utils.parseJson(Tasks.class, jsonFileName);
		Utils.populateFormViaJsonObject(CommonTests.fixture, jsonObject);
		Utils.verifyAndClickButton(CommonTests.fixture, Constants.Buttons.SUBMIT);
    }

}
