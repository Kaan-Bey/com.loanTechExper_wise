Feature: As an administrator, I should be able to delete a loan record in the system via the API connection.
@API
  Scenario Outline: When a valid DELETE request is sent to the 'api/loans/delete/{{id}}' endpoint with
  proper authorization information and the correct (id), the expected status code is 200. Additionally,
  the message information in the response body should be verified as "Loan deleted"

    Given The API user sets "api/loans/delete/<id>" path parameters
    And The API user records the response from the api loans delete endpoint with valid authorization information
    #Apı kulanıcısı api loans delete endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan deleted"

    Examples:
      | id |
      | 29 |