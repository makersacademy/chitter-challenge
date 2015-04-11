Feature: As a maker
         So that I can let people know what I am doing
         I want to post a message (peep) to chitter and see them in reverse chronlogical order

Scenario: Logged in user can peep
          Given I visit the homepage
          Then I cannot see "Post a peep!"
          And I have previously signed up as Samuel
          When I enter Sams details to login
          And I click "Log In!"
          Then I should see "Post a peep!"
          When I write a peep "Hello World!"
          And I click "Peep!"
          Then the first peep in the database should be "Hello World!"
          And I should see "Hello World!"


Scenario: Logged in user can see all peeps reverse order

          Given I am in Dan's browser
          And I visit the homepage
          And I have previously signed up as Dan
          When I enter Dans details to login
          And I click "Log In!"
          When I write a peep "Hello World from Dan!"
          And I click "Peep!"
          Then I should see "Hello World from Dan!"

          Given I am in Sam's browser
          And I visit the homepage
          And I have previously signed up as Samuel
          When I visit the homepage
          When I enter Sams details to login
          And I click "Log In!"
          When I write a peep "Hello World from Sam!"
          And I click "Peep!"
          And I write a peep "My Second Peep"
          And I click "Peep!"
          And I visit the homepage
          Then "My Second Peep" should be before "Hello World from Sam!"
          And "Hello World from Sam!" should be before "Hello World from Dan!"

Scenario: Logged out user can see all peeps reverse order
          Given I am in Dan's browser
          And I visit the homepage
          And I have previously signed up as Dan
          When I enter Dans details to login
          And I click "Log In!"
          When I write a peep "Hello World from Dan!"
          And I click "Peep!"
          Then I should see "Hello World from Dan!"

          Given I am in Sam's browser
          And I visit the homepage
          And I have previously signed up as Samuel
          When I visit the homepage
          When I enter Sams details to login
          And I click "Log In!"
          When I write a peep "Hello World from Sam!"
          And I click "Peep!"
          And I write a peep "My Second Peep"
          And I click "Peep!"
          And I visit the homepage
          Then "My Second Peep" should be before "Hello World from Sam!"
          And "Hello World from Sam!" should be before "Hello World from Dan!"

          Given I am in Katie's browser
          And I visit the homepage
          Then "My Second Peep" should be before "Hello World from Sam!"
          And "Hello World from Sam!" should be before "Hello World from Dan!"
          And I should see "Join In?"

Scenario: Peeps have the name of the maker and their user handle.
          Given I am in Sam's browser
          And I visit the homepage
          And I have previously signed up as Samuel
          When I visit the homepage
          When I enter Sams details to login
          And I click "Log In!"
          When I write a peep "Hello World from Sam!"
          And I click "Peep!"

          Given I am in Katie's browser
          When I visit the homepage
          Then I should see "Samuel Russell Hampden Joseph"
          And I should see "tansaku"
          And I should see "Hello World from Sam!"

