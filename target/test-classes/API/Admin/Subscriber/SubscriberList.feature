Feature: As an administrator, I want to access the list of subscribers via API connection.

  Scenario: When a valid GET request is sent to the 'api/subscriber/list' endpoint with the appropriate
  authorization credentials, it should return a status code of 200, and the response remark should be "success"

    Given The API user sets "api/subscriber/list" path parameters
    And The API user records the response from the api subscriber list endpoint with valid authorization information
    #Apı kulanıcısı api subscriber list endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: "When an invalid GET request with unauthorized credentials is sent to the
  'api/subscriber/list' endpoint, it should return a status code of 401, and the response
  error message should be "Unauthorized request"

    Given The API user sets "api/subscriber/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized
    #Api kullanicisi donen responsei geçersiz authorization bilgisi ile kaydeder, status codeun 401 ve error bilgisinin Unauthorized oldugunu dogrular


  Scenario Outline: Verify the information returned in the response for the entity with id(x) (email, created_at, updated_at)

    Given The API user sets "api/subscriber/list" path parameters
    And The API user records the response from the api subscriber list endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<email>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | email             | created_at                  | updated_at                  |
      | 0         | ayilmaz@gmail.com | 2023-11-20T10:07:12.000000Z | 2023-11-22T07:59:20.000000Z |