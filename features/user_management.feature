Feature: Use an account
         So that I can post messages on Chitter
         I'd like to be able to signup, log-in and log out

Scenario: Sign Up
          Given I visit the homepage
          And I cannot see "Welcome Samuel!"
          When I enter my details to signup
          And I click "Join In!"
          Then I should see "Welcome Samuel!"
          And I cannot see "Join In?"
          And I cannot see "Log In?"
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
          Given I visit the homepage

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

Scenario: Cannot Signup If Email Registered
          Given I have previously signed up as Samuel
          Given I visit the homepage
          And I cannot see "Welcome Samuel!"
          When I enter my details to signup
          And I click "Join In!"
          Then I should see "Email is already taken"
          And the number of users in the database should be 1

Scenario: Cannot Signup If Username Registered
          Given I have previously signed up as Samuel
          Given I visit the homepage
          And I cannot see "Welcome Samuel!"
          When I enter my details to signup
          And I click "Join In!"
          Then I should see "Username is already taken"
          And the number of users in the database should be 1

Scenario: Cannot Signup If Email Registered
          Given I have previously signed up as Samuel
          Given I visit the homepage
          And I cannot see "Welcome Samuel!"
          When I enter my details to signup
          And I click "Join In!"
          Then I should see "Email is already taken"
          And the number of users in the database should be 1

Scenario: Alerted as to which errors are     raised when signup fails
          Given I have previously signed up as Samuel
          Given I visit the homepage
          When I enter my details to signup
          And I click "Join In!"
          Then I should see "Email is already taken"
          And I should see "Username is already taken"

Scenario: Cannot signup with blank information
          Given I visit the homepage
          And I click "Join In!"
          Then I should see "Email must not be blank"
          And I should see "Name must not be blank"
          And I should see "Username must not be blank"

Scenario: Can Log Out
          Given I visit the homepage
          And I have previously signed up as Samuel
          When I enter Sams details to login
          And I click "Log In!"
          Then I should see "Welcome Samuel!"
          Given I visit the homepage
          Then I should see "You're Logged In As: Samuel!"
          Given I click "Log Out!"
          Then I should see "You have logged out!"
          And I should see "Join In?"
          And I cannot see "Welcome Samuel!"

