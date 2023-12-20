Feature: As an administrator, I want to be able to access the blog details information of a user with a given ID through the API connection.

  Scenario Outline: When a GET request with valid authorization information and correct data (id) is sent to
  the 'api/blogs/details/{{id}}' endpoint, it should be verified that the returned status code is 200, and
  the remark information in the response indicates "success"

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    #Apı kulanıcısı api blogs details endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 91 |
      | 92 |


  Scenario: When a GET request with valid authorization information and without the 'id' is sent to the
  'api/blogs/details/{{id}}' endpoint, it should be verified that the returned status code is 203, and
  the message information in the response indicates "No id"

    Given The API user sets "api/blogs/details" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a GET request with valid authorization information and containing a non-existent
  'id' is sent to the 'api/blogs/details/{{id}}' endpoint, it should be verified that the returned status
  code is 203, and the message information in the response indicates "No blog"

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No blog"

    Examples:
      | id  |
      | 911 |


  Scenario Outline: When an invalid authorization information is used to send a GET request to the
  'api/blogs/details/{{id}}' endpoint, it should be verified that the returned status code is 401,
  and the error information in the response body indicates "Unauthorized request"

    Given The API user sets "api/blogs/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id |
      | 91 |


  Scenario Outline: The contents of the data (id, data_keys, has_image, title, description_nic, created_at,
  updated_at) in the response body should be verified

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, "<data_keys>", "<has_image>", "<title>", "<description_nic>", "<image>", "<created_at>", "<updated_at>"

    Examples:
      | id | id | data_keys    | has_image | title                                                             | description_nic | image                       | created_at                  | updated_at                  |
      | 91 | 91 | blog.element | 1         | Small Business Financing: Finding the Right Loan for Your Company | font color      | 6527fea806d261697119912.jpg | 2023-08-03T10:21:44.000000Z | 2023-10-12T14:11:52.000000Z |
      | 92 | 92 | blog.element | 1         | Navigating the Loan Application Process: Dos and Don'ts           | style           | 6527fdcfaefac1697119695.jpg | 2023-08-03T10:24:00.000000Z | 2023-10-12T14:08:15.000000Z |
