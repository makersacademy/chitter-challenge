Feature: a User can add a peep
  As a user
  So that I can let people know what I am doing
  I want to post a message (peep) to chitter

  Scenario: adding a peep
  Given I have a Chitter profile
  And I am logged in
  When I am on the homepage
  And I follow "New peep"
  When I fill in "peep" with "This is my first peep."
  And I press "submit"
  Then I should see "This is my first peep. Posted by: Peter, Peter Smith"
  Then I should see time of post

  Scenario: when not logged in
  When I am on the homepage
  And I follow "New peep"
  Then I should see "Please log in or sign up to post a peep"
