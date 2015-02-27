Feature: Send a message
  In order to be heard by others
  As a user
  I want to be able to send a message

  Scenario: Send a message
    Given I am on the user page
    And I fill the message space
    When I click on "submit message"
    Then I should see "message sent"