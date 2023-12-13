Feature: As an administrator, I want to access the list of tickets via API connection.

  Scenario: When a valid GET request with appropriate authorization credentials is sent to the
  'api/tickets/list' endpoint, it should return a status code of 200

    Given The API user sets "api/tickets/list" path parameters
    And The API user records the response from the api tickets list endpoint with valid authorization information
    #Apı kulanıcısı api tickets list endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200


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
      | dataIndex | user_id | name | email | ticket | subject | status | priority | last_reply | created_at | updated_at |