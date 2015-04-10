Feature: Manage accounts
  In order to stay up to date with famous people
  I would like to manage my account on Chitter

  Scenario: Signing up
    Given I sign up
    Then I see "Happy Chitting, joejknowles"

  Scenario: Non matching passwords
    Given I sign up with mismatched passwords
    Then I see "Those passwords don't match"
