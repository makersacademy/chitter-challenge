Feature: Viewing Cheeps
  To use Chitter
  As someone who would like to read Cheets
  I want to browse all of the posted Cheets

  Scenario: Before anyone is signed in
    Given cheets have already been posted
    When I am on the homepage
    Then I should see "Hello World!"