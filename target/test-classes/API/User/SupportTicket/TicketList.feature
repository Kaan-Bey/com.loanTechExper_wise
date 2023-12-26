Feature: As a user, I want to access the Ticket List through an API connection.
@API
  Scenario: When a GET request is sent to the user/ticket/list endpoint with valid authorization information,
  the returned status code should be 200, and the response remark should be verified as "success".

    Given The API user sets "user/ticket/list" path parameters
    And The API user saves the response from the user ticket list endpoint with valid authorization information
    #Api kullanicisi user ticket list endpointinden donen responsei gecerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    #Api kullanicisi status codeun 200 oldugunu dogrular
    And The API user verifies that the remark information in the response body is "success"
    #Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular


  Scenario: Verify that when a GET request is sent to the 'user/ticket/list' endpoint with invalid
  authorization information, the returned status code is 401, and the error message in the response
  indicates "Unauthorized request"

    Given The API user sets "user/ticket/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the entity with id(x)
  (user_id, name, email, ticket, subject, status, priority, last_reply, created_at, updated_at)

    Given The API user sets "user/ticket/list" path parameters
    And The API user saves the response from the user ticket list endpoint with valid authorization information
    Then Verify the information of the one with the id <dataIndex> in the API user response body: <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | name           | email                   | ticket | subject     | status | priority | last_reply          | created_at                  | updated_at                  |
      | 0         | 11      | aliulvi girgin | aliulvigirgin@gmail.com | 668243 | Test        | 0      | 0        | 2023-12-21 03:32:18 | 2023-12-21T08:32:18.000000Z | 2023-12-21T08:32:18.000000Z |
      | 1         | 11      | aliulvi girgin | aliulvigirgin@gmail.com | 891419 | Test Ticket | 0      | 0        | 2023-12-21 03:28:27 | 2023-12-21T08:28:27.000000Z | 2023-12-21T08:28:27.000000Z |

