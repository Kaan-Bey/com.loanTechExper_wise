Feature: As an administrator, I want to create a new category record via API connection.

  Scenario:When a POST request with valid authorization information and correct data (name, description)
  is sent to the api/categories/add endpoint, the returned status code should be 200, and the remark in
  the response body should be verified as "success"

    Given The API user sets "api/categories/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the api categories add endpoint
    #Api kullanicisi api categories add endpointine gondermek icin dogru datalar iceren bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api categories add endpoint with valid authorization information
    #Api kullanicisi post request gonderir ve api categories add endpointinden donen responsei geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

  Scenario: When a POST (name, description) request with valid authorization information and incomplete
  missing data (description) is sent to the api/categories/add endpoint, the returned status code should
  be 400, and the remark in the response body should be verified as "failed"

    Given The API user sets "api/categories/add" path parameters
    And The API user prepares a POST request with incomplete data to send to the api categories add endpoint
    When The API user sends a POST request and records the response returned from the api categories add endpoint with valid authorization information
    Then The API user verifies that the status code is 400
    And The API user verifies that the remark information in the response body is "failed"

  Scenario: When a POST request with valid authorization information and no data (name, description)
  is sent to the api/categories/add endpoint, the returned status code should be 400, and the remark
  in the response body should be verified as "failed"

    Given The API user sets "api/categories/add" path parameters
    And The API user prepares a POST request without data to send to the api categories add endpoint
    When The API user sends a POST request and records the response returned from the api categories add endpoint with valid authorization information
    Then The API user verifies that the status code is 400
    And The API user verifies that the remark information in the response body is "failed"

  Scenario: The creation of a new category record through the API should be verified. This can be
  confirmed by sending a GET request to the api/categories/details/{{id}} endpoint with the Added
  category id returned in the response body

    Given The API user sets "api/categories/details/46" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"