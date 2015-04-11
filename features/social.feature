Feature: Users can interact
  In order to have a social experience with Chitter
  As a maker
  I want to follow other users and be followed

  Scenario: See specified user's posts on their profile
    Given I sign up
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button
    When I'm on the "users/profiles/joejknowles" page
    Then I see "Hello, world"

  Scenario: I do not see other user's posts
    Given I sign up
    When I fill in "cheep" with "Hello, world!"
    And I press the "Cheep" button
    When I'm on the "users/profiles/joejknowles" page
    Then I see "Hello, world"
    When I sign out
    Given Fred signs up
    When I fill in "cheep" with "Hello, me!"
    And I press the "Cheep" button
    When I'm on the "users/profiles/joejknowles" page
    Then I don't see "Hello, me"