Feature: As an administrator, I want to access the list of running loans via API connection.

  Scenario: When a valid GET request with appropriate authorization credentials is sent to the
  'api/loans/running' endpoint, it should return a status code of 200, and the response remark
  should be "success"

    Given The API user sets "api/loans/running" path parameters
    And The API user records the response from the api loans running endpoint with valid authorization information
    #Apı kulanıcısı api loans running endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request with unauthorized credentials is sent to the
  'api/loans/running' endpoint, it should return a status code of 401, and the response
  error message should be "Unauthorized request"

    Given The API user sets "api/loans/running" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information (loan_number, user_id, plan_id, amount, per_installment,
  installment_interval, delay_value, charge_per_installment, delay_charge, given_installment,
  total_installment, application_form, admin_feedback, status, due_notification_sent, approved_at,
  created_at, updated_at) returned in the response for Id(x)

    Given The API user sets "api/loans/running" path parameters
    And The API user records the response from the api loans running endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<loan_number>", <user_id>, <plan_id>, "<amount>", "<per_installment>", <installment_interval>, <delay_value>, "<charge_per_installment>", "<delay_charge>", <given_installment>, <total_installment>, <status>, "<approved_at>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | loan_number  | user_id | plan_id | amount        | per_installment | installment_interval | delay_value | charge_per_installment | delay_charge | given_installment | total_installment | status | approved_at                 | created_at                  | updated_at                  |
      | 1         | 2JEZSFBRP8ZE | 62      | 11      | 6000.00000000 | 240.00000000    | 20                   | 25          | 100.04000000           | 0.00000000   | 0                 | 20                | 1      | 2023-12-14T16:22:01.000000Z | 2023-12-14T14:43:05.000000Z | 2023-12-14T16:22:01.000000Z |
