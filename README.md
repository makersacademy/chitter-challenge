Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

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


|            User                 |
|---------------------------------|
|**Responsibilities** | **Collaborators** |
| sign in to Chitter | Chitter |

|            Peep                 |
|---------------------------------|
|**Responsibilities** | **Collaborators**|
| post a peep |  
| display peep time |  
| display peeps in reverse order |

Database Structure:
-----

Table: user

| id | name |
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
