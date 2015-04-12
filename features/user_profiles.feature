Feature: As a maker
         So that I can feel pleased with the time spent on site
         I want to be able to click a users name on the homepage and see their profile

Scenario: Logged out user can view anothers profile.
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
          When I enter Sams details to login
          And I click "Log In!"
          When I write a peep "Hi from Sam"
          And I click "Peep!"
          Then I should see "Hi from Sam"

          Given I am in Linda's browser
          And I visit the homepage
          And I should see "Hello World from Dan!"
          And I should see "Hi from Sam"
          When I click on "tester_dan"
          Then I should see "Hello World from Dan!"
          And I should see "tester_dan"
          And I should see "Dan"
          And I cannot see "Hi from Sam"

Scenario: Logged in user can view anothers profile.
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
          When I enter Sams details to login
          And I click "Log In!"
          When I write a peep "Hi from Sam"
          And I click "Peep!"
          Then I should see "Hi from Sam"
          And I should see "Hello World from Dan!"
          And I should see "Hi from Sam"
          When I click on "tester_dan"
          Then "tester_dan" should be before "Dan"
          And "Dan" should be before "Hello World from Dan!"
          And I cannot see "Hi from Sam"
          And I cannot see "Post a peep!"