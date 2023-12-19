Feature: As an administrator, I want to be able to update the information of registered withdrawal methods in the system through the API connection.

  Scenario Outline: When valid authorization information, correct 'id', and accurate data (name, min_limit,
  max_limit) are sent in a PATCH body to the 'api/withdraw/methods/update/{{id}}' endpoint, it should be
  verified that the returned status code is 200, and the message information in the response body is
  "Withdraw method updated successfully"

    Given The API user sets "api/withdraw/methods/update/<id>" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api withdraw methods update endpoint
    #Api kullanicisi api withdraw methods update endpointine gondermek icin dogru datalar iceren bir patch request hazirlar
    When The API user sends a PATCH request and records the response from the api withdraw methods update endpoint with valid authorization information
    #Api kullanicisi patch request gonderir ve api withdraw methods update endpointinden donen responsei geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Withdraw method updated successfully"

    Examples:
      | id |
      | 23 |