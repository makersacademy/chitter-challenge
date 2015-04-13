Feature: Users can follow other users
  So that I can choose to see updates for those I care most about
  As a maker
  I would like to follow people

  Background:
    Given I block mailgun
    And I sign up
    And I cheep "Follow me!"
    And I sign out
    And "Fred" signs up
    And I cheep "Cheep cheep!"

  Scenario: Sees 'following' list
    When I click link "joejknowles"
    And I press the "Follow" button
    And I click link "Following"
    Then I see "Fred is following:"
    And I see "joejknowles"

  Scenario: Don't see follow button on own profile
    When I'm on the "users/profiles/Fred" page
    Then I don't see the "Follow" button

  Scenario: Don't see follow button when signed out
    When I sign out
    And I'm on the "users/profiles/Fred" page
    Then I don't see the "Follow" button

  Scenario: Don't see follow button when already following
    When I click link "joejknowles"
    And I press the "Follow" button
    Then I don't see the "Follow" button

  Scenario: Sees cheeps of followed people
    When I click link "joejknowles"
    And I press the "Follow" button
    And I'm on the "home" page
    And I click link "Following Cheeps"
    Then I see "Follow me!"
    And I don't see "Cheep cheep!"

  Scenario: Sees number of followers
    When I click link "joejknowles"
    Then I see "0 Followers"
    When I press the "Follow" button
    Then I see "1 Follower"
    When I sign out
    And "bob" signs up
    And I click link "joejknowles"
    And I press the "Follow" button
    Then I see "2 Followers"

  Scenario: See follows on other profiles
    When I click link "joejknowles"
    And I press the "Follow" button
    And I'm on the "users/profiles/joejknowles/following" page
    Then I see "joejknowles is following"

  Scenario: See followers on other profiles
    When I click link "joejknowles"
    And I press the "Follow" button
    And I click link "Followers"
    Then I see "User known as Fred"
    And I see "joejknowles is followed by"




