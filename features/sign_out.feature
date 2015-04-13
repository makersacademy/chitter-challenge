Feature: A maker can sign out of chitter to avoid non-authorised peeps
         In order to be able to post a peep on Chitter
         As a maker
         I want to be able to sign in.

Scenario: A signed in maker can sign out
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
          When I click the "Sign out" button
          Then I should see "@rbgeorob is now logged out"
          When I fill in "msg" with "A test peep"
          And I click the "Peep" button
          Then I should see "Sorry! Please sign in to Peep!"
          And the peep count should be 0