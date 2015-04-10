Feature: Manage accounts
  In order to stay up to date with famous people
  As a maker
  I would like to manage my account on Chitter

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