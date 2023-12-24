Feature: As an administrator, I want to access the list of tickets via API connection.

  Scenario: When a GET request with valid authorization information is sent to the 'api/tickets/list'
  endpoint, it should be verified that the returned status code is 200, and the remark information
  in the response indicates "success"

    Given The API user sets "api/tickets/list" path parameters
    And The API user records the response from the api tickets list endpoint with valid authorization information
    #Apı kulanıcısı api tickets list endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request with unauthorized credentials is sent to the
  'api/tickets/list' endpoint, it should return a status code of 401, and the response
  error message should be "Unauthorized request"

    Given The API user sets "api/tickets/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline:Verify the information (user_id, name, email, ticket, subject, status, priority, last_reply,
  created_at, updated_at) returned in the response for Id(x)

    Given The API user sets "api/tickets/list" path parameters
    And The API user records the response from the api tickets list endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | name            | email                    | ticket | subject    | status | priority | last_reply          | created_at                  | updated_at                  |
      | 1         | 4       | Elf F           | elf@gmail.com            | 187898 | Test       | 1      | 3        | 2023-12-15 05:01:30 | 2023-10-16T10:08:01.000000Z | 2023-12-15T10:01:30.000000Z |
      | 4         | 31      | ertugrul kececi | ertugrulkececi@gmail.com | 355496 | Supporting | 1      | 3        | 2023-12-13 19:16:14 | 2023-12-13T23:10:29.000000Z | 2023-12-14T00:16:14.000000Z |