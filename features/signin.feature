Feature: As a Maker
         So that I can post messages on Chitter as me
         I want to log in to Chitter

  Scenario: Sign In
    Given I have signed up as 'tansaku'
    And I am on the homepage
    When I sign in as 'tansaku'
    Then I see 'welcome tansaku'

  Scenario: Sign In Without SignUp
    Given I am on the homepage
    And no users are signed up
    When I sign in as 'tansaku'
    Then I see 'Sorry, you have not signed up'

  Scenario: Sign In Even With Server Restart
    Given I have signed up as 'tansaku'
    And I am on the homepage
    And the server has restarted
    When I sign in as 'tansaku'
    Then I see 'welcome tansaku'

