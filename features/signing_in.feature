Feature: as a user
So that I can post messages on Chitter as me
I want to log in to Chitter

  Scenario: A user can log in
    Given I have a Chitter profile
    When I am on the homepage
    And I follow "Log in"
    And I fill in "email" with "peter@test"
    And I fill in "password" with "test"
    And I press "Submit"
    Then I should see "Welcome, Peter"