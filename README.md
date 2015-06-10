Chitter Challenge [![Code Climate](https://codeclimate.com/repos/55781a2569568071a002b5c8/badges/62dafddf067c35f409b4/gpa.svg)](https://codeclimate.com/repos/55781a2569568071a002b5c8/feed)
=================

A clone of the micro blogging website twitter, built using Sinatra, Datamapper, BCrypt, PSQL and Ruby.
Tested with RSpec + Capybara.

Tests/Documentation

adding peeps
  is not possible when logged out
  is possible when logged in
  creates a peep with the users name attached

Logging in
  when we havent logged in
    we are not logged in
    we are presented a log in form
    we are presented a link to sign up
  with correct details
    welcomes us on the homepage
  with incorrect details
    we are prompted to log in again
    and given a warning

Logging out
  while logged in

replying to a peep
  takes us to a reply page
  if we are not logged in we cant reply
  if we are logged in we can reply

Viewing peeps
  on the homepage
  in reverse chronological order

Signing up
  as a new user visiting the site
  with a password that does not match
    doesnt add the user to the database
    redirects the user to the sign up form and displays an error
  is not possible
    with an email that is already taken
    with a username that is already taken

Peep
  can store a peep
  can store a user

Finished in 4.45 seconds (files took 2.58 seconds to load)
22 examples, 0 failures
