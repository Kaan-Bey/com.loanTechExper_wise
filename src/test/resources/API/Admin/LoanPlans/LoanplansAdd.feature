Feature: As an administrator, I want to create a new loan plan record via API connection.

  Scenario: When a POST request with valid authorization information and correct data
  (category_id, name, title, total_installment, installment_interval, per_installment,
  minimum_amount, maximum_amount, delay_value, fixed_charge, percent_charge, is_featured,
  application_fixed_charge, application_percent_charge, instruction) is sent to the
  api/loanplans/add endpoint, the returned status code should be 200, and the remark
  in the response body should be verified as "success"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans add endpoint
    #Api kullanicisi api loanplans add endpointine gondermek icin dogru datalar iceren bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api loanplans add endpoint with valid authorization information
    #Api kullanicisi post request gonderir ve api loanplans add endpointinden donen responsei geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

  Scenario: When a POST request with valid authorization information and incomplete data
  (per_installment, minimum_amount, maximum_amount, delay_value, fixed_charge, percent_charge,
  is_featured, application_fixed_charge, application_percent_charge, instruction) is sent to
  the api/loanplans/add endpoint, the returned status code should be 400, and the remark in
  the response body should be verified as "failed"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request with incomplete data to send to the api loanplans add endpoint
    #Api kullanicisi api loanplans add endpointine gondermek icin eksik datalar iceren bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api loanplans add endpoint with valid authorization information
    Then The API user verifies that the status code is 400
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When a POST request with valid authorization information and no data
  (per_installment, minimum_amount, maximum_amount, delay_value, fixed_charge,
  percent_charge, is_featured, application_fixed_charge, application_percent_charge,
  instruction) is sent to the api/loanplans/add endpoint, the returned status code
  should be 400, and the remark in the response body should be verified as "failed"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request without data to send to the api loanplans add endpoint
    #Api kullanicisi api loanplans add endpointine gondermek icin data icermeyen bir post request hazirlar
    When The API user sends a POST request and records the response returned from the api loanplans add endpoint with valid authorization information
    Then The API user verifies that the status code is 400
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When a POST request with invalid authorization information and a body containing data
  (category_id, name, title, total_installment, installment_interval, per_installment, minimum_amount,
  maximum_amount, delay_value, fixed_charge, percent_charge, is_featured, application_fixed_charge,
  application_percent_charge, instruction) is sent to the api/loanplans/add endpoint, the returned
  status code should be 401, and the error message in the response body should be verified as
  "Unauthorized request"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans add endpoint
    When The API user sends a POST request and records the response returned from the api loanplans add endpoint with invalid authorization information
    #Api kullanicisi post request gonderir ve api loanplans add endpointinden donen responsei geçersiz authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"


  Scenario Outline: The creation of the desired loanplans record through the API should be verified.
  This can be confirmed by sending a GET request to the api/loanplans/details/{{id}} endpoint
  with the added loan plan returned in the response body to ensure that the record has been
  successfully created

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    #Apı kulanıcısı api loanplans details endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"
    Then The API user verifies that the id information at index <index> in the response body is <valueId>

    Examples:
      | id | index | valueId |
      | 27 | 0     | 27      |