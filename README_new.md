# README

## User Stories

>As a Maker
>So that I can let people know what I am doing  
>I want to post a message (peep) to chitter

>As a maker
>So that I can see what others are saying  
>I want to see all peeps in reverse chronological order

>As a Maker
>So that I can better appreciate the context of a peep
>I want to see the time at which it was made

>As a Maker
>So that I can post messages on Chitter as me
>I want to sign up for Chitter

## Database Setup
1. Connect to 'psql'.
2. Create database using 'psql' command:
```
CREATE DATABASE chitter;
```
3. Connect to newly created database:
```
\c chitter;
```
4. Run scripts in 'db/migration' directory in order.

## Test Database Setup
1. Connect to 'psql'.
2. Create database using 'psql' command:
```
CREATE DATABASE chitter_test;
```
3. Connect to newly created database:
```
\c chitter;
```
4. Run scripts in 'db/migration' directory in order.
