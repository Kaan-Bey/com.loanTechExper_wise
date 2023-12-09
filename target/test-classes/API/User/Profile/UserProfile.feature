Feature: As a user, I want to be able to update the user profile information in the system through API connection.

  Scenario: When a PATCH request with valid authorization information and correct data
  (firstname, lastname, address, state, zip, city) is sent to the user/profile
  endpoint, the returned status code should be 200, and the message in the
  response body should be verified as "Profile updated successfully"

    Given The API user sets "user/profile" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the user profile endpoint
    When The API user sends a PATCH request and saves the response returned from the user profile endpoint
    Then The API user verifies that the status code is 200
    And The API user verifies that the message information in the response body is "Profile updated successfully"


  Scenario: When a PATCH request with valid authorization information and incomplete data
  (missing address, state, zip, city) is sent to the user/profile endpoint, the
  returned status code should be 422, and the message in the response body should
  be verified as "First name field is required (and 1 more error)"

    Given The API user sets "user/profile" path parameters
    And The API user prepares a PATCH request with missing data to send to the user profile endpoint
    Then The API user saves the response returned from the user profile endpoint and verifies that the status code is '422'
    #Api kullanicisi user profile endpointinden donen responsei kaydeder ve status codeun 422 oldugunu dogrular


  Scenario: When a PATCH request with valid authorization information and no data (firstname, lastname,
  address, state, zip, city) is sent to the user/profile endpoint, the returned status code
  should be 422, and the message in the response body should be verified as "First name field
  is required (and 1 more error)"

    Given The API user sets "user/profile" path parameters
    And The API user prepares a POST request without data to send to the user profile endpoint
    Then The API user saves the response returned from the user profile endpoint and verifies that the status code is '422'

