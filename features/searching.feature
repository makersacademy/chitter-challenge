Feature: As a user
So that I can check my profile and peeps
I want to visit my user page

  Scenario:
  Given I have a Chitter profile
  And I am logged in
  And have made a post
  When I am on the homepage
  When I follow "Peter"
  Then I should see "Peter Name: Peter Smith"