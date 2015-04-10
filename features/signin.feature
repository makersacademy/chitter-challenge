Feature: As a Maker
         So that I can post messages on Chitter as me
         I want to log in to Chitter

  Scenario: Sign In
    Given I have signed up as 'tansaku'
    And I am on the homepage
    When I sign in as 'tansaku'
    Then I see 'welcome tansaku'
