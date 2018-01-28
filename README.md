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

Approach
-------
This challenge was very much like the bookmark-manager we'd done the week before, so I had a clear idea that I wanted two models; the user and the peep class. I ran out of time to make a one-to-many relationship between them. If I'd gotten that far it would have been nice to put the username of the peeper on their messages.

I also tried to work out HAML on Sunday morning, which went really well until it didn't. That's why there are a couple of .haml files in /views. 

What does it look like?
-------
If you've seen any of my other stuff; quite a lot like that (I should probably do something new). But here's a picture if you don't want to visit [the website](https://chittery-chat.herokuapp.com/).

![screenshot](https://github.com/elliewem/chitter-challenge/blob/master/frontpage.png "Front page")
