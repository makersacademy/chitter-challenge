# Modelling and Planning a Web application

## Step 0: User stories or specification

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

## Step 1: Planning pages

[![Untitled-2022-08-14-1558.png](https://i.postimg.cc/CxbSL8Yk/Untitled-2022-08-14-1558.png)](https://postimg.cc/v48p0c4Z)

## Step 2: Planning routes
```md
# Page: list of peeps (homepage)

## Request:
GET /
No parameters

## Response (200 OK)
HTML view with list of peeps
```

```md
# Page: log in page 

## Request:
GET /log_in
No parameters

## Response (200 OK)
HTML view of log in form
```

```md
# Page: sign up page

## Request:
GET /sign_up
No parameters

## Response (200 OK)
HTML view of sign up form
```

```md
# Page: new entry added

## Request:
POST /entries
With parameters:
  title="What a great Sunday"
  content="..."

## Response (200 OK)
HTML view with confirmation message
```

## Step 3: Test-drive and implement