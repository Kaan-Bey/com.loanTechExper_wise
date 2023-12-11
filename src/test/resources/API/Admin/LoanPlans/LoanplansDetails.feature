Feature: As an administrator, I want to access the loan plan details of a user with a specified ID via API connection.

  Scenario Outline: When a GET request with valid authorization information and correct data (id) is sent to
  the api/loanplans/details/{{id}} endpoint, the returned status code should be 200, and the response remark
  should be verified as "success"

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    #Apı kulanıcısı api loanplans details endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 22 |
      | 2  |


  Scenario: When a GET request with valid authorization information and no 'id' is sent to the
  api/loanplans/details/{{id}} endpoint, the returned status code should be 400, and the response
  message should be verified as "No id"

    Given The API user sets "api/loanplans/details" path parameters
    Then The API user records the response returned from the api loanplans details endpoint and verifies that the status code is '400'
    #Api kullanicisi api loanplans details endpointinden donen responsei kaydeder ve status codeun 400 oldugunu dogrular


  Scenario Outline: When a GET request with valid authorization information and a non-existent 'id' is sent to
  the api/loanplans/details/{{id}} endpoint, the returned status code should be 400, and the response message
  should be verified as "No loanplans."

    Given The API user sets "api/loanplans/details/<id>" path parameters
    Then The API user records the response returned from the api loanplans details endpoint and verifies that the status code is '400'

    Examples:
      | id   |
      | 2211 |


  Scenario Outline: The contents of data (id, category_id, form_id, name, title, minimum_amount, maximum_amount,
  per_installment, installment_interval, total_installment, application_fixed_charge, application_percent_charge,
  instruction, delay_value, fixed_charge, percent_charge, is_featured, status, created_at, updated_at) in the
  response body should be verified

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <category_id>, <form_id>, "<name>", "<title>", "<minimum_amount>", "<maximum_amount>", "<per_installment>", <installment_interval>, <total_installment>, "<application_fixed_charge>", "<application_percent_charge>", "<instruction>", <delay_value>, "<fixed_charge>", "<percent_charge>", <is_featured>, <status>, "<created_at>", "<updated_at>"

    Examples:
      | id | dataIndex | category_id | form_id | name         | title       | minimum_amount | maximum_amount | per_installment | installment_interval | total_installment | application_fixed_charge | application_percent_charge | instruction | delay_value | fixed_charge  | percent_charge | is_featured | status | created_at                  | updated_at                  |
      | 22 | 0         | 47          | 33      | QA Education | Education   | 25000.00000000 | 50000.00000000 | 10.00           | 2                    | 12                | 1000.00000000            | 5.00000000                 | <br>        | 2           | 100.00000000  | 5.00000000     | 0           | 1      | 2023-12-11T01:40:09.000000Z | 2023-12-11T01:40:09.000000Z |
      | 2  | 0         | 1           | 4       | Test_Loan    | tittle_loan | 5000.00000000  | 15000.00000000 | 10.00           | 1                    | 36                | 10.00000000              | 10.00000000                | <br>        | 1           | 5000.00000000 | 10.00000000    | 1           | 1      | 2023-11-01T11:52:30.000000Z | 2023-11-01T11:52:30.000000Z |

