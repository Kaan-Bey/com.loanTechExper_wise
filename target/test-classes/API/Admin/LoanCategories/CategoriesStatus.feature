Feature: As an administrator, I want to update the status information of existing categories via API connection.

  Scenario Outline: When a PATCH request with valid authorization information and correct data (id) is sent
  to the api/categories/status/{{id}} endpoint, the returned status code should be 200, and the message in
  the response body should be verified as "Status changed"

    Given The API user sets "api/categories/status/<id>" path parameters
    And The API user records the response from the api categories status endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Status changed"

    Examples:
      | id |
      | 46 |

  Scenario: When a PATCH request with valid authorization information and no 'id' is sent to the
  api/categories/status/{{id}} endpoint, the returned status code should be 400, and the message
  in the response body should be verified as "No id"

    Given The API user sets "api/categories/status" path parameters
    And The API user records the response from the api categories status endpoint with valid authorization information

    #Then The API user records the response returned from the api categories status endpoint and verifies that the status code is '400'
    #Api kullanicisi api categories status endpointinden donen responsei kaydeder ve status codeun 400 oldugunu dogrular

  Scenario Outline: When a PATCH request with valid authorization information and a non-existent 'id'
  is sent to the api/categories/status/{{id}} endpoint, the returned status code should be 400, and
  the message in the response body should be verified as "No category"

    Given The API user sets "api/categories/status/<id>" path parameters
    Then The API user records the response returned from the api categories status endpoint and verifies that the status code is '400'

    Examples:
      | id  |
      | 466 |

  Scenario Outline: The update of the desired category status record through the API should be verified.
  This can be confirmed by sending a GET request to the api/categories/details/{{id}} endpoint with the
  updated ID returned in the response body to ensure that the status record has been successfully updated

    Given The API user sets "api/categories/details/<id>" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the status information in the response body is "<valueStatus>"
    #Api kullanicisi response bodydeki status bilgisinin "<valueStatus>" oldugunu dogrular

    Examples:
      | id | valueStatus |
      | 46 | 1           |
