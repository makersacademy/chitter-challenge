Feature: user can sign in
  In order to post messages on Chitter as me
  As a Maker
  I want to log in to Chitter

  Background:
    Given a user is on the "/sign-up" page
    When they fill in "Samuel Russell Hampden Joseph" as the "name"
    And they fill in "sam@makersacademy.com" as the "email"
    And they fill in "tansaku" as the "username"
    And they fill in "s3cr3t" as the "password"
    And they press the "Sign up" button
    Then they click on the "Sign out" hyperlink

  Scenario: user can sign in using credentials from this session
    Given a user is on the "/sign-in" page
    And they fill in "tansaku" as the "username"
    And they fill in "s3cr3t" as the "password"
    And they press the "Sign in" button
    Then they see "Hello tansaku! Welcome to Chitter!"
