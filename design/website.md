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

## Step 1: Planning pages

|-----------------------------------|
| Homepage                          |
| Links to: Login, Logout, New peep |
| Shows all peeps in reverse        |
| chronological order               |
|-----------------------------------|
      |         ▲       |      ▲
      ▼         |       |      |
|------------------|    |      |
| Login form:      |    |      |
| email, password, |    |      |
| submit           |    |      |
|------------------|    |      |
                        ▼      |
              |------------------|
              | New peep form:   |
              | peep             |
              | submit           |      
              |------------------|



## Step 2: Planning routes

```md
# Page: list of peeps (homepage)

## Request:
GET /
No parameters

## Response (200 OK)
HTML with login, logout and new peep links
HTML view with list of peeps
```

```md
# Page: login

## Request:
GET /login
No parameters

## Response (200 OK)
HTML view with login form to POST /login
```

```md
# Page: login submitted

## Request:
POST /login
With parameters:
  email="email address"
  password="users password"

## Response (200 OK)
If login unsuccessful: HTML view of failed login 
If login successful: Redirect back to homepage 
```

```md
# Page: new

## Request:
GET /new
No parameters

## Response (200 OK)
HTML view with form to submit new peep to POST /new
```

```md
# Page: new peep added

## Request:
POST /new
With parameters:
  content="What a great Sunday"
  name="A name"
  username="Username"

## Response (200 OK)
Redirect back to homepage 
```

## Step 3: Test-drive and implement

You'll now test-drive and implement each route. If your application interacts with a
database to store its data, you'll also have to test-drive and implement other layers of
the program (such as Repository classes) as part of your work.
