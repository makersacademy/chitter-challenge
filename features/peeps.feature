Feature: As a maker
         So that I can let people know what I am doing
         I want to post a message (peep) to chitter

Scenario: Logged in user can peep
          Given I visit the homepage
          Then I cannot see "Post a peep!"
          And I have previously signed up as Samuel
          When I enter Sams details to login
          And I click "Log In!"
          Then I should see "Post a peep!"
          When I write a peep "Hello World!"
          And I click "Peep!"
          Then I should see "Hello World!"
          And the number of peeps in the db should increase by 1

