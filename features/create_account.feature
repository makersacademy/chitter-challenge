Feature: A maker can sign up for an account
         In order to be able to post messages on chitter
         As a maker
         I want to be able to create an account

Scenario: A maker creates an account with a handle that doesn't already exist
          Given I am on the homepage
          When I click the "sign-up" link
          When I fill in "name" with "Rob"
          And I fill in "handle" with "rbgeorob"
          And I fill in "email" with "rob@test.com"
          And I fill in "password" with "hello"
          And I fill in "password_confirmation" with "hello"
          And I click the "Sign up" button
          Then I should see "Welcome Rob, your account @rbgeorob has been created"

Scenario: A maker creates an account with a wrong password and gets informed of this
          Given I am on the homepage
          When I click the "sign-up" link
          When I fill in "name" with "Rob"
          And I fill in "handle" with "rbgeorob"
          And I fill in "email" with "rob@test.com"
          And I fill in "password" with "hello"
          And I fill in "password_confirmation" with "goodbye"
          And I click the "Sign up" button
          Then I should see "Password does not match the confirmation"
