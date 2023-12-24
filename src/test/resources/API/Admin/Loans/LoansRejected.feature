Feature: As an administrator, I want to access the 'api/loans/rejected' endpoint through API connection.

  Scenario: When a GET request is sent to the api/loans/rejected endpoint with valid authorization information,
  it should return a status code of 200, and the response remark should be verified as "success"

    Given The API user sets "api/loans/rejected" path parameters
    And The API user records the response from the api loans rejected endpoint with valid authorization information
    #Apı kulanıcısı api loans rejected endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request with unauthorized credentials is sent to the
  api/loans/rejected endpoint, it should return a status code of 401, and the response
  error message should be verified as "Unauthorized request"

    Given The API user sets "api/loans/rejected" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Validate the information returned in the response for id(x) (loan_number, user_id,
  plan_id, amount, per_installment, installment_interval, delay_value, charge_per_installment,
  delay_charge, given_installment, total_installment, application_form, admin_feedback, status,
  due_notification_sent, approved_at, created_at, updated_at)

    Given The API user sets "api/loans/rejected" path parameters
    And The API user records the response from the api loans rejected endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<loan_number>", <user_id>, <plan_id>, "<amount>", "<per_installment>", <installment_interval>, <delay_value>, "<charge_per_installment>", "<delay_charge>", <given_installment>, <total_installment>, "<admin_feedback>", <status>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | loan_number  | user_id | plan_id | amount        | per_installment | installment_interval | delay_value | charge_per_installment | delay_charge | given_installment | total_installment | admin_feedback | status | created_at                  | updated_at                  |
      | 2         | EUKAGN6DJY5N | 35      | 1       | 1420.00000000 | 42.60000000     | 30                   | 15          | 100.06000000           | 0.00000000   | 0                 | 10                | oke            | 3      | 2023-12-17T15:05:57.000000Z | 2023-12-17T18:23:58.000000Z |
