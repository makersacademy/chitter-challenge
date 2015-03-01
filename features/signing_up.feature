Feature: Signing up to Chitter
  To use Chitter
  As someone who would like to post Cheeps
  I want to create a Chitter account

  Scenario: Before anyone is signed in
    Given I am on the homepage
    Then I should not see "You're signed in"

  Scenario: Accessing the sign up/sign in page
    Given I am on the homepage
    When I click "Sign Up"
    Then I should see "Enter your details to create an account"

  Scenario: Entering new account details
    Given I am on the Sign Up page
    When I enter "Tom" into the "name" field
    And I enter "cheep-boy" into the "username" field
    And I enter "tomcoakes@gmail.com" into the "email" field
    And I enter "password100" into the "password" field
    And I enter "password100" into the "password_confirmation" field
    And I press "Create Account"
    Then I should see "You're signed in, Tom!"
    And I should not see "Sign Up" or "Sign In"

  Scenario: Entering an incorrect password confirmation
    Given I am on the Sign Up page
    When I enter "Tom" into the "name" field
    And I enter "cheep-boy" into the "username" field
    And I enter "tomcoakes@gmail.com" into the "email" field
    And I enter "password100" into the "password" field
    And I enter "100password" into the "password_confirmation" field
    And I press "Create Account"
    Then I should not see "You're signed in, Tom!"
    And I should see "Your passwords didn't match. Try again."

  Scenario: Signing up with a username that has previously been used
    Given I have previously created an account
    When I visit the "/users/sign_up" page
    And I enter "Jimmy" into the "name" field
    And I enter "cheep-boy" into the "username" field
    And I enter "jimmy@gmail.com" into the "email" field
    And I enter "password100" into the "password" field
    And I press "Create Account"
    And I should be at the "/users/sign_up" page

  Scenario: Signing up with an email address that has previously been used
    Given I have previously created an account
    When I visit the "/users/sign_up" page
    And I enter "Jimmy" into the "name" field
    And I enter "new-user" into the "username" field
    And I enter "tomcoakes@gmail.com" into the "email" field
    And I enter "password100" into the "password" field
    And I press "Create Account"
    And I should be at the "/users/sign_up" page