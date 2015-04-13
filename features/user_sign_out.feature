Feature: user can sign out
  In order to avoid others posting messages on Chitter as me
  As a Maker
  I want to log out of Chitter

  Scenario: user signs out
    Given a user is on the "/signed-in" page
    Then they click on the "Sign out" hyperlink
    Then they see "You are now signed out!"
