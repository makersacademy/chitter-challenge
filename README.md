# Chitter challenge

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
Replace the example.env with a .env file. Add your Mailjet API keys, and domain email address (note - with a public email address any emails sent will go to spam).

## TODO:

Allow users to tag others users in posts.

## User stories:
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter ✅

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter ✅

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter ✅

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter ✅

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order ✅

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made ✅

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
