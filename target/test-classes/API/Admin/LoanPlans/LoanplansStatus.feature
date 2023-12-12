Feature: As an administrator, I want to update the status information of existing loan plans via API connection.


  Scenario Outline:When a valid PATCH request with appropriate authorization credentials and correct data
  (id) in the body is sent to the 'api/loanplans/status/{{id}}' endpoint, it should return a status code
  of 200, and the message in the response body should be "Status changed"

    Given The API user sets "api/loanplans/update/<id>" path parameters
    And The API user records the response from the api loanplans update endpoint with valid authorization information
    #Apı kulanıcısı api loanplans update endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Status changed"

    Examples:
      | id |
      | 24 |


  Scenario: When a PATCH request with valid authorization information and no 'id' is sent to the
  api/loanplans/status/{{id}} endpoint, the returned status code should be 400, and the message
  in the response body should be verified as "No id"

    Given The API user sets "api/loanplans/update" path parameters
    And The API user records the response from the api loanplans update endpoint with valid authorization information
    #Apı kulanıcısı api loanplans update endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 400
