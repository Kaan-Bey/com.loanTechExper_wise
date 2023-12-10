Feature: As a user, I want to access the user plan through API connection.

  Scenario: When a GET request with valid authorization information is sent to the user/plan endpoint,
  the returned status code should be 200, and the response remark should be verified as "success"

    Given The API user sets "user/plan" path parameters
    And The API user records the response returned from the user plan endpoint
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario Outline: Verify the information returned in the response for the entity with id(x)
  (name, image, description, status, created_at, updated_at)

    Given The API user sets "user/plan" path parameters
    And The API user records the response returned from the user plan endpoint
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<name>", "<description>", <status>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | name       | description | status | created_at                  | updated_at                  |
      | 2         | Basic Loan | Basic Loan  | 1      | 2023-10-16T09:29:44.000000Z | 2023-10-16T09:29:44.000000Z |
