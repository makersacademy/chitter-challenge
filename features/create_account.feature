Feature: A maker can sign up for an account
         In order to be able to post messages on chitter
         As a maker
         I want to be able to create an account

Scenario: A maker creates an account with a handle that doesn't already exist
          Given I am on the homepage
          When I click the "Sign Up" link
          When I fill in "name" with "Rob"
          And I fill in "handle" with "rbgeorob"
          And I fill in "email" with "rob@test.com"
          And I fill in "password" with "hello"
          And I fill in "password_confirm" with "hello"
          Then I should see "Welcome Rob, your account @rbgeorob has been created"


