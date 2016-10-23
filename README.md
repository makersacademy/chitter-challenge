[![Coverage Status](https://coveralls.io/repos/github/makersacademy/chitter-challenge/badge.svg)](https://coveralls.io/github/makersacademy/chitter-challenge)

Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning


Solution
=================

I started off with using the User Stories to create a User model. The User model creates a users relation which stores a username, name, email and password. The User can create an account with both email/username verified.

The Peep model creates a peeps relation which stores a peep.

The landing page allows a user to see peeps from all users, starting with the most recent.

Installation:
```
$ git clone https://github.com/hanrattyjen/chitter_challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

Deployed web app can be found at https://chitter-chitter-bang-bang.herokuapp.com

Screen shot from home screen:

[![Screen Shot 2016-10-23 at 22.09.24.png](https://s13.postimg.org/xtf5zlphz/Screen_Shot_2016_10_23_at_22_09_24.png)](https://postimg.org/image/rshh2j2vn/)

Next
=================
Now that the User and Peep have been created, there is a lot you could do with this.
* Attempt to get the Users to interact with each other and have the ability to reply to peeps. This would involve a many-to-many relationship, so it would be interesting to see how it is done.
* Work on the CSS as it looks very messy.
* User could have profile picture.
* User could have the ability to upload an image.
