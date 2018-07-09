# Makers Academy Week Four - Chitter
> 7-8 July 2018

Fourth week (weekend) solo project, building a Twitter clone that allows users to post messages to a public stream.

[Full project details and user stories here.](https://github.com/makersacademy/chitter-challenge)

## Completion

* Incomplete. Please see below.

## Learning Outcomes

I ran out of time this week and was unable to implement all of the features for this challenge. Server build/destroy scripts are fully functional, as is the user sign-up/login process (although a number of guard conditions need to be introduced here). I was unable to implement basic peeps as I focused on getting the login process working first, which may have been a mistake in hindsight.
I intend to complete this project over the next few evenings if possible.

## Technical

Ruby / SQL / HTML / CSS using PSQL & Sinatra web framework with Rspec & Capybara for testing.

## Implementation

Clone/download repo and navigate to directory
```shell
$ bundle install
$ rake initial_setup
$ rackup
```
Visit 'localhost:9292' in browser.

## Further Improvements

* Introduce guard conditions to the login/logout process.
* Implement basic 'peep' functionality.
