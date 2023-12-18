Feature: An administrator (admin) should be able to access the deposit list via the API connection.

  Scenario: When a valid GET request is sent to the 'api/deposit/list' endpoint with proper authorization
  information, the expected behavior is that the status code in the response is 200, and the response's
  remark information is confirmed as "success"

    Given The API user sets "api/deposit/list" path parameters
    And The API user records the response from the api deposit list endpoint with valid authorization information
    #Apı kulanıcısı api deposit list endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request is sent to the 'api/deposit/list' endpoint with unauthorized or
  invalid authorization information, the expected behavior is that the status code in the response is 401,
  and the response's error information is confirmed as "Unauthorized request"

    Given The API user sets "api/deposit/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the one with Id(x)
  (user_id, method_code, amount, method_currency, charge, rate, final_amount, btc_amount,
  btc_wallet, trx, payment_try, status, from_api, admin_feedback, created_at, updated_at)

    Given The API user sets "api/deposit/list" path parameters
    And The API user records the response from the api deposit list endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <user_id>, <method_code>, "<amount>", "<method_currency>", "<charge>", "<rate>", "<final_amo>", "<btc_amo>", "<trx>", <payment_try>, <status>, <from_api>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | method_code | amount        | method_currency | charge       | rate       | final_amo     | btc_amo | trx          | payment_try | status | from_api | created_at                  | updated_at                  |
      | 1         | 22      | 1000        | 4500.00000000 | USD             | 190.00000000 | 1.00000000 | 4690.00000000 | 0       | V4R7WR3UG7VP | 0           | 2      | 0        | 2023-12-17T13:35:08.000000Z | 2023-12-17T13:35:14.000000Z |