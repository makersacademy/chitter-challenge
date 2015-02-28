Feature: Signing in and out of Chitter
  In order to switch from one user to another
  As someone who wants to send a Cheet from their own account
  I want to sign in and out

  Scenario: Signing out from an account
    Given I am logged in with a current user account
    When I click "Sign Out"
    Then I should see "Sign Up/Sign In"