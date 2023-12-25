Feature: As an administrator, I want to be able to access approved deposits through the API connection.

  Scenario: When a valid GET request is sent to the 'api/deposit/approved' endpoint with proper
  authorization information, the expected behavior is that the status code in the response is 200,
  and the response's remark information is confirmed as "success"

    Given The API user sets "api/deposit/approved" path parameters
    And The API user records the response from the api deposit approved endpoint with valid authorization information
    #Apı kulanıcısı api deposit approved endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request is sent to the 'api/deposit/approved' endpoint with unauthorized
  or invalid authorization information, the expected behavior is that the status code in the response is 401,
  and the response's error information is confirmed as "Unauthorized request"

    Given The API user sets "api/deposit/approved" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the ID(x) in terms of (user_id,
  method_code, amount, method_currency, charge, rate, final_amount, btc_amount, btc_wallet, trx, payment_try,
  status, from_api, admin_feedback, created_at, updated_at)

    Given The API user sets "api/deposit/approved" path parameters
    And The API user records the response from the api deposit approved endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <user_id>, <method_code>, "<amount>", "<method_currency>", "<charge>", "<rate>", "<final_amo>", "<btc_amo>", "<trx>", <payment_try>, <status>, <from_api>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | method_code | amount        | method_currency | charge       | rate          | final_amo        | btc_amo | trx          | payment_try | status | from_api | created_at                  | updated_at                  |
      | 2         | 31      | 1001        | 1000.00000000 | EUR             | 240.00000000 | 1000.00000000 | 1240000.00000000 | 0       | FYDZN83C49GX | 0           | 1      | 0        | 2023-12-23T18:06:13.000000Z | 2023-12-23T18:06:25.000000Z |
