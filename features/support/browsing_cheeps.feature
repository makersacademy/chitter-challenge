Feature: Viewing Cheeps
  To use Chitter
  As someone who would like to read Cheets
  I want to browse all of the posted Cheets

  Scenario: Before anyone is signed in
    Given cheets have already been posted
    When I am on the homepage
    Then I should see "Hello World!"

  Scenario: Displaying the author of each cheep
    Given cheets have already been posted
    When I am on the homepage
    Then I should see "cheep-boy"
    And I should see "Tom"

  Scenario: Displaying the date and time when a cheep was posted
    Given cheets have already been posted
    When I am on the homepage
    Then I should see "2015"