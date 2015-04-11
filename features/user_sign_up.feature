Feature: user can sign up
  In order to post messages on Chitter as me
  As a Maker
  I want to sign up for Chitter

  Scenario: user signs up
    Given a user is on the "/" page
    Then they see "Welcome to Chitter!"
    Then they click on the "Sign up" hyperlink
    Then they see "Enter your name:"
    And they see "Enter your email address:"
    And they see "Enter a username:"
    And they see "Enter a password:"
    When they fill in "Samuel Russell Hampden Joseph" as the "name"
    And they fill in "sam@makersacademy.com" as the "email"
    And they fill in "tansaku" as the "username"
    And they fill in "s3cr3t" as the "password"
    And they press the "Sign up" button
    Then they see "Hello tansaku! Welcome to Chitter!"
