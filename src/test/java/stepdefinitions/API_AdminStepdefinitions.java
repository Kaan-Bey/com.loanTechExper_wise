package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import utilities.ReusableMethods;

import java.util.HashMap;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static junit.framework.TestCase.assertEquals;
import static org.junit.Assert.*;
import static stepdefinitions.API_UserStepdefinitions.fullPath;

public class API_AdminStepdefinitions {
    Response response;
    HashMap reqBody;
    JsonPath jsonPath;

    //********************************* api/categories/list *************************************************
    @Given("The API user saves the response from the api categories list endpoint with the valid authorization information")
    public void the_apı_user_saves_the_response_from_the_api_categories_list_endpoint_with_the_valid_authorization_information() {
        ReusableMethods.getResponse("admin");
    }

    @And("The API user saves the response from the api categories list endpoint with invalid authorization information")
    public void theAPIUserSavesTheResponseFromTheApiCategoriesListEndpointWithInvalidAuthorizationInformation() {
        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .headers("Authorization", "Bearer " + "user")
                .when()
                .get(fullPath);
        response.prettyPrint();
    }
    //***************************************************************************************************

    //********************************* api/categories/details/{{id}} ***********************************
    @And("The API user records the response from the api categories details endpoint with the valid authorization information")
    public void theAPIUserRecordsTheResponseFromTheApiCategoriesDetailsEndpointWithTheValidAuthorizationInformation() {
        ReusableMethods.getResponse("admin");
    }

    @Then("The API user records the response returned from the api categories details endpoint and verifies that the status code is '400'")
    public void theAPIUserRecordsTheResponseReturnedFromTheApiCategoriesDetailsEndpointAndVerifiesThatTheStatusCodeIs() {
        assertTrue(ReusableMethods.tryCatchGet("admin").contains("status code: 400"));
    }

    @And("The API user records the response from the api categories details endpoint with invalid authorization information")
    public void theAPIUserRecordsTheResponseFromTheApiCategoriesDetailsEndpointWithInvalidAuthorizationInformation() {
        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .headers("Authorization", "Bearer " + "user")
                .when()
                .get(fullPath);
        response.prettyPrint();
    }
    //***************************************************************************************************

    //********************************* api/categories/add **********************************************
    @And("The API user prepares a POST request containing the correct data to send to the api categories add endpoint")
    public void theAPIUserPreparesAPOSTRequestContainingTheCorrectDataToSendToTheApiCategoriesAddEndpoint() {
        reqBody = new HashMap<>();
        reqBody.put("name", "Car Loan");
        reqBody.put("description", "If you want to buy a car, this loan is for you.");
    }

    @When("The API user records the response from the api categories add endpoint with valid authorization information")
    public void theAPIUserRecordsTheResponseFromTheApiCategoriesAddEndpointWithValidAuthorizationInformation() {
        ReusableMethods.postResponse("admin", reqBody);
    }

    @And("The API user prepares a POST request with incomplete data to send to the api categories add endpoint")
    public void theAPIUserPreparesAPOSTRequestWithIncompleteDataToSendToTheApiCategoriesAddEndpoint() {
        reqBody = new HashMap<>();
        reqBody.put("description", "If you want to buy a car, this loan is for you.");
    }

    @And("The API user prepares a POST request without data to send to the api categories add endpoint")
    public void theAPIUserPreparesAPOSTRequestWithoutDataToSendToTheApiCategoriesAddEndpoint() {
        reqBody = new HashMap<>();
    }
    //***************************************************************************************************

    //********************************* api/categories/update/{{id}} ************************************
    @And("The API user prepares a POST request containing the correct data to send to the api categories update endpoint")
    public void theAPIUserPreparesAPOSTRequestContainingTheCorrectDataToSendToTheApiCategoriesUpdateEndpoint() {
        reqBody = new HashMap<>();
        reqBody.put("name", "Home Loan 2");
        reqBody.put("description", "Updated loan description.");
    }

    @When("The API user records the response from the api categories update endpoint with valid authorization information")
    public void theAPIUserRecordsTheResponseFromTheApiCategoriesUpdateEndpointWithValidAuthorizationInformation() {
        ReusableMethods.postResponse("admin", reqBody);
    }

    @And("The API user prepares a POST request containing the name data to send to the api categories update endpoint")
    public void theAPIUserPreparesAPOSTRequestContainingTheNameDataToSendToTheApiCategoriesUpdateEndpoint() {
        reqBody = new HashMap<>();
        reqBody.put("name", "Car Loan 35");
    }

    @And("The API user prepares a POST request without data to send to the api categories update endpoint")
    public void theAPIUserPreparesAPOSTRequestWithoutDataToSendToTheApiCategoriesUpdateEndpoint() {
        reqBody = new HashMap<>();
    }

    @And("The API user verifies that the name information in the response body is {string}")
    public void theAPIUserVerifiesThatTheNameInformationInTheResponseBodyIs(String valueName) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(valueName, jsonPath.getString("data[0].name"));
    }
    //***************************************************************************************************

    //********************************* api/categories/status/{{id}} ************************************
    @And("The API user records the response from the api categories status endpoint with valid authorization information")
    public void theAPIUserRecordsTheResponseFromTheApiCategoriesStatusEndpointWithValidAuthorizationInformation() {
        ReusableMethods.patchResponse("admin");
    }

    @And("The API user records the response returned from the api categories status endpoint and verifies that the status code is '400'")
    public void theAPIUserRecordsTheResponseReturnedFromTheApiCategoriesStatusEndpointAndVerifiesThatTheStatusCodeIs() {
        assertTrue(ReusableMethods.tryCatchPatch("admin").contains("status code: 400"));
    }

    @And("The API user verifies that the status information in the response body is {string}")
    public void theAPIUserVerifiesThatTheStatusInformationInTheResponseBodyIs(String valueStatus) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(valueStatus, jsonPath.getString("data[0].status"));
    }
    //***************************************************************************************************

    //********************************* api/categories/delete/{{id}} ************************************
    @And("The API user records the response from the api categories delete endpoint with valid authorization information")
    public void theAPIUserRecordsTheResponseFromTheApiCategoriesDeleteEndpointWithValidAuthorizationInformation() {
        ReusableMethods.deleteResponse("admin");
    }

    @Then("The API user records the response returned from the api categories delete endpoint and verifies that the status code is '400'")
    public void theAPIUserRecordsTheResponseReturnedFromTheApiCategoriesDeleteEndpointAndVerifiesThatTheStatusCodeIs() {
        assertTrue(ReusableMethods.tryCatchDelete("admin").contains("status code: 400"));
    }
    //***************************************************************************************************

    //************************************** api/loanplans/list *****************************************
    @And("The API user records the response from the api loanplans list endpoint with valid authorization information")
    public void theAPIUserRecordsTheResponseFromTheApiLoanplansListEndpointWithValidAuthorizationInformation() {
        ReusableMethods.getResponse("admin");
    }

    @Then("Verify the information of the one with the index {int} in the API user response body: {int}, {int}, {string}, {string}, {string}, {string}, {string}, {int}, {int}, {string}, {string}, {string}, {int}, {string}, {string}, {int}, {int}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_index_in_the_apı_user_response_body(int dataIndex, int category_id, int form_id, String name, String title, String minimum_amount, String maximum_amount, String per_installment, int installment_interval, int total_installment, String application_fixed_charge, String application_percent_charge, String instruction, int delay_value, String fixed_charge, String percent_charge, int is_featured, int status, String created_at, String updated_at) {
        jsonPath=ReusableMethods.response.jsonPath();

        assertEquals(category_id,jsonPath.getInt("data["+dataIndex+"].category_id"));
        assertEquals(form_id,jsonPath.getInt("data["+dataIndex+"].form_id"));
        assertEquals(name,jsonPath.getString("data["+dataIndex+"].name"));
        assertEquals(title,jsonPath.getString("data["+dataIndex+"].title"));
        assertEquals(minimum_amount,jsonPath.getString("data["+dataIndex+"].minimum_amount"));
        assertEquals(maximum_amount,jsonPath.getString("data["+dataIndex+"].maximum_amount"));
        assertEquals(per_installment,jsonPath.getString("data["+dataIndex+"].per_installment"));
        assertEquals(installment_interval,jsonPath.getInt("data["+dataIndex+"].installment_interval"));
        assertEquals(total_installment,jsonPath.getInt("data["+dataIndex+"].total_installment"));
        assertEquals(application_fixed_charge,jsonPath.getString("data["+dataIndex+"].application_fixed_charge"));
        assertEquals(application_percent_charge,jsonPath.getString("data["+dataIndex+"].application_percent_charge"));
        assertEquals(instruction,jsonPath.getString("data["+dataIndex+"].instruction"));
        assertEquals(delay_value,jsonPath.getInt("data["+dataIndex+"].delay_value"));
        assertEquals(fixed_charge,jsonPath.getString("data["+dataIndex+"].fixed_charge"));
        assertEquals(percent_charge,jsonPath.getString("data["+dataIndex+"].percent_charge"));
        assertEquals(is_featured,jsonPath.getInt("data["+dataIndex+"].is_featured"));
        assertEquals(status,jsonPath.getInt("data["+dataIndex+"].status"));
        assertEquals(created_at,jsonPath.getString("data["+dataIndex+"].created_at"));
        assertEquals(updated_at,jsonPath.getString("data["+dataIndex+"].updated_at"));
    }
    //***************************************************************************************************

    //************************************** api/loanplans/details{{id}} ********************************
    @And("The API user records the response from the api loanplans details endpoint with valid authorization information")
    public void theAPIUserRecordsTheResponseFromTheApiLoanplansDetailsEndpointWithValidAuthorizationInformation() {
        ReusableMethods.getResponse("admin");
    }

    @Then("The API user records the response returned from the api loanplans details endpoint and verifies that the status code is '400'")
    public void theAPIUserRecordsTheResponseReturnedFromTheApiLoanplansDetailsEndpointAndVerifiesThatTheStatusCodeIs() {
        assertTrue(ReusableMethods.tryCatchGet("admin").contains("status code: 400"));
    }
    //***************************************************************************************************
}
