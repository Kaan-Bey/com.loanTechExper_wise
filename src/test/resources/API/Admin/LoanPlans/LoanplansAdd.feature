Feature: As an administrator, I want to create a new loan plan record via API connection.
@API
  Scenario: When a POST request with valid authorization information and correct data
  (category_id, name, title, total_installment, installment_interval, per_installment,
  minimum_amount, maximum_amount, delay_value, fixed_charge, percent_charge, is_featured,
  application_fixed_charge, application_percent_charge, instruction) is sent to the
  api/loanplans/add endpoint, the returned status code should be 200, and the remark
  in the response body should be verified as "success"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans add endpoint
    #Api kullanicisi api loanplans add endpointine gondermek icin dogru datalar iceren bir post request hazirlar
    #Apı kulanıcısı api loanplans add endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    When The API user records the response from the api loanplans add endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


