Chitter Challenge
=================

The task was to create a simplified Twitter clone which allows users to post messages to a public stream.

Users could only post messages if they were signed in and all messages had to have the name of the poster and the time posted on display.


Screenshots
-----

![Screenshot](http://i.imgur.com/s9itZFxm.png)
![Screenshot](http://i.imgur.com/1NCuy9Qm.png)

You can also play with the live version [here](https://chitter-chat.herokuapp.com)!

How to Use
-----

```
$ git clone git@github.com:JAstbury/chitter-challenge.git
$ cd chitter-challenge
$ bundle
```
Install postgresql and create a new database called chitter_development.
```
$ rake db:auto_migrate
$ ruby ./app/app.rb
```

To Do
-----

Due to time restraints, I haven't been able to refactor so my app.rb file is looking a little long at the moment. In future, I'd like to use the Sinatra Partial gem to separate out the routes into different controllers.

I'd also like to work a little more on the styling and perhaps some reply functionality.
