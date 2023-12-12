Feature: As an administrator, I should be able to delete a loan plan record in the system through API connection.

  Scenario Outline:When a valid DELETE request with appropriate authorization credentials and correct data
  (id) is sent to the 'api/loanplans/delete/{{id}}' endpoint, it should return a status code of 200, and
  the message in the response body should be "Loanplans deleted"

    Given The API user sets "api/loanplans/delete/<id>" path parameters
    And The API user records the response from the api loanplans delete endpoint with valid authorization information
    #Apı kulanıcısı api loanplans delete endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loanplans deleted"

    Examples:
      | id |
      | 25 |


  Scenario: When a DELETE request without the required data (id) and with valid authorization credentials
  is sent to the 'api/loanplans/delete/{{id}}' endpoint, it should return a status code of 400, and the
  message in the response body should be "No id"

    Given The API user sets "api/loanplans/delete" path parameters
    And The API user records the response returned from the api loanplans delete endpoint and verifies that the status code is '400'
    #Api kullanicisi api loanplans delete endpointinden donen responsei kaydeder ve status codeun 400 oldugunu dogrular


  Scenario Outline: When a DELETE request with valid authorization credentials and an (id) that does
  not correspond to an existing record is sent to the 'api/loanplans/delete/{{id}}' endpoint,
  it should return a status code of 400, and the message in the response body should be "No loanplans."

    Given The API user sets "api/loanplans/delete/<id>" path parameters
    And The API user records the response returned from the api loanplans delete endpoint and verifies that the status code is '400'

    Examples:
      | id  |
      | 500 |
  @API
  Scenario Outline: The deletion of the desired loan plan record via API should be confirmed by sending
  a GET request to the 'api/loanplans/details/{{id}}' endpoint with the 'Deleted loanplans id' obtained
  from the response body. This verification process ensures that the record has been successfully deleted

    Given The API user sets "api/categories/details/<id>" path parameters
    Then The API user records the response returned from the api categories details endpoint and verifies that the status code is '400'

    Examples:
      | id |
      | 25 |