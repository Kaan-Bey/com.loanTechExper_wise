Feature: As a user, I want to access the list of loans via API connection.

  Scenario: When a valid GET request is sent to the 'user/list/loan' endpoint with the appropriate
  authorization credentials, it should return a status code of 200, and the response remark should be "success"

    Given The API user sets "user/list/loan" path parameters
    And The API user saves the response returned from the user list loan endpoint
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

  @API
  Scenario Outline: Verify the information returned in the response for the entity with id(x) (loan_number,
  user_id, plan_id, amount, per_installment, installment_interval, delay_value, charge_per_installment,
  delay_charge, given_installment, total_installment, application_form, admin_feedback, status,
  due_notification_sent, approved_at, created_at, updated_at)

    Given The API user sets "user/list/loan" path parameters
    And The API user saves the response returned from the user list loan endpoint
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<loan_number>", <user_id>, <plan_id>, "<amount>", "<per_installment>", <installment_interval>, <delay_value>, "<charge_per_installment>", "<delay_charge>", <given_installment>, <total_installment>, "<admin_feedback>", <status>, "<approved_at>", "<created_at>", "<updated_at>"

    Examples:
    #(loan_number, user_id, plan_id, amount, per_installment, installment_interval, delay_value, charge_per_installment, delay_charge, given_installment, total_installment, application_form, admin_feedback, status, due_notification_sent, approved_at, created_at, updated_at) dogrulayiniz
