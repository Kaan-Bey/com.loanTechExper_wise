package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.restassured.path.json.JsonPath;
import utilities.ReusableMethods;

import java.util.Arrays;
import static hooks.HooksAPI.spec;
import static junit.framework.TestCase.assertEquals;
import static org.hamcrest.Matchers.equalTo;

public class API_UserStepdefinitions {

    String exceptionMesaj="";
    public static String fullPath;
    JsonPath jsonPath;

    @Given("API user sets {string} path parameters")
    public void apı_user_sets_path_parameters(String rawPaths) {

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
    @Given("The API user saves the response returned from the user ticket list endpoint")
    public void the_apı_user_saves_the_response_returned_from_the_user_ticket_list_endpoint() {
        ReusableMethods.getResponse("user");
    }
    @Then("The API user verifies that the status code is {int}")
    public void theAPIUserVerifiesThatTheStatusCodeIs(int code) {
        ReusableMethods.response.then()
                                   .assertThat()
                                       .statusCode(code);
    }
    @And("The API user verifies that the remark information in the response body is {string}")
    public void theAPIUserVerifiesThatTheRemarkInformationInTheResponseBodyIs(String remark) {
        ReusableMethods.response.then()
                                  .assertThat()
                                     .body("remark", equalTo(remark));
    }
    @Then("Verify the information of the one with the id {int} in the API user response body: {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_id_in_the_apı_user_response_body(int dataIndex, int user_id, String name, String email, String ticket, String subject, int status, int priority, String last_reply, String created_at, String updated_at) {
        jsonPath=ReusableMethods.response.jsonPath();

        assertEquals(user_id,jsonPath.getInt("data["+dataIndex+"].user_id"));
        assertEquals(name,jsonPath.getString("data["+dataIndex+"].name"));
        assertEquals(email,jsonPath.getString("data["+dataIndex+"].email"));
        assertEquals(ticket,jsonPath.getString("data["+dataIndex+"].ticket"));
        assertEquals(subject,jsonPath.getString("data["+dataIndex+"].subject"));
        assertEquals(status,jsonPath.getInt("data["+dataIndex+"].status"));
        assertEquals(priority,jsonPath.getInt("data["+dataIndex+"].priority"));
        assertEquals(last_reply,jsonPath.getString("data["+dataIndex+"].last_reply"));
        assertEquals(created_at,jsonPath.getString("data["+dataIndex+"].created_at"));
        assertEquals(updated_at,jsonPath.getString("data["+dataIndex+"].updated_at"));
    }
    //*************************************************************************************************
}
