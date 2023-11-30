package utilities;

import io.restassured.http.ContentType;
import io.restassured.response.Response;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static stepdefinitions.API_UserStepdefinitions.fullPath;

public class ReusableMethods {

    public static Response response;

    public static Response getResponse(String user){

        response = given()
                    .spec(spec)
                    .header("Accept", "application/json")
                    .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                 .when()
                    .get(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response postResponse(String user,Object requestBody) {

        response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .header("Accept", "application/json")
                    .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                 .when()
                    .body(requestBody)
                    .post(fullPath);

        response.prettyPrint();

        return  response;
    }

    public static Response patchResponse(String user,Object requestBody) {

        response = given()
                     .spec(spec)
                     .contentType(ContentType.JSON)
                     .header("Accept", "application/json")
                     .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                 .when()
                     .body(requestBody)
                     .patch(fullPath);

        response.prettyPrint();

        return  response;
    }

    public static Response deleteResponse(String user, Object requestBody){

        response = given()
                     .spec(spec)
                     .contentType(ContentType.JSON)
                     .header("Accept", "application/json")
                     .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                  .when()
                     .body(requestBody)
                     .delete(fullPath);

        response.prettyPrint();

        return response;
    }

}
