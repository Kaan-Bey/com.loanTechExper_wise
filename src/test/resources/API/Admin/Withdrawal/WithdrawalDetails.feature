Feature: As an administrator, I want to be able to access withdrawal details with a specified ID through the API connection.

  Scenario Outline: When a valid GET request is sent to the 'api/withdrawal/details/{{id}}' endpoint with
  proper authorization information and the correct data (id), the expected behavior is that the status code
  in the response is 200, and the response's remark information is confirmed as "success"

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    #Apı kulanıcısı api withdrawal details endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 68 |


  Scenario: When a valid GET request is sent to the 'api/withdrawal/details/{{id}}' endpoint with proper
  authorization information but without including the required (id), the expected behavior is that the
  status code in the response is 203. Additionally, the message information in the response body should
  be confirmed as "No id"

    Given The API user sets "api/withdrawal/details" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid GET request is sent to the 'api/withdrawal/details/{{id}}' endpoint with
  proper authorization information and an (id) that corresponds to a non-existent record, the expected
  behavior is that the status code in the response is 203. Additionally, the message information in the
  response body should be confirmed as "No withdraw."

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No withdraw."

    Examples:
      | id  |
      | 687 |


  Scenario Outline: When an invalid GET request with unauthorized authorization information is sent to the
  'api/withdrawal/details/{{id}}' endpoint, the expected behavior is that the status code in the response
  is 401. Furthermore, the error information in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id |
      | 68 |


  Scenario Outline: The content of the data (id, method_id, user_id, amount, currency, rate, charge, trx,
  final_amount, after_charge, status, admin_feedback, created_at, updated_at) in the response body should
  be verified.

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, <method_id>, <user_id>, "<amount>", "<currency>", "<rate>", "<charge>", "<trx>", "<final_amount>", "<after_charge>", <status>, "<admin_feedback>", "<created_at>", "<updated_at>"

    Examples:
      | id | id | method_id | user_id | amount       | currency | rate       | charge       | trx          | final_amount | after_charge | status | admin_feedback | created_at                  | updated_at                  |
      | 68 | 68 | 9         | 64      | 300.00000000 | USD      | 1.00000000 | 215.00000000 | TAAB1R3Q6824 | 85.00000000  | 85.00000000  | 3      | don't approved | 2023-12-18T18:48:54.000000Z | 2023-12-18T19:50:19.000000Z |