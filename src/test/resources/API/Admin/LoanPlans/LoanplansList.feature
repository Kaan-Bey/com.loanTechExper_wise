Feature: As an administrator, I want to access the list of loan plans via API connection.

  Scenario: When a GET request with valid authorization information is sent to the api/loanplans/list
  endpoint, the returned status code should be 200, and the response remark should be verified as "success"

    Given The API user sets "api/loanplans/list" path parameters
    And The API user records the response from the api loanplans list endpoint with valid authorization information
    #Apı kulanıcısı api loanplans list endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario Outline: Verify the information returned in the response for the entity with id(x) (category_id, form_id,
  name, title, minimum_amount, maximum_amount, per_installment, installment_interval, total_installment,
  application_fixed_charge, application_percent_charge, instruction, delay_value, fixed_charge, percent_charge,
  is_featured, status, created_at, updated_at, id, name, image, description, status, created_at, updated_at)

    Given The API user sets "api/loanplans/list" path parameters
    And The API user records the response from the api loanplans list endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <category_id>, <form_id>, "<name>", "<title>", "<minimum_amount>", "<maximum_amount>", "<per_installment>", <installment_interval>, <total_installment>, "<application_fixed_charge>", "<application_percent_charge>", "<instruction>", <delay_value>, "<fixed_charge>", "<percent_charge>", <is_featured>, <status>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | category_id | form_id | name              | title             | minimum_amount | maximum_amount | per_installment | installment_interval | total_installment | application_fixed_charge | application_percent_charge | instruction              | delay_value | fixed_charge | percent_charge | is_featured | status | created_at                  | updated_at                  |
      | 2         | 41          | 30      | First Hause       | house house       | 35000.00000000 | 49999.00000000 | 5.00            | 1                    | 48                | 2500.00000000            | 5.00000000                 | lorem ipsum              | 3           | 1.00000000   | 1.00000000     | 0           | 1      | 2023-12-09T09:42:07.000000Z | 2023-12-10T11:39:34.000000Z |
      | 3         | 8           | 6       | my first car loan | my first car loan | 2023.00000000  | 5000.00000000  | 10.00           | 30                   | 20                | 20.00000000              | 5.00000000                 | Benim canim arabam&nbsp; | 25          | 100.00000000 | 1.00000000     | 0           | 1      | 2023-11-23T08:17:14.000000Z | 2023-12-10T11:41:48.000000Z |