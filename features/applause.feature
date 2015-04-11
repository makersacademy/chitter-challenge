Feature: Applaud posts
  In order to give and receive credit for good posts
  As a Maker
  I want to applaud posts and receive applause

  Background:
    Given I block mailgun
    And I sign up

  Scenario: Applaud own post
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button
    Then I see "0 applause"
    When I press the "Applaud" button
    Then I see "1 applause"

  Scenario: Cannot applaud post twice
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button
    When I press the "Applaud" button
    Then I don't see the "Applaud" button