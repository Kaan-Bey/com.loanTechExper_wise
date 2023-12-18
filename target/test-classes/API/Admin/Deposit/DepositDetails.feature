Feature: As an administrator, I want to access information about the installments of a loan with a given ID through the API connection.

  Scenario Outline: When a valid GET request is sent to the 'api/deposit/details/{{id}}' endpoint with proper
  authorization information and the correct data (id), the expected behavior is that the status code in the
  response is 200, and the response's remark information is confirmed as "success"

    Given The API user sets "api/deposit/details/<id>" path parameters
    And The API user records the response from the api deposit details endpoint with valid authorization information
    #Apı kulanıcısı api deposit details endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id  |
      | 101 |
      | 102 |


  Scenario: When a valid GET request is sent to the 'api/deposit/details/{{id}}' endpoint with proper
  authorization information but without including the required (id), the expected behavior is that the status
  code in the response is 203, and the response's message information is confirmed as "No id"

    Given The API user sets "api/deposit/details" path parameters
    And The API user records the response from the api deposit details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid GET request is sent to the 'api/deposit/details/{{id}}' endpoint with proper
  authorization information and an (id) that corresponds to a non-existent record, the expected behavior is
  that the status code in the response is 203. Additionally, the response's message information should be
  confirmed as "No deposit."

    Given The API user sets "api/deposit/details/<id>" path parameters
    And The API user records the response from the api deposit details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No deposit."

    Examples:
      | id  |
      | 879 |


  Scenario Outline: When an invalid GET request with unauthorized authorization information is sent to the
  'api/deposit/details/{{id}}' endpoint, the expected behavior is that the status code in the response is 401.
  Furthermore, the error information in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/deposit/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 101 |


  Scenario Outline: The content of the data fields (id, user_id, method_code, amount, method_currency, charge,
  rate, final_amo, btc_amo, btc_wallet, trx, payment_try, status, from_api, admin_feedback, created_at,
  updated_at) in the response body should be verified

    Given The API user sets "api/deposit/details/<id>" path parameters
    And The API user records the response from the api deposit details endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, <user_id>, <method_code>, "<amount>", "<method_currency>", "<charge>", "<rate>", "<final_amo>", "<btc_amo>", "<trx>", <payment_try>, <status>, <from_api>, "<admin_feedback>", "<created_at>", "<updated_at>"

    Examples:
      | id  | id  | user_id | method_code | amount       | method_currency | charge       | rate       | final_amo    | btc_amo | trx          | payment_try | status | from_api | admin_feedback | created_at                  | updated_at                  |
      | 101 | 101 | 8       | 1000        | 400.00000000 | USD             | 108.00000000 | 1.00000000 | 508.00000000 | 0       | FJFXCJ7TW6BQ | 0           | 3      | 0        | \"rejected\"   | 2023-12-17T20:28:50.000000Z | 2023-12-17T21:46:22.000000Z |
      | 102 | 102 | 8       | 1000        | 500.00000000 | USD             | 110.00000000 | 1.00000000 | 610.00000000 | 0       | 5PAC4DHU1J4V | 0           | 3      | 0        | \"rejected\"   | 2023-12-17T20:29:05.000000Z | 2023-12-17T21:43:14.000000Z |
