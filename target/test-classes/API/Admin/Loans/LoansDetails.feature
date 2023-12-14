Feature: As an administrator, I want to access the loan details information of a user with a specified ID via API connection.
@API
  Scenario Outline: When a valid GET request with appropriate authorization credentials and correct data (id)
  is sent to the 'api/loans/details/{{id}}' endpoint, it should return a status code of 200, and the response
  remark should be "success"

    Given The API user sets "api/loans/details/<id>" path parameters
    And The API user records the response from the api loans details endpoint with valid authorization information
    #Apı kulanıcısı api loans details endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 31 |