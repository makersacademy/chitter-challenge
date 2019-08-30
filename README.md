# Chitter challenge

## User stories:
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
The peeps table does not have referencing f_key user_id, as I want to be able to see who posted even if they no longer have an account.

## To use:
```
git clone
cd
bundle
```
Set up databases:
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```
Execute the sql scripts in db/migrations, in order, for each db.
