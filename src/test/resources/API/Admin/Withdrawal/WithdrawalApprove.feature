Feature: As an administrator, I want to be able to approve the withdrawal information of a user with a given ID through the API connection.

  Scenario Outline: When a valid PATCH request is sent to the 'api/withdrawal/approve/{{id}}' endpoint with
  proper authorization information, the correct (id), and accurate data (details) in the body, the expected
  behavior is that the status code in the response is 200. Additionally, the remark information in the
  response body should be confirmed as "success"

    Given The API user sets "api/withdrawal/approve/<id>" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the api withdrawal approve endpoint
    #Api kullanicisi api withdrawal approve endpointine gondermek icin dogru datalar iceren bir patch request hazirlar
    When The API user sends a PATCH request and records the response returned from the api withdrawal approve endpoint with valid authorization information
    #Api kullanicisi patch request gonderir ve api withdrawal approve endpointinden donen responsei geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 68 |


  Scenario: When a valid PATCH request is sent to the 'api/withdrawal/approve/{{id}}' endpoint with proper
  authorization information but without including the required (id) and with a PATCH body that lacks details,
  the expected behavior is that the status code in the response is 203. Additionally, the message information
  in the response body should be confirmed as "No id"

    Given The API user sets "api/withdrawal/approve" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the api withdrawal approve endpoint
    When The API user sends a PATCH request and records the response returned from the api withdrawal approve endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid PATCH request is sent to the 'api/withdrawal/approve/{{id}}' endpoint with
  proper authorization information and an (id) that corresponds to a non-existent record, along with a PATCH
  body (details), the expected behavior is that the status code in the response is 203. Additionally,
  the message information in the response body should be confirmed as "No withdraw."

    Given The API user sets "api/withdrawal/approve/<id>" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the api withdrawal approve endpoint
    When The API user sends a PATCH request and records the response returned from the api withdrawal approve endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No withdraw."

    Examples:
      | id  |
      | 687 |


  Scenario Outline: When an invalid PATCH request with unauthorized authorization information is sent to the
  'api/withdrawal/approve/{{id}}' endpoint, with the correct (id) and a PATCH body (details), the expected
  behavior is that the status code in the response is 401. Furthermore, the error information in the response
  body should be confirmed as "Unauthorized request"

    Given The API user sets "api/withdrawal/approve/<id>" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the api withdrawal approve endpoint
    Then The API user records the response from the api withdrawal approve endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error information is Unauthorized
    #Api kullanicisi api withdrawal approve endpointinden donen responsei geçersiz authorization bilgisi ile kaydeder, status codeun 401 ve error bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 68 |