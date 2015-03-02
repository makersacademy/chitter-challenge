Feature: Posting a Cheep
  To have my voice heard
  As someone who would like to gain an audience of followers
  I want to post a Cheep

  Scenario: Posting a Cheep without being logged in
    When I visit the "/cheeps/new" page
    Then I should be at the "/users/sign_in" page

  Scenario: Posting a Cheep whilst logged in
    Given I am logged in with a current user account
    And I click "Post a new Cheep"
    When I enter "Hello World" into the "content" field
    And I press "Post"
    Then I should be at the "/" page
    And I should see "Hello World"