Feature: As a user, I should be able to delete a user ticket record in the system through API connection.

  Scenario: When a DELETE request with valid authorization information and correct 'id' is sent
  to the user/ticket/delete/{{id}} endpoint, the returned status code should be 200,
  and the message in the response body should be verified as "Ticket deleted"

    Given The API user sets "user/ticket/delete/29" path parameters
    And The API user saves the response returned from the user ticket delete endpoint
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Ticket deleted"


  Scenario: When a DELETE request with valid authorization information and no 'id' is sent
  to the user/ticket/delete/{{id}} endpoint, the returned status code should be 400,
  and the message in the response body should be verified as "No id"

    Given The API user sets "user/ticket/delete" path parameters
    Then The API user saves the response returned from the user ticket delete endpoint and verifies that the status code is '400'


  Scenario: When a DELETE request with valid authorization information and a non-existent 'id' is sent
  to the user/ticket/delete/{{id}} endpoint, the returned status code should be 400, and the
  message in the response body should be verified as "No ticket."

    Given The API user sets "user/ticket/delete/298" path parameters
    Then The API user saves the response returned from the user ticket delete endpoint and verifies that the status code is '400'

