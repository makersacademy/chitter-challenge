### To set this up: ###

git clone https://github.com/tremella/chitter_challenge
$ bundle
$ rake setup
$ rake migrate
$ rspec
$ rackup


## To set up the database: ##

Connect to psql
Create the database using the psql command CREATE DATABASE chitter;
Connect to the database using the pqsl command \c chitter;
Run the queries saved in ./db/migrations/chitter_setup.sql

## The challenge: ##
To make a basic clone of twitter satisfying the following user stories.
(So far, I'm only aiming to meet these 4 out of a possible 7).

```
USER STORIES

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
### Database Schema ###

- I need 2 tables: one for users, one for peeps.
- Importantly, the column user_id will link them.
- Unique keys (user_id) from the user table will be associated
with all peeps ever made in the peeps table

| user_id |     email         | name      | handle      | password |
|---------|-------------------|-----------|-------------|----------|
| 1       | william@gmail.com	| bill      | billy123    | bad_pw   |
| 2       |	jessica@gmail.com | jess      | knock_knock | vbad_pw  |


| peep_id |  content          | time_stamp            | user_id |  
|---------|-------------------|-----------------------|--------------------|
| 1       | 'hi @billy123'    |  2021-04-25 20:26:10  | 2                  |
| 2       |	'hi @knock_knock' |  2021-04-25 20:27:00  | 1                  |
| 3       | 'who's there?'    |  2021-04-25 20:32:24  | 2                  |
| 4       |	'uh..'            |  2021-04-25 20:42:44  | 1                  |

in the above example, user 1 (bill) made peeps 1 and 3, and user 2(jess) made peeps 2 and 4.

### CLASSES ###

Class USER should have attributes of email, username, handle, password, id.
Class USER should make instances of Class PEEP.
Class USER should also be able to sign up - so may need a self.create method.

Class PEEP should have attributes of id, content, time stamp, associated user.
Class PEEP should have Class Methods including self.all and self.create.

USER.MAKE_PEEP should prompt PEEP.SELF.CREATE


### VIEWS/USER JOURNEY ###

One view each for post_cheep, view_all_cheeps and signup. View_all_cheeps and post_cheer should be mutually accessible, but the user should begin on signup which (when successful) will reroute to view_all_cheeps.

(Signup) --> (view_all) <---> (post)

Post/View could share the same page, but that can come later.
