Feature: User sign in/out
  In order to manage my account
  As a user
  I want to be able to sign in or out

  Scenario: sign in
    Given I am on the homepage
    And I click on "sign in"
    When I fill in the spaces provided
    Then I should be able to see my username on screen

  Scenario: sign out
    Given I am on the homepage
    When I click "sign out"
    Then I should be logged out
