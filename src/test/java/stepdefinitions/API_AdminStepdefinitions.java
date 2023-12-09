package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.restassured.response.Response;
import utilities.ReusableMethods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static stepdefinitions.API_UserStepdefinitions.fullPath;

public class API_AdminStepdefinitions {
    Response response;

    //********************************* api/categories/list ***********************************************
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

    //*************************************************************************************************
}
