Feature: a user can sign up for a Chitter profile

Scenario: signing up
  Given I am on the homepage
  When I follow "Sign up"
  And I fill in "email" with "peter@test"
  And I fill in "name" with "Peter Smith"
  And I fill in "password" with "test"
  And I fill in "username" with "Peter"
  And I press "Sign up"
  Then I should see "Welcome, Peter"

Scenario: with an email already signed up
  Given I am on the homepage
  When I follow "Sign up"
  And I fill in "email" with "peter@test"
  And I fill in "name" with "Peter Smith"
  And I fill in "password" with "test"
  And I fill in "username" with "Peter"
  And I press "Sign up"
  Then I should see "Welcome, Peter"