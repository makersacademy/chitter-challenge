Chitter Challenge
=================
A small Twitter clone that will allow the users to post messages to a public stream. 

Features:
-------
```
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
I want to sign up for Chitter (name, unq username, unq email, password)

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

To Do:
-------

```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

You can continue to use `PG` gem and `SQL` queries approach DB integration, or if you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.
Some useful resources:
**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)
**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra & ActiveRecord setup](https://learn.co/lessons/sinatra-activerecord-setup)


NTH:
-----
* In order to start a conversation as a maker I want to reply to a peep from another maker.

Personal notes
-----
- user_fk is integer type, is that ok?
- make password private
- make self.connect_db a method that can be used by either class?


Styling
-----
Took vanillacss from https://github.com/bradleytaunt/vanilla-css/blob/master/vanilla.css