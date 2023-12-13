Feature: As an administrator, I should be able to delete a subscriber record in the system through API connection.

  Scenario Outline: When a valid DELETE request with appropriate authorization credentials and correct (id)
  is sent to the 'api/subscriber/delete/{{id}}' endpoint, it should return a status code of 200, and the
  message in the response body should be "Subscriber deleted successfully"

    Examples:
      | id |
      | 43 |