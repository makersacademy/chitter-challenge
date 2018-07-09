# Makers Academy Week Four - Chitter
> 7-8 July 2018

Fourth week (weekend) solo project, building a Twitter clone that allows users to post messages to a public stream.

[Full project details and user stories here.](https://github.com/makersacademy/chitter-challenge)

## Completion

* All features & basic/harder user stories fully implemented.
* All tests passing with 100% coverage.
* Code conforms to Rubocop style guide.

## Learning Outcomes

Initially spent more time than I would have liked implementing the sign up and login/log out processes, but this helped further down the line when I came to develop the 'peep' functionality as I could easily apply ownership to peeps. I enjoyed this challenge, although the site is very 'bare bones' and I would have liked to spend some time styling it. I feel fairly comfortable with routes and basic database management at this point, although I'd like to improve my understanding of how sessions are managed.

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

* Introduce further guard conditions to the login/logout process.
* Style Chitter using CSS and HTML.
