Feature: As a user, I want to access the Ticket List through an API connection.

  Scenario: When a GET request is sent to the user/ticket/list endpoint with valid authorization information,
  the returned status code should be 200, and the response remark should be verified as "success".

    Given The API user sets "user/ticket/list" path parameters
    And The API user saves the response returned from the user ticket list endpoint
    #Api kullanicisi user ticket list endpointinden donen responsei kaydeder
    #Api kullanicisi user ticket list endpointinden donen responsei gecerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    #Api kullanicisi status codeun 200 oldugunu dogrular
    And The API user verifies that the remark information in the response body is "success"
    #Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular


  Scenario Outline: Verify the information returned in the response for the entity with id(x)
  (user_id, name, email, ticket, subject, status, priority, last_reply, created_at, updated_at)

    Given The API user sets "user/ticket/list" path parameters
    And The API user saves the response returned from the user ticket list endpoint
    Then Verify the information of the one with the id <dataIndex> in the API user response body: <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | name                | email          | ticket | subject     | status | priority | last_reply          | created_at                  | updated_at                  |
      | 2         | 4       | test_Ozge Last_ozge | ozge@gmail.com | 285884 | Test Ticket | 0      | 0        | 2023-11-25 16:19:55 | 2023-11-25T21:19:55.000000Z | 2023-11-25T21:19:55.000000Z |
