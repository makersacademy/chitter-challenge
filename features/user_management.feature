Feature: Use an account
         So that I can post messages on Chitter
         I'd like to be able to signup, log-in and log out

Scenario: Sign Up
          Given I visit the homepage
          When I enter my details to signup
          And I click "Join In!"
          Then I should see "Welcome Samuel!"
          And the number of users in the database should increase by 1


