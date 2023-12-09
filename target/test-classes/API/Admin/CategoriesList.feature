Feature: As an administrator, I want to access the list of categories via API connection.

  Scenario: When a valid GET request is sent to the 'api/categories/list' endpoint with the
  appropriate authorization credentials, it should return a status code of 200,
  and the response remark should be "success"

    Given API user sets "api/categories/list" path parameters
    And The API user saves the response from the api categories list endpoint with the valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

  Scenario: When an invalid GET request with unauthorized credentials is sent to the
  'api/categories/list' endpoint, it should return a status code of 401, and
  the response error message should be "Unauthorized request"

    Given API user sets "api/categories/list" path parameters
    And The API user saves the response from the api categories list endpoint with invalid authorization information
    Then The API user verifies that the status code is 401