Feature: A maker can sign in and post a peep
         In order to be able to post a peep on Chitter
         As a maker
         I want to be able to sign in.

Scenario: A user can sign in with the correct credentials and post a peep
          Given I am on the homepage
          When I click the "sign-up" link
          When I fill in "name" with "Rob"
          And I fill in "handle" with "rbgeorob"
          And I fill in "email" with "rob@test.com"
          And I fill in "password" with "hello"
          And I fill in "password_confirmation" with "hello"
          And I click the "Sign up" button
          When I click the "sign-in" link
          When I fill in "email" with "rob@test.com"
          And I fill in "password" with "hello"
          And I click the "Sign in" button
          Then I should see "Welcome Rob, your account @rbgeorob is ready to send a Peep!"
          When I fill in "peep" with "A test peep"
          And I click the "Peep" button
          Then I should see "A test peep"
          And the peep count should be 1