Feature: logging in to Chitter
As a Maker So that I can post messages on Chitter as me
I want to log in to Chitter
As a Maker So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

  Scenario: Signing In
    Given I signup as "bob"
    Given I am on the "homepage"
    When I click "Sign in"
    Then I should see "Please log in"
    Given I enter "bob@gmail.com" in "email"
    And I enter "password" in "password"
    Then I should see "Welcome, bobster"

  Scenario: Once signed in I want to be able to sign out
    Given I signup as "bob"
    Given I log in as "bob"
    Given I am on the "homepage"
    And I click "Sign out"
    Then I should see "Goodbye, bobster"