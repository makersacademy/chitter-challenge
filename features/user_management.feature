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

Scenario: Cannot Login With Incorrect Email
          Given I visit the homepage
          And I cannot see "Welcome Dan!"
          And I have previously signed up as Dan
          When I enter Dans email incorrectly
          And I click "Log In!"
          Then I cannot see "Welcome Dan!"
          And I should see "No user with those details!"
          Given I visit the homepage
          Then I cannot see "Welcome Dan!"

Scenario: Cannot Login With Incorrect Password
          Given I visit the homepage
          And I cannot see "Welcome Dan!"
          And I have previously signed up as Dan
          When I enter Dans password incorrectly
          And I click "Log In!"
          Then I cannot see "Welcome Dan!"
          And I should see "No user with those details!"
          Given I visit the homepage
          Then I cannot see "Welcome Dan!"

Scenario: Cannot Signup Twice
          Given I have previously signed up as Samuel
          Given I visit the homepage
          And I cannot see "Welcome Samuel!"
          When I enter my details to signup
          And I click "Join In!"
          Then I should see "There is already a user with this email!"
          And the number of users in the database should be 1


