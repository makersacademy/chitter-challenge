Chitter Challenge
=================

What is this?
-------
Chitter is a social networking website that allows you to make anonymous messages. Think yikyak before it got cruddy.

How do I use it?
-------
You can visit [Chitter](https://chittery-chat.herokuapp.com/) and play there, or you can clone this and run it on your own server if you only want to see your own messages... >.>

```
=> $ git clone https://github.com/elliewem/chitter-challenge.git
=> $ bundle
=> $psql
  => CREATE DATABASE chitter_development;
  => CREATE DATABASE chitter_test;
  => \q
=> $ rake upgrade
=> $ rake migrate
=> $ bundle exec rackup
~ go to your localhost ~
```

What does it look like?
-------
If you've seen any of my other stuff; alot like that. But here's a picture if you don't want to visit [the website](https://chittery-chat.herokuapp.com/).

![screenshot](https://github.com/elliewem/chitter-challenge/blob/master/frontpage.png "Front page")
![screenshot](https://github.com/elliewem/chitter-challenge/blob/master/sign_up.png "Sign up")
