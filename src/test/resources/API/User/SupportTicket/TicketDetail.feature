Feature: As a user, I want to access the ticket details of a specified user through the API connection using their ID.

  Scenario Outline: Verify that when a GET request with valid authorization information and correct data (id)
  is sent to the 'user/ticket/detail/{{id}}' endpoint, the returned status code is 200, and the success
  information in the response body is "true"

    Given The API user sets "user/ticket/detail/<id>" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    #Apı kulanıcısı user ticket detail endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the success attribute in the response body is true
    #Api kullanicisi response bodydeki success bilgisinin "true" oldugunu dogrular

    Examples:
      | id |
      | 95 |


  Scenario: Verify that when a GET request with valid authorization information and lacking the 'id' is sent
  to the 'user/ticket/detail/{{id}}' endpoint, the returned status code is 203, and the message information
  in the response body is "No id"

    Given The API user sets "user/ticket/detail" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: Verify that when a GET request with valid authorization information and containing an (id)
  that does not exist in the records is sent to the 'user/ticket/detail/{{id}}' endpoint, the returned status
  code is 203, and the message information in the response body is "No ticket."

    Given The API user sets "user/ticket/detail/<id>" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No ticket."

    Examples:
      | id  |
      | 956 |


  Scenario Outline: Verify that when a GET request with invalid authorization information is sent to the
  'user/ticket/detail/{{id}}' endpoint, the returned status code is 401, and the error message in the
  response body is "Unauthorized request"

    Given The API user sets "user/ticket/detail/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id |
      | 95 |


  Scenario Outline: The contents of the data (id, user_id, name, email, ticket, subject, status, priority,
  last_reply, created_at, updated_at) within the response body should be verified

    Given The API user sets "user/ticket/detail/<id>" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    Then The API user verifies that the content of the data field in the response body includes <id>, <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | id | id | user_id | name     | email                   | ticket | subject     | status | priority | last_reply          | created_at                  | updated_at                  |
      | 95 | 95 | 11      | Ali Dost | aliulvigirgin@gmail.com | 297809 | Test Ticket | 0      | 0        | 2023-12-22 07:02:54 | 2023-12-22T12:02:54.000000Z | 2023-12-22T12:02:54.000000Z |
