Feature: As an administrator, I want to access the list of loan plans via API connection.

  Scenario: When a GET request with valid authorization information is sent to the api/loanplans/list
  endpoint, the returned status code should be 200, and the response remark should be verified as "success"

    Given The API user sets "api/loanplans/list" path parameters
    And The API user records the response from the api loanplans list endpoint with valid authorization information
    #Apı kulanıcısı api loanplans list endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When a GET request with invalid authorization information is sent to the
  api/loanplans/list endpoint, the returned status code should be 401, and the error message
  in the response should be verified as "Unauthorized request"

    Given The API user sets "api/loanplans/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the entity with id(x) (category_id, form_id,
  name, title, minimum_amount, maximum_amount, per_installment, installment_interval, total_installment,
  application_fixed_charge, application_percent_charge, instruction, delay_value, fixed_charge, percent_charge,
  is_featured, status, created_at, updated_at, id, name, image, description, status, created_at, updated_at)

    Given The API user sets "api/loanplans/list" path parameters
    And The API user records the response from the api loanplans list endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <category_id>, <form_id>, "<name>", "<title>", "<minimum_amount>", "<maximum_amount>", "<per_installment>", <installment_interval>, <total_installment>, "<application_fixed_charge>", "<application_percent_charge>", "<instruction>", <delay_value>, "<fixed_charge>", "<percent_charge>", <is_featured>, <status>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | category_id | form_id | name      | title     | minimum_amount | maximum_amount | per_installment | installment_interval | total_installment | application_fixed_charge | application_percent_charge | instruction | delay_value | fixed_charge | percent_charge | is_featured | status | created_at                  | updated_at                  |
      | 2         | 1           | 41      | Test Loan | Test Loan | 3000.00000000  | 30000.00000000 | 7.00            | 24                   | 24                | 200.00000000             | 12.00000000                | <br>        | 2           | 15.00000000  | 250.00000000   | 1           | 1      | 2023-12-14T10:49:20.000000Z | 2023-12-14T10:54:23.000000Z |
