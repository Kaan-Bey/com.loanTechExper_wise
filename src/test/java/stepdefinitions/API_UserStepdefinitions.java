package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.path.json.JsonPath;
import org.json.JSONObject;
import org.junit.Assert;
import utilities.ReusableMethods;

import java.util.Arrays;

import static hooks.HooksAPI.spec;
import static junit.framework.TestCase.assertEquals;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertTrue;

public class API_UserStepdefinitions {
    public static String fullPath;
    JsonPath jsonPath;
    JSONObject requestBody;

    @Given("The API user sets {string} path parameters")
    public void the_apı_user_sets_path_parameters(String rawPaths) {
        String[] paths = rawPaths.split("/");

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);
    }

    //********************************* user/ticket/list ***********************************************
    @And("The API user saves the response returned from the user ticket list endpoint")
    public void theAPIUserSavesTheResponseReturnedFromTheUserTicketListEndpoint() {
        ReusableMethods.getResponse("user");
    }

    @Then("The API user verifies that the status code is {int}")
    public void theAPIUserVerifiesThatTheStatusCodeIs(int code) {

        ReusableMethods.response.then()
                .assertThat()
                .statusCode(code);

         /*
         if (ReusableMethods.response != null) {
            ReusableMethods.response.then()
                    .assertThat()
                    .statusCode(code);
        } else {
            System.out.println("aaaaaaaaaaa");
        }
          */
    }

    @And("The API user verifies that the remark information in the response body is {string}")
    public void theAPIUserVerifiesThatTheRemarkInformationInTheResponseBodyIs(String remark) {
        ReusableMethods.response.then()
                .assertThat()
                .body("remark", equalTo(remark));
    }

    @Then("Verify the information of the one with the id {int} in the API user response body: {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_id_in_the_apı_user_response_body(int dataIndex, int user_id, String name, String email, String ticket, String subject, int status, int priority, String last_reply, String created_at, String updated_at) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(user_id, jsonPath.getInt("data[" + dataIndex + "].user_id"));
        assertEquals(name, jsonPath.getString("data[" + dataIndex + "].name"));
        assertEquals(email, jsonPath.getString("data[" + dataIndex + "].email"));
        assertEquals(ticket, jsonPath.getString("data[" + dataIndex + "].ticket"));
        assertEquals(subject, jsonPath.getString("data[" + dataIndex + "].subject"));
        assertEquals(status, jsonPath.getInt("data[" + dataIndex + "].status"));
        assertEquals(priority, jsonPath.getInt("data[" + dataIndex + "].priority"));
        assertEquals(last_reply, jsonPath.getString("data[" + dataIndex + "].last_reply"));
        assertEquals(created_at, jsonPath.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, jsonPath.getString("data[" + dataIndex + "].updated_at"));
    }
    //*************************************************************************************************

    //********************************* user/ticket/add ***********************************************
    @And("The API user prepares a POST request containing the correct data to send to the user ticket add endpoint")
    public void theAPIUserPreparesAPOSTRequestContainingTheCorrectDataToSendToTheUserTicketAddEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("subject", "Test Ticket");
        requestBody.put("priority", "Medium");
        requestBody.put("message", "Test Ticket Message-");
    }

    @When("The API user sends a POST request and saves the response returned from the user ticket add endpoint")
    public void theAPIUserSendsAPOSTRequestAndSavesTheResponseReturnedFromTheUserTicketAddEndpoint() {
        ReusableMethods.postResponse("user", requestBody.toString());
    }

    @And("The API user verifies that the message information in the response body is {string}")
    public void theAPIUserVerifiesThatTheMessageInformationInTheResponseBodyIs(String message) {
        ReusableMethods.response.then()
                .assertThat()
                .body("message", equalTo(message));
    }

    @And("The API user prepares a POST request without data to send to the user ticket add endpoint")
    public void theAPIUserPreparesAPOSTRequestWithoutDataToSendToTheUserTicketAddEndpoint() {
        requestBody = new JSONObject();
    }

    @And("The API user prepares a POST request with missing data to send to the user ticket add endpoint.")
    public void theAPIUserPreparesAPOSTRequestWithMissingDataToSendToTheUserTicketAddEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("subject", "Test Ticket");
    }
    //***********************************************************************************************

    //********************************* user/ticket/close/{{id}} *******************************************
    @And("The API user saves the response returned from the user ticket close endpoint")
    public void theAPIUserSavesTheResponseReturnedFromTheUserTicketCloseEndpoint() {
        ReusableMethods.patchResponse("user");
    }

    //************************************************************************************************

    //********************************* user/ticket/delete/{{id}} *******************************************
    @Given("The API user saves the response returned from the user ticket delete endpoint")
    public void the_apı_user_saves_the_response_returned_from_the_user_ticket_delete_endpoint() {
        ReusableMethods.deleteResponse("user");
    }

    @Then("The API User verifies that the message information in the response body is {string}")
    public void the_apı_user_verifies_that_the_message_information_in_the_response_body_is(String message) {
        ReusableMethods.response.then()
                .assertThat()
                .body("data.message", equalTo(message));
    }

    //*************************************************************************************************

    //********************************* user/profile **************************************************
    @And("The API user prepares a PATCH request containing the correct data to send to the user profile endpoint")
    public void theAPIUserPreparesAPATCHRequestContainingTheCorrectDataToSendToTheUserProfileEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("firstname", "Ali");
        requestBody.put("lastname", "Dost");
        requestBody.put("address", "New York");
        requestBody.put("state", "New York City");
        requestBody.put("zip", "125874");
        requestBody.put("city", "New York City");
    }

    @When("The API user sends a PATCH request and saves the response returned from the user profile endpoint")
    public void theAPIUserSendsAPATCHRequestAndSavesTheResponseReturnedFromTheUserProfileEndpoint() {
        ReusableMethods.patchResponseBody("user", requestBody.toString());
    }

    @And("The API user prepares a PATCH request with missing data to send to the user profile endpoint")
    public void theAPIUserPreparesAPATCHRequestWithMissingDataToSendToTheUserProfileEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("address", "New York");
        requestBody.put("state", "New York City");
        requestBody.put("zip", "125874");
        requestBody.put("city", "New York City");

    }

    @And("The API user prepares a PATCH request without data to send to the user profile endpoint")
    public void theAPIUserPreparesAPATCHRequestWithoutDataToSendToTheUserProfileEndpoint() {
        requestBody = new JSONObject();
    }
    //*********************************************************************************************

    //********************************* user/changepassword ****************************************
    @And("The API user prepares a PATCH request containing the correct data to send to the user change password endpoint")
    public void theAPIUserPreparesAPATCHRequestContainingTheCorrectDataToSendToTheUserChangePasswordEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("current_password", "Oz123123.");
        requestBody.put("password", "{ASd125}");
    }

    @When("The API user sends a PATCH request and saves the response returned from the user change password endpoint")
    public void theAPIUserSendsAPATCHRequestAndSavesTheResponseReturnedFromTheUserChangePasswordEndpoint() {
        ReusableMethods.patchResponseBody("user", requestBody.toString());
    }

    @And("The API user prepares a PATCH request to send to the user change password endpoint with a new password containing only numbers")
    public void theAPIUserPreparesAPATCHRequestToSendToTheUserChangePasswordEndpointWithANewPasswordContainingOnlyNumbers() {
        requestBody = new JSONObject();
        requestBody.put("current_password", "Oz123123.");
        requestBody.put("password", "12345");
    }

    @And("The API user prepares a PATCH request to send to the user change password endpoint with a new password containing at least one uppercase letter, one lowercase letter, and a number")
    public void theAPIUserPreparesAPATCHRequestToSendToTheUserChangePasswordEndpointWithANewPasswordContainingAtLeastOneUppercaseLetterOneLowercaseLetterAndANumber() {
        requestBody = new JSONObject();
        requestBody.put("current_password", "Oz123123.");
        requestBody.put("password", "12345Aa");
    }
    //**********************************************************************************************

    //********************************* user/plan **************************************************
    @And("The API user records the response returned from the user plan endpoint")
    public void theAPIUserRecordsTheResponseReturnedFromTheUserPlanEndpoint() {
        ReusableMethods.getResponse("user");
    }

    @Then("Verify the information of the one with the index {int} in the API user response body: {string}, {string}, {int}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_index_in_the_apı_user_response_body(int dataIndex, String name, String description, int status, String created_at, String updated_at) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(name, jsonPath.getString("data[" + dataIndex + "].name"));
        assertEquals(description, jsonPath.getString("data[" + dataIndex + "].description"));
        assertEquals(status, jsonPath.getInt("data[" + dataIndex + "].status"));
        assertEquals(created_at, jsonPath.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, jsonPath.getString("data[" + dataIndex + "].updated_at"));
        assertEquals(null, jsonPath.get("data[2].image"));
    }
    //************************************************************************************************

    //********************************* user/list/transaction ****************************************
    @And("The API user records the response returned from the user list transaction endpoint")
    public void theAPIUserRecordsTheResponseReturnedFromTheUserListTransactionEndpoint() {
        ReusableMethods.getResponse("user");
    }

    @Then("Verify the information of the one with the index {int} in the API user response body: {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_index_in_the_apı_user_response_body(int dataIndex, int user_id, String amount, String charge, String post_balance, String trx_type, String trx, String details, String remark, String created_at, String updated_at) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(user_id, jsonPath.getInt("data[" + dataIndex + "].user_id"));
        assertEquals(amount, jsonPath.getString("data[" + dataIndex + "].amount"));
        assertEquals(charge, jsonPath.getString("data[" + dataIndex + "].charge"));
        assertEquals(post_balance, jsonPath.getString("data[" + dataIndex + "].post_balance"));
        assertEquals(post_balance, jsonPath.getString("data[" + dataIndex + "].post_balance"));
        assertEquals(trx_type, jsonPath.getString("data[" + dataIndex + "].trx_type"));
        assertEquals(trx, jsonPath.getString("data[" + dataIndex + "].trx"));
        assertEquals(details, jsonPath.getString("data[" + dataIndex + "].details"));
        assertEquals(remark, jsonPath.getString("data[" + dataIndex + "].remark"));
        assertEquals(created_at, jsonPath.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, jsonPath.getString("data[" + dataIndex + "].updated_at"));

    }
    //*************************************************************************************************

    //********************************* user/list/loan ************************************************
    @And("The API user saves the response returned from the user list loan endpoint")
    public void theAPIUserSavesTheResponseReturnedFromTheUserListLoanEndpoint() {
        ReusableMethods.getResponse("user");
    }
    //*************************************************************************************************
}
