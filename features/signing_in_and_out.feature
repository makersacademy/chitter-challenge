Feature: Signing in and out of Chitter
  In order to switch from one user to another
  As someone who wants to send a Cheep from their own account
  I want to sign in and out

  Scenario: Signing out from an account
    Given I am logged in with a current user account
    When I click "Sign Out"
    Then I should see "Sign In"

  Scenario: Signing in to an existing account
    Given I have previously created an account
    And I am on the homepage
    When I click "Sign In"
    And I enter "tomcoakes@gmail.com" into the "email" field
    And I enter "password100" into the "password" field
    And I press "Sign In"
    Then I should see "You're signed in, Tom!"

  Scenario: Signing in with incorrect details
    Given I am on the sign in page
    And I enter "incorrect@email.com" into the "email" field
    And I enter "wrongpassword" into the "password" field
    And I press "Sign In"
    Then I should see "Those login details are incorrect."
    And I should see "Please Sign In"