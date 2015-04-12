Feature: peep management
  So that I can let people know what I am doing  
  As a maker
  I want to post a message (peep) to chitter

  Scenario: post peep
    Given I log in
    When I fill in "peep" with "Today is good"
    And I click "Peep"
    Then I see "Peep has been posted!"
