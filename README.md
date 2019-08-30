# Chitter challenge

## User stories:
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

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
peeps table foreign key
If a user can delete their profile, what do I want to happen to the associated peeps?
* Remove peeps
* Null user_id field
* Don't allow to delete profile

At present, go with option 2 - won't currently allow user to delete profile
but if so, can return null

## To use:
```
git clone
cd chitter-challenge
bundle
```
Set up databases:
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```
Execute the sql scripts in db/migrations, in order, for each db.

OR, from commandline:
```
for file in db/migrations/*.sql;
do
    psql chitter -f "$file"
done
```
AND
```
for file in db/migrations/*.sql;
do
    psql chitter_test -f "$file"
done
```
