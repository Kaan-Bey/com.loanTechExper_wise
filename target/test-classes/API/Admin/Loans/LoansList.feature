Feature: As an administrator, I want to access the list of loans via API connection.

  Scenario: When a valid GET request with appropriate authorization credentials is sent to the
  'api/loans/list' endpoint, it should return a status code of 200, and the response remark should be "success"

    Given The API user sets "api/loans/list" path parameters
    And The API user records the response from the api loans list endpoint with valid authorization information
    #Apı kulanıcısı api loans list endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request with unauthorized credentials is sent to the 'api/loans/list' endpoint,
  it should return a status code of 401, and the response error message should be "Unauthorized request"

    Given The API user sets "api/loans/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information (loan_number, user_id, plan_id, amount, per_installment,
  installment_interval, delay_value, charge_per_installment, delay_charge, given_installment,
  total_installment, admin_feedback, status, due_notification_sent, approved_at,
  created_at, updated_at) returned in the response for Id(x)

    Given The API user sets "api/loans/list" path parameters
    And The API user records the response from the api loans list endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<loan_number>", <user_id>, <plan_id>, "<amount>", "<per_installment>", <installment_interval>, <delay_value>, "<charge_per_installment>", "<delay_charge>", <given_installment>, <total_installment>, <status>, "<approved_at>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | loan_number  | user_id | plan_id | amount        | per_installment | installment_interval | delay_value | charge_per_installment | delay_charge | given_installment | total_installment | status | approved_at                 | created_at                  | updated_at                  |
      | 0         | WCCZ6VQXG3TV | 11      | 15      | 3000.00000000 | 180.00000000    | 20                   | 2           | 100.60000000           | 0.00000000   | 0                 | 20                | 1      | 2023-12-14T15:06:50.000000Z | 2023-12-14T15:06:10.000000Z | 2023-12-14T15:06:50.000000Z |
