Feature: Cheeping
  In order to keep the world up to date with my fascinating life
  As a maker
  I would like to post cheeps

  Background:
    Given I sign up

  Scenario: User cheeps a cheep
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button
    Then I see "Hello, world!"