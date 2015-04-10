Feature: Use an account
         So that I can post messages on Chitter
         I'd like to be able to signup, log-in and log out

Scenario: Sign Up
          Given I visit the homepage
          And I cannot see "Welcome Samuel!"
          When I enter my details to signup
          And I click "Join In!"
          Then I should see "Welcome Samuel!"
          And the number of users in the database should increase by 1

Scenario: Log In
          Given I visit the homepage
          And I cannot see "Welcome Samuel!"
          And I have previously signed up as Samuel
          When I enter Sams details to login
          And I click "Log In!"
          Then I should see "Welcome Samuel!"
          Given I visit the homepage
          Then I should see "Welcome Samuel!"
          And I cannot see "Join In?"
          And I cannot see "Log In?"

Scenario: Log In as a different user
          Given I visit the homepage
          And I cannot see "Welcome Dan!"
          And I have previously signed up as Dan
          When I enter Dans details to login
          And I click "Log In!"
          Then I should see "Welcome Dan!"
          Given I visit the homepage
          Then I should see "Welcome Dan!"


