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

  Scenario: User's name next to their cheep
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button
    Then I see "joejknowles cheeped:"
    And I see "Hello, world!"

  Scenario: Cheeps show in reverse order
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button
    When I fill in "cheep" with "Hello, again!"
    And I press the "Cheep" button
    And I see "Hello, again!", followed by "Hello, world!"