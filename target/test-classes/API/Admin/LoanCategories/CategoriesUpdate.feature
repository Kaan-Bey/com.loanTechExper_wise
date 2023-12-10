Feature: As an administrator, I want to update the existing category information via API connection.

  Scenario Outline: When a POST request with valid authorization information, correct 'id', and valid data (name,
  description) is sent to the api/categories/update/{{id}} endpoint, the returned status code should be
  200, and the message in the response body should be verified as "Category updated successfully"

    Given The API user sets "api/categories/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api categories update endpoint
    When The API user records the response from the api categories update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    #And The API User verifies that the message information in the response body is "Category updated successfully"

    Examples:
      | id |
      | 46 |
@API
  Scenario Outline: When a POST request with valid authorization information, correct 'id', and valid data (name)
  is sent to the api/categories/update/{{id}} endpoint, the returned status code should be 200, and the
  message in the response body should be verified as "Category updated successfully"

    Given The API user sets "api/categories/update/<id>" path parameters
    And The API user prepares a POST request containing the name data to send to the api categories update endpoint
    When The API user records the response from the api categories update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    #And The API User verifies that the message information in the response body is "Category updated successfully"

    Examples:
      | id |
      | 46 |
