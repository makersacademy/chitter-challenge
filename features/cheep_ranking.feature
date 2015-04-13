Feature: Trending cheeps
  In order to see the most important content
  As a Maker
  I want to see cheeps with the most recent applause

  Background:
    Given I block mailgun
    And I sign up
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button
    When I fill in "cheep" with "Hello, again, world!"
    And I press the "Cheep" button
    When I fill in "cheep" with "Hello,for the last time, world!"
    And I press the "Cheep" button

  Scenario: See most recent before any applauds
    When I'm on the "trending" page
    Then I see "for the", followed by "again"

  Scenario: See most applauded most recently
    When I'm on the "trending" page
    And "Fred" signs up
    And I press the "2"th "Applaud" button
    And "Bob" signs up
    And I press the "2"th "Applaud" button
    And I click link "Trending"
    Then I see "again", followed by "for the"