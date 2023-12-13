Feature: As an administrator, I want to create a new subscriber record via API connection.

  Scenario: When a valid POST request with appropriate authorization credentials and correct data (email)
  is sent to the 'api/subscriber/add' endpoint, it should return a status code of 200, and the remark in
  the response body should be "success"

    Given The API user sets "api/subscriber/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the api subscriber add endpoint
    #Api kullanicisi api subscriber add endpointine gondermek icin dogru datalar iceren bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api subscriber add endpoint with valid authorization information
    #Api kullanicisi post request gonderir ve api subscriber add endpointinden donen responsei geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When a POST request with valid authorization credentials and incorrect data (email)
  is sent to the 'api/subscriber/add' endpoint, it should return a status code of 203, and the
  remark in the response body should be "failed"

    Given The API user sets "api/subscriber/add" path parameters
    And The API user prepares a POST request with incorrect data to send to the api subscriber add endpoint
    #Api kullanicisi api subscriber add endpointine gondermek icin yanlış data iceren bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api subscriber add endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When a POST request with valid authorization credentials and an empty data (email)
  in the body is sent to the 'api/subscriber/add' endpoint, it should return a status code of 203,
  and the remark in the response body should be "failed"

    Given The API user sets "api/subscriber/add" path parameters
    And The API user prepares a POST request without data to send to the api subscriber add endpoint
    #Api kullanicisi api subscriber add endpointine gondermek icin data içermeyen bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api subscriber add endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When an invalid POST request with unauthorized credentials and a body containing data (email)
  is sent to the 'api/subscriber/add' endpoint, it should return a status code of 401, and the error message
  in the response body should be "Unauthorized request"

    Given The API user sets "api/subscriber/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the api subscriber add endpoint
    When The API user sends a POST request and records the response returned from the api subscriber add endpoint with invalid authorization information
    #Api kullanicisi post request gonderir ve api subscriber add endpointinden donen responsei geçersiz authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"


  Scenario Outline: The creation of the new subscriber record via API should be verified by sending a GET
  request to the 'api/subscriber/details/{{id}}' endpoint with the 'added subscriber id' obtained from the
  response body. This verification process confirms that the record has been successfully created

    Given The API user sets "api/subscriber/details/<id>" path parameters
    And The API user records the response from the api subscriber details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"
    Then The API user verifies that the id information in the response body is <valueId>
    #Api kullanicisi response bodydeki id bilgisinin "<valueId>" oldugunu dogrular

    Examples:
      | id | valueId |
      | 42 | 42      |