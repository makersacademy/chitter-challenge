Chitter Challenge
=================

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

* In order to use chitter as a maker I want to sign up to the service | done
* In order to use chitter as a maker I want to log in | done
* In order to avoid others using my account as a maker I want to log out | done
* In order to let people know what I am doing as a maker I want to post a message (peep) to chitter | done
* In order to see what people have to say as a maker I want to see all peeps in chronological order


ToDo>
- Presentation of tweets (creation into db works fine)
- layout
- Error when peep is too long
- rack-messages

Notes:
------

* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!
