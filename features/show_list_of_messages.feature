Feature: Show a list of messages in chronological order
  In order to see what others posted before me
  As a user
  I want to be able to see their messages

  Scenario: displaying a list
    Given I am on the homepage
    Then I should be able to see a chronological list of messages