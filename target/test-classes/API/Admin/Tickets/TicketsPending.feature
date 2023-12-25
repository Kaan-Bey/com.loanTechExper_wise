Feature: As an administrator, I want to access the tickets that are in the 'pending' status via API connection.

  Scenario: When a GET request with valid authorization information is sent to the
  'api/tickets/pending' endpoint, it should be verified that the returned status code
  is 200, and the remark information in the response indicates "success"

    Given The API user sets "api/tickets/pending" path parameters
    And The API user records the response from the api tickets pending endpoint with valid authorization information
    #Apı kulanıcısı api tickets pending endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request with unauthorized credentials is sent to the
  'api/tickets/pending' endpoint, it should return a status code of 401, and the response
  error message should be "Unauthorized request"

    Given The API user sets "api/tickets/pending" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline:Verify the information (user_id, name, email, ticket, subject, status, priority,
  last_reply, created_at, updated_at) returned in the response for Id(x)

    Given The API user sets "api/tickets/pending" path parameters
    And The API user records the response from the api tickets pending endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | name     | email                   | ticket | subject     | status | priority | last_reply          | created_at                  | updated_at                  |
      | 0         | 11      | Ali Dost | aliulvigirgin@gmail.com | 135737 | Test Ticket | 0      | 0        | 2023-12-23 01:18:52 | 2023-12-23T06:18:52.000000Z | 2023-12-23T06:18:52.000000Z |