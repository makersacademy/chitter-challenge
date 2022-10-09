# Modelling and Planning a Web application

## Step 0: User stories or specification

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

## Step 0.2: Planning tables

Table: users
- login
- password
- email

Table: peeps
- content
- tagged_users
- date
- time
- user_id

## Step 1: Planning pages

## Step 2: Planning routes

# Page: Homepage

## Request:
GET /
No parameters

## Response (200 OK)
- Welcome message (DONE)
- Peeps feed (chronological order) (DONE)
- If logged out => Sign up and Log in buttons (DONE)
- if logged in => Displays username + Log out button (DONE)

# Page: Sign up page

## Request:
GET /signup
No parameters

## Response (200 OK)
- Returns sign up form to put: username, password, real name, email (DONE)
* Fails to access if logged in (DONE)

## Request:
POST /signup

## Response (200 OK)
- Validates all fields (DONE)
* Needs to prevent harmful code
- If user can't be saved => displays error messages (DONE)
- If user saved => displays message Account created and gives link to login page  (DONE)

# Page: Login page

## Request:
GET /login
No parameters

## Response (200 OK)
- Returns login form: username and password (DONE)
* Fails to access if logged in (DONE)

## Request:
POST /login

## Response (200 OK)
- Validates password (DONE)
- If password incorrect => displays Error message (DONE)
- If password correct => redirects to home page (DONE)

# Page: Create Peep

## Request:
GET /peep
No parameters

## Response (200 OK)
- Returns create peep form: content, tag user
* Fails to access if logged out

## Request:
POST /peep

## Response (200 OK)
- Validates content not empty and tagged user exists
* Needs to prevent harmful code
- If success => Success message and link to home page
- If failure => Failure message

# Page: Logout

## Request:
GET /logout
No parameters

## Response (200 OK)
- Returns erb :logout "You logged out!" + Link to homepage (DONE)
* Fails to access if logged out (DONE)
