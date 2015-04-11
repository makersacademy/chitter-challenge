Feature: signing up a user
  So that I can post messages on Chitter as me
  As a Maker
  I want to be able to log into Chitter

  Scenario: sign up
    Given I am on the homepage
    When I fill in "username" with "saramoohead"
    And I fill in "real_name" with "Sara OC"
    And I fill in "email" with "saramoo@hotmail.com"
    And I fill in "password" with "password"
    And I fill in "password_confirm" with "password"
    And I click "Register"
    Then I see "Welcome to Chitter, saramoohead. You have signed up."
  
  Scenario: sign in
    Given the user "saramoohead" exists
    And I am on the homepage
    When I fill in "username" with "saramoohead"
    And I fill in "password" with "password"
    And I click "Register"
    And the system correctly authenticates me
    Then I see "Welcome back, saramoohead. You are signed in."
