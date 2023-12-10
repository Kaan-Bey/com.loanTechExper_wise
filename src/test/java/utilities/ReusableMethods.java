package utilities;

import io.restassured.http.ContentType;
import io.restassured.response.Response;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static stepdefinitions.API_UserStepdefinitions.fullPath;

public class ReusableMethods {

    public static Response response;

    public static Response getResponse(String user) {
        response = given()
                     .spec(spec)
                     .header("Accept", "application/json")
                     .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                 .when()
                     .get(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response postResponse(String user, Object requestBody) {

        response = given()
                     .spec(spec)
                     .contentType(ContentType.JSON)
                     .header("Accept", "application/json")
                     .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                  .when()
                     .body(requestBody)
                     .post(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response patchResponse(String user) {

        response = given()
                     .spec(spec)
                     .contentType(ContentType.JSON)
                     .header("Accept", "application/json")
                     .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                  .when()
                     .patch(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response patchResponseBody(String user, Object requestBody) {

        response = given()
                     .spec(spec)
                     .contentType(ContentType.JSON)
                     .header("Accept", "application/json")
                     .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                  .when()
                     .body(requestBody)
                     .patch(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response deleteResponse(String user) {

        response = given()
                     .spec(spec)
                     .contentType(ContentType.JSON)
                     .header("Accept", "application/json")
                     .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                  .when()
                     .delete(fullPath);

        response.prettyPrint();

        return response;
    }

    public static String tryCatchGet(String user) {
        String exceptionMesaj = null;
        try {
            response = given()
                         .spec(spec)
                         .header("Accept", "application/json")
                         .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                      .when()
                         .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        return exceptionMesaj;
    }

    public static String tryCatchPatch(String user) {
        String exceptionMesaj = null;
        try {
            response = given()
                        .spec(spec)
                        .header("Accept", "application/json")
                        .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                      .when()
                        .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        return exceptionMesaj;
    }

    public static String tryCatchPatchBody(String user, Object requestBody) {
        String exceptionMesaj = null;
        try {
            response = given()
                         .spec(spec)
                         .header("Accept", "application/json")
                         .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                      .when()
                         .body(requestBody)
                         .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        return exceptionMesaj;
    }

    public static String tryCatchDelete(String user) {
        String exceptionMesaj = null;
        try {
            response = given()
                         .spec(spec)
                         .header("Accept", "application/json")
                         .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                     .when()
                         .delete(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        return exceptionMesaj;
    }
}
