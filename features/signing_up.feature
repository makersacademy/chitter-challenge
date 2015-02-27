Feature: Signing up to Chitter
  To use Chitter
  As someone who would like to post Cheets
  I want to create a Chitter account

  Scenario: Accessing the sign up/sign in page
    Given I am on the homepage
    When I click "Sign Up/Sign In"
    Then I should see "Enter your details to create an account"