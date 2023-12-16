Feature: As an administrator, I want to be able to reject the loan information of a user with a given ID through the API connection.

  Scenario Outline: When valid authorization information is provided along with a correct (id) and accurate
  data (reason) in the POST body to the 'api/loans/reject/{{id}}' endpoint, the expected status code is 200,
  and the message information in the response body should be verified as "Loan rejected successfully"

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    #Api kullanicisi api loans reject endpointine gondermek icin dogru datalar iceren bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    #Api kullanicisi post request gonderir ve api loans reject endpointinden donen responsei geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan rejected successfully"

    Examples:
      | id |
      | 17 |


  Scenario Outline: When valid authorization information is provided along with a correct (id) to the
  'api/loans/reject/{{id}}' endpoint, and the POST body does not contain valid data for the reason,
  the expected status code is 200. Additionally, the message information in the response body should
  be confirmed as "Loan rejected successfully" and the Reason information should be verified as null

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request without data to send to the api loans reject endpoint
    #Api kullanicisi api loans reject endpointine gondermek icin data içermeyen bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan rejected successfully"

    Examples:
      | id |
      | 17 |


  Scenario: When valid authorization information is provided along with a POST body that lacks the required
  (id) parameter (reason) to the 'api/loans/reject/{{id}}' endpoint, the expected status code is 203.
  Furthermore, the message information in the response body should be confirmed as "No id"

    Given The API user sets "api/loans/reject" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When valid authorization information is provided along with a POST body
  containing an invalid (id) for an unregistered record (reason) to the 'api/loans/reject/{{id}}'
  endpoint, the expected status code is 203. Additionally, the message information in the response
  body should be confirmed as "No loan."

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loan."

    Examples:
      | id  |
      | 457 |


  Scenario Outline: When invalid authorization information is provided along with a correct (id) and a
  POST body (reason) to the 'api/loans/reject/{{id}}' endpoint, the expected status code is 401.
  Furthermore, the error message in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with invalid authorization information
    #Api kullanicisi post request gonderir ve api loans reject endpointinden donen responsei geçersiz authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"

    Examples:
      | id |
      | 17 |


  Scenario Outline: The contents of the data (id, loan_number, user_id, plan_id, amount, per_installment,
  installment_interval, delay_value, charge_per_installment, delay_charge, given_installment,
  total_installment, admin_feedback, status, due_notification_sent, approved_at, created_at, updated_at)
  in the response body should be verified

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes "<sorgu>", <id>, "<loan_number>", <user_id>, <plan_id>, "<amount>", "<per_installment>", <installment_interval>, <delay_value>, "<charge_per_installment>", "<delay_charge>", <given_installment>, <total_installment>, "<admin_feedback>", <status>, "<approved_at>", "<created_at>", "<updated_at>"

    Examples:
      | id | sorgu  | id | loan_number  | user_id | plan_id | amount        | per_installment | installment_interval | delay_value | charge_per_installment | delay_charge | given_installment | total_installment | admin_feedback      | status | approved_at                 | created_at                  | updated_at                  |
      | 17 | reject | 17 | H5E646H6D65G | 49      | 11      | 2000.00000000 | 80.00000000     | 20                   | 25          | 100.04000000           | 0.00000000   | 0                 | 20                | Bank info is wrong. | 1      | 2023-12-16T14:20:53.000000Z | 2023-12-14T10:08:15.000000Z | 2023-12-16T14:20:53.000000Z |
