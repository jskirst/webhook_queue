Feature: Sender worker
  As a developer,
  I want messages I've queued with webmock_queue to be sent,
  So that my receiving system gets them.

  Background:
    Given the environment variable RECEIVER_URL is set to "http://example.com"

  Scenario:
    When I listen for POST requests to "http://example.com" with body "XYZ" and return "200"
    And there is a message with the content "XYZ"
    Then I should not see an error when I drain the sender queue
    And there should be 0 messages
    And 1 request should have been made to "http://example.com"

  Scenario:
    When I listen for POST requests to "http://example.com" with body "XYZ" and return "300"
    And there is a message with the content "XYZ"
    Then I should see a "BadResponse" error when I drain the sender queue
    And there should be 1 messages
    And 1 request should have been made to "http://example.com"
