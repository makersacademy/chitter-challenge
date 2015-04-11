Feature: signing up a user
  So that I can post messages on Chitter as me
  As a Maker
  I want to be able to log into Chitter

  Scenario: sign up
    Given I am in the sign up section
    When I fill in "username" with "saramoohead"
    And I fill in "real_name" with "Sara OC"
    And I fill in "email" with "saramoo@hotmail.com"
    And I fill in "password" with "password"
    And I click "Register"
    Then I see "Welcome saramoohead."
  
  Scenario: sign in
    Given the user "saramoohead" exists
    And I am on the homepage
    When I fill in "username" with "saramoohead"
    And I fill in "password" with "password"
    And I click "Sign in"
    And the system correctly authenticates my "username" and "password"
    Then I see "Welcome saramoohead."

  Scenario: sign out
    Given I am logged in
    And I see "Welcome saramoohead"
    When I click "Sign out"
    Then I do not see "Welcome saramoohead."
