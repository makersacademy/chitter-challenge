# Twitter-like platform to share thoughts.
## -- sing up, log in, share, comment --

## Instructions
```plain
$ git clone https://github.com/Kotauror/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ rake setup
$ rackup and visit http://localhost:9292/ for Chitter
$ rspec for a summary of tests, checking that all tests are passing and test coverage (100%)
```

## Technology
  - Ruby, HTML, CSS, PostgreSQL
  - RSpec, Capybara

  ## Screenshots

  1) Initial screen - before log in
  https://image.ibb.co/ihXPy7/Zrzut_ekranu_2018_02_18_o_19_27_09.png
  2) Log in
  https://image.ibb.co/kizF5n/Zrzut_ekranu_2018_02_18_o_19_28_28.png
  3) After log in
  https://preview.ibb.co/nr9Xkn/Zrzut_ekranu_2018_02_18_o_19_29_09.png
  4) Add a comment
  https://image.ibb.co/bU1HJ7/Zrzut_ekranu_2018_02_18_o_19_29_50.png


## User Stories covered:
-------

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```
