Chitter Challenge
=================

In order to run Chitter, please fork and clone the repo.
You can then run

```
$ bundler
```
from the terminal. In the spec/spec_helper file uncomment lines 29-41 and back in the terminal run"

```
$ bundler
```
This will set up the databases for you. The chitter_development tables will be empty until you run the app, sign up and start creating peeps. The chitter_test tables empty and fill based on the tests in the spec files. To run the app use
```
$ bundler
```
from the terminal, or uncomment line 65 in app.rb to run
```
$ ruby app.rb
```
In this challenge I have followed the following user stories, and for now the ADVANCED functionality is missing, so no emails from Chitter for now! This has been a challenging weekend, the biggest hurdles were to do with authentication, especially when I thought that my logic and PG request were written incorrectly, but in fact I had an error in my test so that the result of the SQL query was, in fact, empty (ntuples = 0).

It would be nice to have some more time to make it look better with some CSS.

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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
