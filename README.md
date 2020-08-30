Makers End of Unit Challenge - Chitter Challenge
====

A small Twitter clone that will allow the users to post messages to a public stream.


Instructions
---
### Project Setup
```
$ git clone https://github.com/JR-G/chitter-challenge
$ bundle
```
### Database Setup
```
$ psql

CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```
### To run the app
```
$ rackup -p 3000
```
Then in your browser navigate to `localhost:3000/`

Interface
---
**Home page:**
![Home page screenshot](https://github.com/JR-G/chitter-challenge/blob/master/images/home-page.png)<br><br>
**Sign up:**
![Sign up screenshot](https://github.com/JR-G/chitter-challenge/blob/master/images/sign-up.png)<br><br>
**Making a peep:**
![Making a peep screenshot](https://github.com/JR-G/chitter-challenge/blob/master/images/making-a-peep.png)<br><br>
**Viewing peeps**
![Viewing peeps screenshot](https://github.com/JR-G/chitter-challenge/blob/master/images/viewing-peeps.png)<br><br>
**Sign out:**
![sign out screenshot](https://github.com/JR-G/chitter-challenge/blob/master/images/sign-out.png)<br><br>
**Incorrect email/password message:**
![Failed sign in screenshot](https://github.com/JR-G/chitter-challenge/blob/master/images/incorrect-sign-in.png)

User Stories
---
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
```
As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
Tech Stack
---
Ruby 2.6.5  
Rspec  
Sinatra  
PostgreSQL
