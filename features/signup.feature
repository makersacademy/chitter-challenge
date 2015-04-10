Feature: As a Maker
         So that I can post messages on Chitter as me
         I want to sign up for Chitter

  Scenario: Sign Up
    Given I am on the homepage
    And I sign up as 'tansaku'
    Then I see 'welcome tansaku'
    And I do not see 'welcome kensaku'

  Scenario: Sign Up As Another
    Given I am on the homepage
    And I sign up as 'kensaku'
    Then I see 'welcome kensaku'
    And I do not see 'welcome tansaku'