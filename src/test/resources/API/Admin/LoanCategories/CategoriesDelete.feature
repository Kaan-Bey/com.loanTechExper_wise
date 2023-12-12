Feature: As an administrator, I should be able to delete a category record in the system through API connection.

  Scenario Outline: When a DELETE request with valid authorization information and correct 'id' is sent to
  the api/categories/delete/{{id}} endpoint, the returned status code should be 200, and the message in the
  response body should be verified as "category deleted"

    Given The API user sets "api/categories/delete/<id>" path parameters
    And The API user records the response from the api categories delete endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "category deleted"

    Examples:
      | id |
      | 48 |
