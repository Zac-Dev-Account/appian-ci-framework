package dit.appian.testing.common.framework;

import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;

@TestMethodOrder(OrderAnnotation.class)

public class Tasks extends CommonTests{

	@Override @Test public void testRequestMoreInformationFlow() {

	}

    @Test public void testPopulateSubmissionForm() {
		/*
		* Concrete implementation of Abstract Test from CommonTests
		*/
		Utils.verifyAndClickButton(fixture, Utils.getCreateNewRequestButton());
		fixture.waitForProgressBar();
		JSONObject jsonObject = Utils.parseJson(Tasks.class, "submitModel.json");
		Utils.populateFormViaJsonObject(fixture, jsonObject);
		Utils.verifyAndClickButton(fixture, Constants.Buttons.SUBMIT);
		
	 }
}