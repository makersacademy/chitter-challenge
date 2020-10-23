Chitter Challenge
=================
Week 4 weekend challange for Makers Academy

# Shore

Imagine standing on a beach and a wave washes up a message in a bottle. It could be from a neighbour
or from someone the other side of the world. It could be a joke, a pearl of wisdom or a shopping list.  
One thing is certain, the pure excitement of opening the message remains the same.  
Open shore and visit your personal beach to read messages or cast out your own bottle and see where 
the currents take it.

![post_message](post_message.png)

![homepage](homepage.png)

## Setup

Clone the repo  
Bundle install

## Create Database
- psql -U postgres -c 'CREATE DATABASE shore;'
- psql -U postgres -d 'shore' -f db/migrations/01_create_bottles_table.sql
- psql -U postgres -d 'shore' -f db/migrations/02_create_users_table.sql
\q

## Run
rackup  
visit localhost:9292

## Production notes

The following user stories have been met.

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

The next steps  
- include validation for unique usernames/emails
- login and logout functionality
- password encryption
