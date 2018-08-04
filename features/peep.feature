Feature: peep
  Users can peep (post messages)

  Scenario: User peeps
    Given I write a peep
    When I post that peep
    Then I want to see that peep on Chitter
