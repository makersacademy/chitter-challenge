Feature: Signing up to Chitter
  As a Maker
  So that I can post messages on Chitter as me
  I want to sign up for Chitter

  Scenario: Getting to the signup page
    Given I am on the "homepage"
    When I follow "Register"
    Then I should see "Register for Chitter"

  Scenario: Registering an account
    Given I am on the "homepage"
    When I follow "Register"
    And I enter "bob smith" in "fullname"
    And I enter "bob@gmail.com" in "email"
    And I enter "bobster" in "username"
    And I enter "password" in "password"
    And I enter "password" in "password_confirmation"
    And I click "Sign up"
    Then I should see "Welcome, bobster"
