Feature: As an administrator, I want to access the category details of a user with a specified ID via API connection.

  Scenario: When a GET request with valid authorization information and correct data (id) is sent
  to the api/categories/details/{{id}} endpoint, the returned status code should be 200, and the
  response remark should be verified as "success"

    Given The API user sets "api/categories/details/44" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    #Apı kulanıcısı api categories details endpointinden gelen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

  Scenario:When a GET request with valid authorization information and no 'id' is sent to the
  api/categories/details/{{id}} endpoint, the returned status code should be 400, and the response
  message should be verified as "No id"

    Given The API user sets "api/categories/details" path parameters
    Then The API user records the response returned from the api categories details endpoint and verifies that the status code is '400'
    #Api kullanicisi api categories details endpointinden donen responsei kaydeder ve status codeun 400 oldugunu dogrular

  Scenario: When a GET request with valid authorization information and a non-existent 'id' is sent
  to the api/categories/details/{{id}} endpoint, the returned status code should be 400, and the
  response message should be verified as "No category"

    Given The API user sets "api/categories/details/400" path parameters
    Then The API user records the response returned from the api categories details endpoint and verifies that the status code is '400'


  Scenario:When a GET request with invalid authorization information is sent to the
  api/categories/details/{{id}} endpoint, the returned status code should be 401, and
  the error message in the response body should be verified as "Unauthorized request"

    Given The API user sets "api/categories/details/44" path parameters
    And The API user records the response from the api categories details endpoint with invalid authorization information
    Then The API user verifies that the status code is 401


  Scenario Outline:The contents of data (id, name, image, description, status, created_at, updated_at) in the
  response body should be verified

    Given The API user sets "api/categories/details/44" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<name>", "<description>", <status>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | name           | description         | status | created_at                  | updated_at                  |
      | 0         | My first house | bitse de  is bulsak | 1      | 2023-12-10T12:01:05.000000Z | 2023-12-10T12:01:41.000000Z |
