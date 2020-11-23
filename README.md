Chitter Challenge
=================

Approach:
-------

* This problem was done in a test driven manner user RSpec and Capybara.

* The tests have 99.95% coverage!

* This was written using Ruby, HTML and SQL was used for the database aspect.

* The code was cleaned up to Rubocop's guidelines.

* 2 classes were used for the model!

* The first beeing  Peep, which was responsible for listing all the peeps in a readable format, and posting them.

* The second was a User class, which was used to create, find authenticate (their password was encyrpted using the BCrypt gem) users.

* This is no doubt the most ugly twitter clone you will lay your eyes on.

* You're able to sign up, and log in and out!

* If you post a peep whilst logged in, it will have your tag next to the peep, otherwise it'll say 'Anon'

* It'll also display the tweets in reverse order, with a time attached to each.

Features:
-------

```
STRAIGHT UP

* As a Maker
* So that I can let people know what I am doing  
* I want to post a message (peep) to chitter

* As a maker
* So that I can see what others are saying  
* I want to see all peeps in reverse chronological order

* As a Maker
* So that I can better appreciate the context of a peep
* I want to see the time at which it was made

* As a Maker
* So that I can post messages on Chitter as me
* I want to sign up for Chitter

HARDER

* As a Maker
* So that only I can post messages on Chitter as me
* I want to log in to Chitter

* As a Maker
* So that I can avoid others posting messages on Chitter as me
* I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
