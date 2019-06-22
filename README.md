Chitter Challenge
----------------

Intro
------
This is a solution to the week 4 weekend challenge from Makers.  
I've decided to attempt this challenge using DataMapper - a new piece of technology for me.
I paritcularly struggled with setting up the testing and development environments. As well as all the documentation from Sinatra and DataMapper (and a whole heap of Googling) I stumbled upon [this page](https://github.com/makersacademy/slack-overflow/issues/26) from a past Maker that helped a great deal.

Technology Used
---------------
- [Sinatra](http://sinatrarb.com/)
- [Postgres](https://www.postgresql.org/)
- [DataMapper](https://datamapper.org)
- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)

Setup
-----
- Please start by forking this repo.
- In a terminal run `psql`
- Create the following databases with:
```
CREATE DATABASE chitter_test;
CREATE DATABASE chitter_development;
```
- `rackup`
- Using a web browser visit the relevant localhost

Example of Use
--------------

![add user example](https://raw.githubusercontent.com/ajosephides/chitter-challenge/blob/master/public/chitter_add_user.gif)

![all users example](https://raw.githubusercontent.com/ajosephides/chitter-challenge/blob/master/public/chitter_all_users.gif)


Process
----
- Due to using a new framework (DataMapper ORM) I thought best to think through my models and relationships even more carefully so that I could set these up from the very begining with the the fields I would need and their associations.
- Due to the amount of new information I challenged myself only with the 'STRAIGHT UP' features.
- Two models - Peep and User. There is a 1 to many relationship between user and peep. 
- Associations can be setup in the [following manner](http://datamapper.org/docs/associations.html)
- Before embarking on Chitter I have been experimenting with a test project. Within here is where I have trialled and errored using Data Mapper e.g. the first commit of setting up the project and its environments was done after working through iterations on a different project.
- While experimenting on Associations and its syntax I have realised that it might be best to approach the problem with the creating a User story first. This is because of the setup and problem that a Peep must be associated with a User.


Features:
-------

```
STRAIGHT UP

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
I want to sign up for Chitter
```

Difficulties
-------
- setting up the development environments
- have not implemented the unique username and email address functionality

Summary
-------
- Once the setup is done DataMapper is nice and easy to use and full of functionality.
- Massive plus point of meaning that the whole app only have feature tests as there are no bespoke methods to test against
