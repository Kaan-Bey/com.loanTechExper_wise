Feature: As an administrator, I want to be able to reject the loan information of a user with a given ID through the API connection.

  Scenario Outline: When valid authorization information is provided along with a correct (id) and accurate
  data (reason) in the POST body to the 'api/loans/reject/{{id}}' endpoint, the expected status code is 200,
  and the message information in the response body should be verified as "Loan rejected successfully"

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    #Api kullanicisi api loans reject endpointine gondermek icin dogru datalar iceren bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    #Api kullanicisi post request gonderir ve api loans reject endpointinden donen responsei geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan rejected successfully"

    Examples:
      | id |
      | 17 |
