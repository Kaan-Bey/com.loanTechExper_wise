Feature: As a user, I want to be able to create a new user ticket record through API connection.

  Scenario: When a POST request with valid authorization information and correct data
  (subject, priority, message) is sent to the user/ticket/add endpoint, the
  returned status code should be 200, and the message in the response body
  should be verified as "Ticket opened successfully!"

    Given The API user sets "user/ticket/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the user ticket add endpoint
    #Api kullanicisi user ticket add endpointine gondermek icin dogru datalar iceren bir post request hazirlar
    When The API user sends a POST request and saves the response returned from the user ticket add endpoint
    #Api kullanicisi post request gonderir ve user ticket add endpointinden donen responsei kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the message information in the response body is "Ticket opened successfully!"

  Scenario: When a POST request with valid authorization information and no data
  (subject, priority, message) is sent to the user/ticket/add endpoint,
  the returned status code should be 400, and the remark in the response
  body should be verified as "failed"

    Given The API user sets "user/ticket/add" path parameters
    And The API user prepares a POST request without data to send to the user ticket add endpoint
    When The API user sends a POST request and saves the response returned from the user ticket add endpoint
    Then The API user verifies that the status code is 400
    And The API user verifies that the remark information in the response body is "failed"

  Scenario: When a POST request with valid authorization information and incomplete missing data
  (priority,message) is sent to the user/ticket/add endpoint, the returned status code
  should be 400, and the remark in the response body should be verified as "failed"

    Given The API user sets "user/ticket/add" path parameters
    And The API user prepares a POST request with missing data to send to the user ticket add endpoint.
    When The API user sends a POST request and saves the response returned from the user ticket add endpoint
    Then The API user verifies that the status code is 400
    And The API user verifies that the remark information in the response body is "failed"
