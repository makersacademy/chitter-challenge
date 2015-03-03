Chitter
========

A little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

* User accounts:
    - sign up
    - sign in
    - sign out
    - post message (peep) function

* Chronological message feed viewable by all site visitors

Notes:
------

* Users sign up to chitter with their email, password, name and a user name.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the user and their user handle.
* Use of bcrypt to secure passwords.
* Use of data mapper and postgres to save data.
* Peeps viewable by all (log in not necessary).
* Ability to peep only if logged in.

