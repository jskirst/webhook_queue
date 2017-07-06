Feature: Queueing new messages
  As a developer,
  I want to be able to post new messages to webhook_queue,
  So that my messages will be queued for sending.

  Background:
    Given the environment variable ACCESS_TOKEN is set to "ABCD"

  Scenario: System accepts a valid and authorized post and returns 200
    Given I send and accept JSON
    When I send a POST request to "/messages?access_token=ABCD" with the following:
    """
    { "hiphip": "horray" }
    """
    Then the response status should be "201"
    And there should be 1 message
    And the last message should have content: { "hiphip": "horray" }

  Scenario: System rejects a valid but unauthorized post and returns 401
    Given I send and accept JSON
    When I send a POST request to "/messages?access_token=1234" with the following:
    """
    { "hiphip": "horray" }
    """
    Then the response status should be "401"
    And there should be 0 messages

  Scenario: System rejects an invalid but authorized post and returns 400
    When I send a POST request to "/messages?access_token=ABCD" with the following:
    """
    { "hiphip: horray" }
    """
    Then the response status should be "400"
    And there should be 0 messages

  Scenario: System rejects a blank but authorized post and returns 400
    When I send a POST request to "/messages?access_token=ABCD"
    Then the response status should be "400"
    And there should be 0 messages

