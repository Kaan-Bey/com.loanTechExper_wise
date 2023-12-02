package stepdefinitions;

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
    @Given("API user saves the response from the user ticket list endpoint")
    public void apı_user_saves_the_response_from_the_user_ticket_list_endpoint() {
        ReusableMethods.getResponse("user");
    }
    @Then("API user verifies status code is {int}")
    public void apı_user_verifies_status_code_is(Integer code) {
        ReusableMethods.response.then()
                                   .assertThat()
                                      .statusCode(code);
    }
    @Then("API user verifies that the remark information in the response body is {string}")
    public void apı_user_verifies_that_the_remark_information_in_the_response_body_is(String remark) {
        ReusableMethods.response.then()
                                  .assertThat()
                                      .body("remark", equalTo(remark));
    }

    @Then("API kullanici response bodydeki idsi {int} olanın {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string}, {string}, {string} bilgilerini doğrular")
    public void apı_kullanici_response_bodydeki_idsi_olanın_bilgilerini_doğrular(int dataIndex, int user_id, String name, String email, String ticket, String subject, int status, int priority, String last_reply, String created_at, String updated_at) {
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
