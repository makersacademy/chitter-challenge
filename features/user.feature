Feature: user management
  So that I can post messages on Chitter as me
  As a Maker
  I want to be able to register, log into and log out of Chitter

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
    And my "username" and "password" are authenticated
    Then I see "Welcome saramoohead."

  Scenario: sign out
    Given I log in
    And I see "Welcome saramoohead"
    When I click "Sign out"
    Then I do not see "Welcome saramoohead."

  Scenario: cannot sign up if username is taken
    Given I am in the sign up section
    And the user "saramoohead" exists
    When I fill in "username" with "saramoohead"
    And I click "Register"
    Then I see "Sorry, that username is already taken."
    And "saramoohead" is not entered into the database

  Scenario: post peep
    Given I log in
    When I fill in "peep" with "Today is good"
    And I click "Peep"
    Then I create a new Peep
    And I see "Peep has been posted!"
