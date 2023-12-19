Feature: As an administrator, I want to be able to access rejected withdrawals through the API connection.

  Scenario: When a valid GET request is sent to the 'api/withdrawal/rejected' endpoint with proper
  authorization information, the expected behavior is that the status code in the response is 200,
  and the response's remark information is confirmed as "success"

    Given The API user sets "api/withdrawal/rejected" path parameters
    And The API user records the response from the api withdrawal rejected endpoint with valid authorization information
    #Apı kulanıcısı api withdrawal rejected endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request is sent to the 'api/withdrawal/rejected' endpoint with unauthorized
  or invalid authorization information, the expected behavior is that the status code in the response is 401.
  Furthermore, the error information in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/withdrawal/rejected" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information in the response for the one with ID(x) (method_id, user_id,
  amount, currency, rate, charge, trx, final_amount, after_charge, status, admin_feedback, created_at,
  updated_at)

    Given The API user sets "api/withdrawal/rejected" path parameters
    And The API user records the response from the api withdrawal rejected endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <method_id>, <user_id>, "<amount>", "<currency>", "<rate>", "<charge>", "<trx>", "<final_amount>", "<after_charge>", <status>, "<admin_feedback>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | method_id | user_id | amount       | currency | rate       | charge       | trx          | final_amount | after_charge | status | admin_feedback | created_at                  | updated_at                  |
      | 0         | 9         | 64      | 300.00000000 | USD      | 1.00000000 | 215.00000000 | TAAB1R3Q6824 | 85.00000000  | 85.00000000  | 3      | don't approved | 2023-12-18T18:48:54.000000Z | 2023-12-18T19:50:19.000000Z |

