Feature: As a user
So that I can stay upto date
I want to see peeps in reverse chronological order

  Scenario: peeps in the correct order
  Given I have a Chitter profile
  And I am logged in
  When I am on the newpeep page
  And I fill in "peep" with "This is my first peep."
  And I press "submit"
  When I follow "New peep"
  And I fill in "peep" with "This is my second peep."
  And I press "submit"
  Then I should see "This is my second peep" before "This is my first peep"

