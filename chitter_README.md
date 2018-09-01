Chitter - A Twitter Clone
=========================

Introduction
------------



User Stories
------------
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

Breakdown
---------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
* A User would like to post a message on a page.    |  
* This message should be sent to a database.        |
* A page should broadcast the users message.        |


Class Responsibility Collaborator Cards
---------------------------------------

```
User
Responsibility        | Collaborator
------------------------------------
Knows their username  |
            password  |


Account
Responsibility        | Collaborator
------------------------------------
creates peeps         | User
reads peeps           | Peep 
is tagged in peeps    |


Peep
Responsibility        | Collaborator
------------------------------------
knows its content     | Account
knows its timestamp   |
knows its author      |
has account tags      |



Chitter
Responsibility        | Collaborator
------------------------------------
organises peeps       | Peeps
    by time           | User
    by author         |
notifies user         |
    if tagged         |


```

Database Tables
---------------

Accounts
```
id | name | username | email             | password
---------------------------------------------------
1  | John |  J_boy   | john@gmail.com    | *****
x  | -    |          |                   |
y  | -    |          |                   |
```

Peeps
```
id | content | timestamp | poster_id
-----------------------------------
1  |  "abc"  |  dd/mm/yy | account_id
2  |  "abc"  |           |
3  |  "abc"  |           |

```

There is a One to Many relationship between a Makers account and peeps they are tagged in, a single peep can 
tag many accounts and an account can be tagged to many peeps.
In order to keep the Account and Peeps tables clean the joining table below references each account/peep relationship.
This table can be used to join the Account and Peep tables when slecting data.

Account/Peep Joining Table
```
account_id | peep_id
-----------------------
      1    |    1 
      1    |    5
      1    |    8
      2    |    2 
      3    |    4
      3    |    7
      4    |    1 
      4    |    2
      4    |    7
```
