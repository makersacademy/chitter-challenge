Chitter Challenge
=================

A twitter clone that allows users to post messages to a public stream.

User Stories:
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
| Nouns | Actions |
| ------ | ------ |
| message | post to chitter |
| peeps | see in reverse chronological |
| time | see when the peep was made |
| chitter | sign up |
|  | log in |
|  | log out |

### class: peep
| responsibilities | collaborators |
| ---------------- | ------------- |
| create a new peep | |
| time | |

### class: list_peeps
| responsibilities | collaborators |
| ---------------- | ------------- |
| view all peeps in reverse chronological order | peep |

### class: membership
| responsibilities | collaborators |
| ---------------- | ------------- |
| let users sign up | list_peeps |
| let users log in | |
| let users log out | |


### dbname: all_peeps
| id | user_id | peep | time |
| --- | ------ | ---- | ---- |
| 1 | 1 | "hello chitter" | 14:12 |
| 2 | 1 | "two peeps in a row" | 14:13 |
| 3 | 2 | "foo bar" | 14:15 |


### dbname: users
| id | username | email |
| -- | -------- | ----- |
| 1 | charlie2000 | charlie@makers.com |
| 2 | franky365 | franky@makers.com |


Relationship:
1 user can make many peeps
Chitter can have many users

## To Set up databases
In psql run the code in the db/migrations folder also creating a test version

## To Run the app
run `bundle`
run `rackup -p 9000`
and then navigate to `localhost:9000`

## To Run tests
run `rspec`

## Current Issues
- no password feature implemented
- usernames are linked to the session and not to the database
- tables needs to link via user_id not username using INTEGER REFERENCES
- users can sign in without a valid username and can sign up multiple times (needs UNIQUE to feature in the username and email columns)
- signing out changes the session to nil whereas should be sessions.clear


Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
