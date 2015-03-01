Feature: Sign up, log in and out
As a Maker
In order to send peeps
I want to sign up for chitter, log in and log out

  Scenario: Sign up
    Given I am on the homepage
    When I click on Sign up
    Then I can enter "name", "username", "email" and "password"
    And I can see "Welcome TStrothjohann"

  Scenario: Sign in
    Given I have an account already
    When I log in with username and password
    Then I should see the Chitter-editor on frontpage