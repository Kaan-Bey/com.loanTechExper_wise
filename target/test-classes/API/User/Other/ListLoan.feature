Feature: As a user, I want to access the list of loans via API connection.

  @API
  Scenario: When a valid GET request is sent to the 'user/list/loan' endpoint with the appropriate
  authorization credentials, it should return a status code of 200, and the response remark should be "success"

    Given The API user sets "user/list/loan" path parameters
    And The API user saves the response returned from the user list loan endpoint
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"
