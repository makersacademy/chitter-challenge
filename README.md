### To set this up: ###

git clone https://github.com/tremella/chitter_challenge
$ bundle
$ rake setup
$ rake migrate
$ rspec
$ rackup


```
USER STORIES (4/7)

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
- Importantly, the column associated_user_id will link them.
- Unique keys (user_id) from the user table will be associated
with all peeps ever made in the peeps table

| user_id |     user_email    | user_name | user_handle | password |
|---------|-------------------|-----------|-------------|----------|
| 1A      | william@gmail.com	| bill      | billy123    | bad_pw   |
| 2A      |	jessica@gmail.com | jess      | knock_knock | vbad_pw  |


| peep_id |  content          | time_stamp | associated_user_id |  
|---------|-------------------|------------|--------------------|
| 1       | 'hi @billy123'    |  1.00      | 2A                 |
| 2       |	'hi @knock_knock' |  1.05      | 1A                 |
| 3       | 'who's there?'    |  1.32      | 2A                 |
| 4       |	'uh..'            |  2.10      | 1A                 |

in the above example, user 1a (bill) made peeps 1 and 3.

### CLASSES ###

Class USER should have attributes of email, username, handle, password, id.
Class USER should make instances of Class PEEP.
Class USER should also be able to sign up - so may need a self.create method.

Class PEEP should have attributes of id, content, time stamp, associated user.
Class PEEP should have Class Methods including self.all and self.create.

USER.MAKE_PEEP should prompt PEEP.SELF.CREATE
