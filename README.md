Chitter Challenge
=================

* Started with creating diagrams for CRC and database schema (below)
* Biggest blocker was connecting Database to Model layer
* Completed passing feature test for first user story for basic interaction with app but couldn't get Database to connect


Challenge:
-------

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

CRC tables:
------


|            User                 | |
|---------------------------------|--|
|**Responsibilities** | **Collaborators** |
| sign in to Chitter | Chitter |

|            Peep                 |  |
|---------------------------------|--|
|**Responsibilities** | **Collaborators**|
| post a peep |  
| display peep time |  
| display peeps in reverse order |

Database Structure:
-----

Table: user

| id | user |
|----|------|
| 1  | 'Bella' |

Table: peep

| id | message |
|----|--------|
| 1  | 'Howdy' |

Table: user_peeps

| user_id | peep_id |
|--------|------|
| 1 | 1 |
| 1 | 2 |
