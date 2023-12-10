Feature: As an administrator, I want to access the list of categories via API connection.

  Scenario: When a valid GET request is sent to the 'api/categories/list' endpoint with the
  appropriate authorization credentials, it should return a status code of 200,
  and the response remark should be "success"

    Given The API user sets "api/categories/list" path parameters
    And The API user saves the response from the api categories list endpoint with the valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

  Scenario: When an invalid GET request with unauthorized credentials is sent to the
  'api/categories/list' endpoint, it should return a status code of 401, and
  the response error message should be "Unauthorized request"

    Given The API user sets "api/categories/list" path parameters
    And The API user saves the response from the api categories list endpoint with invalid authorization information
    Then The API user verifies that the status code is 401

  Scenario Outline: Verify the information returned in the response for the entity with id(x) (name, image,
  description, status, created_at, updated_at)

    Given The API user sets "api/categories/list" path parameters
    And The API user saves the response from the api categories list endpoint with the valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<name>", "<description>", <status>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | name  | description | status | created_at                  | updated_at                  |
      | 3         | House | lorem ipsum | 1      | 2023-12-09T09:35:59.000000Z | 2023-12-09T09:35:59.000000Z |

