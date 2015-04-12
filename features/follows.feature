Feature: Users can follow other users
  So that I can choose to see updates for those I care most about
  As a maker
  I would like to follow people

  Background:
    Given I block mailgun
    And I sign up
    And I cheep "Follow me!"
    And I sign out
    And Fred signs up

  Scenario: Sees 'following' list
    When I click link "joejknowles"
    And I press the "Follow" button
    And I click link "Following"
    Then I see "You are following:"
    And I see "joejknowles"

  Scenario: Don't see follow button on own profile
    When I'm on page ""


  Scenario: Don't see follow button when signed out