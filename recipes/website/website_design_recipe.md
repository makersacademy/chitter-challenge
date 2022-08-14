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

[![Untitled-2022-08-14-1558.png](https://i.postimg.cc/br6fW0xf/Untitled-2022-08-14-1558.png)](https://postimg.cc/GTsfsygX)

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
# Page: see full entry 

## Request:
GET /entries/:id
With path parameter :id

## Response (200 OK)
HTML view with details of a single entry
```

```md
# Page: add a new entry

## Request:
GET /entries/add
No parameters

## Response (200 OK)
HTML view with form to submit new entry (to POST /entries)
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

You'll now test-drive and implement each route. If your application interacts with a
database to store its data, you'll also have to test-drive and implement other layers of
the program (such as Repository classes) as part of your work.

## Challenge

Model and plan the pages and routes for the following web application, which is a game of
Rock Paper Scissors. Test-drive and implement it if you'd like an extra challenge.

```
As a Maker
So I can play Rock Paper Scissors
I would like to enter my move on the home page
And click to confirm my move (rock, paper or scissors)

As a Maker
So I can play Rock Paper Scissors
I would like the opponent's move to be decided randomly by the program

As a Maker
So I can play Rock Paper Scissors
I would like to see the result of the game on the next page

As a Maker
So I can play Rock Paper Scissors again
I would like to click on a link on the result page
So it takes me back to the home page
```