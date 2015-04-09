Feature: As a Maker
         So that I can post messages on Chitter as me
         I want to sign up for Chitter

  Scenario: Sign Up
    Given I am on the homepage
    And I sign up as 'tansaku'
    Then I see 'welcome tansaku'