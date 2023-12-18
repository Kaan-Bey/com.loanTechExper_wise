Feature: As an administrator, I want to be able to access pending withdrawals through the API connection.

  Scenario: When a valid GET request is sent to the 'api/withdrawal/pending' endpoint with proper
  authorization information, the expected behavior is that the status code in the response is 200,
  and the response's remark information is confirmed as "success"

