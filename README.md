[![Build Status](https://travis-ci.org/LaszloBogacsi/chitter-challenge.svg?branch=master)](https://travis-ci.org/LaszloBogacsi/chitter-challenge)

#Chitter Challenge
=================
___
![Logo](http://www.clipartbest.com/cliparts/niX/BA5/niXBA5oAT.png)
___
Challenge:
-------

This project is a little Twitter clone that allows the users to post messages to a public stream.



Installation instructions:
-------
```
$ git clone https://github.com/laszlobogacsi/chitter_challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

Features:
-------

```
User can view all the peeps in the stream without signup or login.
User can sign up to the service
User can log in (once signed up)
User can peep while signed in.
User can sign out.
```

App available online:
-------
```
http://chitter-bylaszlo.herokuapp.com
```
![Screenshot](https://www.dropbox.com/s/h62y7vblmtlf6oq/chitter.png?dl=0)
