Feature: Applaud posts
  In order to give and receive credit for good posts
  As a Maker
  I want to applaud posts and receive applause

  Background:
    Given I block mailgun
    And I sign up
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button

  Scenario: Applaud other person's post
    Then I see "0 applause"
    When I sign out
    And "Fred" signs up
    When I press the "Applaud" button
    Then I see "1 applause"

  Scenario: Cannot applaud post twice
    When I sign out
    And "Fred" signs up
    When I press the "Applaud" button
    Then I don't see the "Applaud" button

  Scenario: Cannot applaud own post
    Then I don't see the "Applaud" button