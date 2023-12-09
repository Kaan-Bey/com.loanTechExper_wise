Feature: As a user, I want to be able to update the close information of a registered user ticket through API connection.

  Scenario: When a PATCH request with valid authorization information and correct 'id'
  is sent to the user/ticket/close/{{id}} endpoint, the returned status code
  should be 200, and the message in the response body should be verified as
  "Support ticket closed successfully!"

    Given The API user sets "user/ticket/close/27" path parameters
    And The API user saves the response returned from the user ticket close endpoint
    Then The API user verifies that the status code is 200
    And The API user verifies that the message information in the response body is "Support ticket closed successfully!"

  Scenario: When a PATCH request with valid authorization information and no 'id' is
  sent to the user/ticket/close/{{id}} endpoint, the returned status code
  should be 400, and the message in the response body should be verified as "No id"

    Given The API user sets "user/ticket/close" path parameters
    Then The API user saves the response returned from the user ticket list endpoint and verifies that the status code is '400'
      #Api kullanicisi user ticket list endpointinden donen responsei kaydeder ve status codeun 400 oldugunu dogrular

  Scenario: When a PATCH request with valid authorization information and a non-existent 'id'
  is sent to the user/ticket/close/{{id}} endpoint, the returned status code should
  be 400, and the message in the response body should be verified as "No ticket."

    Given The API user sets "user/ticket/close/274" path parameters
    Then The API user saves the response returned from the user ticket list endpoint and verifies that the status code is '400'

