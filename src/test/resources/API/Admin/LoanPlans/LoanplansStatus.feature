Feature: As an administrator, I want to update the status information of existing loan plans via API connection.

  Scenario Outline:When a valid PATCH request with appropriate authorization credentials and correct data
  (id) in the body is sent to the 'api/loanplans/status/{{id}}' endpoint, it should return a status code
  of 200, and the message in the response body should be "Status changed"

    Given The API user sets "api/loanplans/status/<id>" path parameters
    And The API user records the response from the api loanplans update endpoint with valid authorization information
    #Apı kulanıcısı api loanplans update endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Status changed"

    Examples:
      | id |
      | 21 |

  Scenario: When a PATCH request with valid authorization information and no 'id' is sent to the
  api/loanplans/status/{{id}} endpoint, the returned status code should be 203, and the message
  in the response body should be verified as "No id"

    Given The API user sets "api/loanplans/status" path parameters
    And The API user records the response from the api loanplans update endpoint with valid authorization information
    #Apı kulanıcısı api loanplans update endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a PATCH request with valid authorization information and a non-existent 'id' is
  sent to the api/loanplans/status/{{id}} endpoint, the returned status code should be 203, and the message
  in the response body should be verified as "No plan"

    Given The API user sets "api/loanplans/status/<id>" path parameters
    And The API user records the response from the api loanplans update endpoint with valid authorization information
    #Apı kulanıcısı api loanplans update endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No plan"

    Examples:
      | id  |
      | 456 |


  Scenario Outline: When a PATCH request with invalid authorization information is sent to the
  api/loanplans/status/{{id}} endpoint with a body, the returned status code should be
  401, and the error message in the response body should be verified as "Unauthorized request"

    Given The API user sets "api/loanplans/status/<id>" path parameters
    Then The API user records the response from the api loanplans status endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error information is Unauthorized
    #Api kullanicisi api loanplans status endpointinden donen responsei geçersiz authorization bilgisi ile kaydeder, status codeun 401 ve error bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 21 |


  Scenario Outline: When the loanplans status record is updated via the API, it should be verified by sending
  a GET request to the api/loanplans/details/{{id}} endpoint with the 'updated loan plan' information from
  the response body. This ensures that the record has been successfully updated

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the status information in the response body is <valueStatus>
    #Api kullanicisi response bodydeki status bilgisinin "<valueStatus>" oldugunu dogrular

    Examples:
      | id | valueStatus |
      | 21 | 1           |
