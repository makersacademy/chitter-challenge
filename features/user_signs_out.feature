Feature: a user can sign out
As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

  Scenario: signing out
    Given I am on the homepage
    When I follow "Sign up"
    And I fill in "email" with "peter@test"
    And I fill in "name" with "Peter Smith"
    And I fill in "password" with "test"
    And I fill in "password_confirmation" with "test"
    And I fill in "username" with "Peter"
    And I press "Sign up"
    When I press "Sign out"
    Then I should see "Goodbye!"