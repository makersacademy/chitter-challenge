Chitter Challenge
=================

Working on cleaning up and finishing the challenge.

-------
Notes on Hobbit and Mote:
* Currently having a slight issue with mote. In any file, if I haven't passed in the param of a variable I'm using, it throws an undefined local variable message, instead of that variable just being nil. ERB will just treat those undeclared variables as nil. Current workaround means that for every page render I have to pass in all used local variables, and give them a nil value if unused.
* Hobbit does not inherently support the shorthand `params[:key]`. I have extended the Mote extension to support this.


Challenge:
-------

As usual please start by 

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (if you haven't already)
* Forking this repo

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

* In order to use chitter as a maker I want to sign up to the service
* In order to user chitter as a maker I want to log in
* In order to avoid others using my account as a maker I want to log out
* In order to let people know what I am doing as a maker I want to post a message (peep) to chitter
* In order to see what people have to say as a maker I want to see all peeps in chronological order

Notes:
------

* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!
