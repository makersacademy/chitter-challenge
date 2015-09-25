Feature: User sign up
  In order to send messages
  As a user
  I want to be able to sign up

  Scenario: signing up 
    Given I visit the sign-up page 
    And I type my email adress, name and password
    When I click on sign up
    Then I should see my name on the page
