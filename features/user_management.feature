Feature: Manage accounts
  In order to stay up to date with famous people
  As a maker
  I would like to manage my account on Chitter

  Background:
    Given I block mailgun

  Scenario: Signing up
    Given I sign up
    Then I see "Happy Chitting, joejknowles"

  Scenario: Non matching passwords
    Given I sign up with mismatched passwords
    Then I see "Those passwords don't match"

  Scenario: User sign out
    Given I sign up
    When I sign out
    Then I see "Goodbye, joejknowles"
    And I don't see "Happy Chitting, joejknowles"

  Scenario: User signs up twice
    Given I sign up
    And I sign out
    And I sign up
    Then I see "Username is already taken"
    And I see "Email is already taken"

  Scenario: User signs in
    Given I sign up
    And I sign out
    Then I don't see "Happy Chitting, joejknowles"
    And I sign in
    Then I see "Happy Chitting, joejknowles"

  Scenario: New user signs up from homepage
    Given I'm on the "home" page
    And I press the "Register" button
    Then I sign up from this page
    Then I see "Happy Chitting, joejknowles"

  Scenario: User signs in from homepage
    Given I sign up
    And I sign out
    And I'm on the "home" page
    And I press the "Login" button
    Then I log in from this page
    Then I see "Happy Chitting, joejknowles"

  Scenario: User signs up with password that's too short
    Given I sign up with short password
    Then I see "Password confirmation must be at least 6 characters long"

  Scenario: Sends welcome email on sign up
    Then I receive welcome email on sign up