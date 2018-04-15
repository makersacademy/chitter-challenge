# Chitter Challenge
## Makers Academy weekend challenge to create a twitter like social media app with ruby

[Challenge Specification](https://github.com/makersacademy/chitter-challenge)
## Tech:

Ruby - Postgresql - Rspec - Sinatra - Capybara - ActionMailer - Bcrypt

## Setup:
   Install [Postgresql](https://www.postgresql.org/)

   ```
   $ git clone https://github.com/jbropho/chitter-challenge
   $ cd chitter-challenge
   $ bundle
   $ rake
   $ rackup

   visit localhost:9292/register

   testing:
   $ rspec
   ```

   To enable email notifications
   ```
   setup temporary environment variables
   $ export CHITTER_EMAIL=GMAIL_ADDRESS
   $ export CHITTER_PASSWORD=GMAIL_PASSWORD
   (to use a different email service, modify the smtp parameters in lib/mailer.rb)
   ```

   To use the mailer service, register and sign-in with a second user account and
   add the username of the account associated with your email address to the "username" field
   of the input form found at /posts/new. You should receive an email shortly after creating
   the post.


## Approach
I had enjoyed building a [bookmark manager](https://github.com/jbropho/bookmark-manager) without
using an ORM during the week at Makers Academy and I decided it would be instructive to take this
opportunity to build an authentication system without the use of a framework. I was also very keen
to reach the end of the challenge and send email notifications to tagged users.

## Positives
* Built an authentication system from scratch, storing a hashed version of user passwords via the bcrypt gem
* Created an email notification system by implementing ActiveMailer

## If I had more time
* Implement "happy paths". I misjudged how long this would take, meaning there are many scenarios my application
handles poorly, such as a user registering with a name that is already in use leading to an error page.
* Improve security by salting passwords
* Use the active view gem to display how long ago posts were made rather than when they were made

## Focus for the next week
* Practice effective design of restful routes and learn to better anticipate "unhappy paths" and edge cases
in my applications
