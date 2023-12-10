package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.junit.Assert;
import utilities.ReusableMethods;

import java.util.HashMap;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static stepdefinitions.API_UserStepdefinitions.fullPath;

public class API_AdminStepdefinitions {
    Response response;
    HashMap reqBody;

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
        Assert.assertTrue(ReusableMethods.tryCatchGet("admin").contains("status code: 400"));
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
        ReusableMethods.postResponse("user", reqBody);
    }

    @And("The API user prepares a POST request containing the name data to send to the api categories update endpoint")
    public void theAPIUserPreparesAPOSTRequestContainingTheNameDataToSendToTheApiCategoriesUpdateEndpoint() {
        reqBody = new HashMap<>();
        reqBody.put("name", "Car Loan 35");
    }
    //***************************************************************************************************
}
