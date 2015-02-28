Feature: Signing up to Chitter
  To use Chitter
  As someone who would like to post Cheets
  I want to create a Chitter account

  Scenario: Before anyone is signed in
    Given I am on the homepage
    Then I should not see "You're signed in"

  Scenario: Accessing the sign up/sign in page
    Given I am on the homepage
    When I click "Sign Up/Sign In"
    Then I should see "Enter your details to create an account"

  Scenario: Entering new account details
    Given I am on the sign up/sign in page
    When I enter "Tom" into the "name" field
    And I enter "tomcoakes@gmail.com" into the "email" field
    And I enter "password100" into the "password" field
    And I press "Create Account"
    Then I should see "You're signed in, Tom!"
    And I should not see "Sign Up/Sign In"