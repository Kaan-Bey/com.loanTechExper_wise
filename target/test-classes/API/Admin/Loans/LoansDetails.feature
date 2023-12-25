Feature: As an administrator, I want to access the loan details information of a user with a specified ID via API connection.

  Scenario Outline: When a valid GET request with appropriate authorization credentials and correct data (id)
  is sent to the 'api/loans/details/{{id}}' endpoint, it should return a status code of 200, and the response
  remark should be "success"

    Given The API user sets "api/loans/details/<id>" path parameters
    And The API user records the response from the api loans details endpoint with valid authorization information
    #Apı kulanıcısı api loans details endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id  |
      | 364 |


  Scenario: When a GET request with valid authorization credentials and without the required data (id)
  is sent to the 'api/loans/details/{{id}}' endpoint, it should return a status code of 203, and the
  response message should be "No id"

    Given The API user sets "api/loans/details" path parameters
    And The API user records the response from the api loans details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a GET request with valid authorization credentials and an (id) that does not
  correspond to an existing record is sent to the 'api/loans/details/{{id}}' endpoint, it should return
  a status code of 203, and the response message should be "No Loan"

    Given The API user sets "api/loans/details/<id>" path parameters
    And The API user records the response from the api loans details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No Loan"

    Examples:
      | id  |
      | 589 |


  Scenario Outline: When an invalid GET request with unauthorized credentials is sent to the
  'api/loans/details/{{id}}' endpoint, it should return a status code of 401, and the error
  message in the response body should be "Unauthorized request"

    Given The API user sets "api/loans/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 364 |


  Scenario Outline: The contents of the 'data' field (id, loan_number, user_id, plan_id, amount,
  per_installment, installment_interval, delay_value, charge_per_installment, delay_charge,
  given_installment, total_installment, application_form, admin_feedback, status, due_notification_sent,
  approved_at, created_at, updated_at) in the response body should be verified

    Given The API user sets "api/loans/details/<id>" path parameters
    And The API user records the response from the api loans details endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, "<loan_number>", <user_id>, <plan_id>, "<amount>", "<per_installment>", <installment_interval>, <delay_value>, "<charge_per_installment>", "<delay_charge>", <given_installment>, <total_installment>, <status>, "<created_at>", "<updated_at>"

    Examples:
      | id  | id  | loan_number  | user_id | plan_id | amount        | per_installment | installment_interval | delay_value | charge_per_installment | delay_charge | given_installment | total_installment | status | created_at                  | updated_at                  |
      | 364 | 364 | A6J6U8JRQMHQ | 41      | 55      | 2000.00000000 | 60.00000000     | 30                   | 1           | 100.30000000           | 0.00000000   | 0                 | 10                | 0      | 2023-12-23T15:37:06.000000Z | 2023-12-23T15:37:06.000000Z |