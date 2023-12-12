Feature: As an administrator, I want to access the category details of a user with a specified ID via API connection.

  Scenario Outline: When a GET request with valid authorization information and correct data (id) is sent
  to the api/categories/details/{{id}} endpoint, the returned status code should be 200, and the
  response remark should be verified as "success"

    Given The API user sets "api/categories/details/<id>" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    #Apı kulanıcısı api categories details endpointinden gelen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 44 |


  Scenario Outline:The contents of data (id, name, image, description, status, created_at, updated_at) in the
  response body should be verified

    Given The API user sets "api/categories/details/<id>" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<name>", "<description>", <status>, "<created_at>", "<updated_at>"

    Examples:
      | id | dataIndex | name           | description         | status | created_at                  | updated_at                  |
      | 44 | 0         | My first house | bitse de  is bulsak | 1      | 2023-12-10T12:01:05.000000Z | 2023-12-10T12:01:41.000000Z |
