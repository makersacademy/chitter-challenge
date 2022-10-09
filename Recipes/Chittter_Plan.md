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
### STRAIGHT UP
Goals
1. Post a message (peep) to Chitter
- Add a peep
- With a timestamp (part 3)
- Maker's username 

2. List all peeps in reverse chronological order
- Using timestamp, list peeps in reverse chronological order

3. Include time of peep
- Add timestamp parameter to each peep 

4. Sign up for Chitter (using a form)
- Email
- Password
- Full name
- Username  
(e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).

Notes
- The **username** and **email** are _**unique**_.
  - If the username and email exists, prompt the user to either
    - Log in
    - Use a different email address / username 
  
- Peeps (posts to Chitter) have the **name** of the maker and their **user handle**.


## Step 1: Planning pages

You'll have to adopt the perspective of a user browsing your website. 
1. What are the different pages that they will use? 
2. How does the user navigate to these pages (links, forms)?

At this point, it's good to do a small diagram of the different pages and their
relationship. If you want to do more complex mockups with the details of the elements on
the page, you can also do it, but it's not necessary to go into this level of detail for
this step.




## Step 2: Planning routes

Remember that a web application flow is all based on the HTTP request-response cycle, from
the web browser to the server application. You'll now need to draw your routes from the
pages you planned at the previous step.

This time, we're switching from the user perspective to the HTTP application engineer's
perspective - thinking of the application's behaviour in **requests and responses**, rather
than pages.

For example:

* A page (such as the home page) is usually returned by a `GET` route. For example, the
  home page (which is almost always the first route you'll start with), is usually `GET
  /`.
* If the user navigates to a different page using a link, you will need a `GET` route for
  this other page.
* If the user submits a form that leads to a different page, you will need a `POST` route
  to submit this form to.

From the pages planned above, here are the routes we could plan. Once again, this is only
a possible list of routes for this case — you could come up with slightly different ones,
which would still satisfy the initial user stories.

```md
# Page: Chitter Homepage

## Request:
GET /
No parameters

## Response (200 OK)
HTML view with* : 
1. Chitter logo as text (top left)*
2. Sign up (Top right) -> Redirect to GET /signup
3. Sign in (Top right)* 
4. See peeps -> Redirect to GET /peep

* Not essential at this stage 

```

```md
# Page: Sign up for a Chitter account

## Request:
GET /signup
No parameters

## Response (200 OK)
HTML view with form to sign up (to POST /signup)

User signs up with:
- Email
- Password
- Full name
- Username  
  (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).

Notes
- The **username** and **email** are _**unique**_.
  - If the username and email exists, prompt the user to either
    - Log in
    - Use a different email address / username 
  
  - Reset form by directing to the GET /signup? 
  - OR leave form as is to let the user amend 


```

```md
# Page: User signed up for Chitter account

## Request:
POST /signup
With parameters:
  username="New_Makers_peep"
  emailaddress="newmakers@makers.com"
  password="password321"
  name="Makers Academy"

## Response (200 OK)
HTML view with confirmation message: "New account created with @username"

With a button to go 'Home'

Redirect to get '/'
- List of test peeps 
Maybe 
- Form to add a peep 
```

```md
# Page: List of peeps 

## Request:
GET /peeps
No parameters

## Response (200 OK)
HTML view with list of peeps in reverse chronological order

Each peep has
- Username
- Name 
- Message
- Timestamp
- peep-id (hidden?)
```

```md
# Page: see full entry 

## Request:
GET /peeps/:id
With path parameter :id

## Response (200 OK)
HTML view with details of a single peep with
- Username
- Message
- Timestamp
- peep-id (hidden?)

```

```md
# Page: add a new entry

## Request:
GET /peeps/add
No parameters

## Response (200 OK)
HTML view with form to submit new peep (to POST /peep)

Note:
- User has to sign up before (How to know when a user is signed up?)

Add a new peep with 
- Username (??)
- Message
- Timestamp
- peep-id (hidden?)

```

```md
# Page: new entry added

## Request:
POST /peeps
With parameters:
  username="Makers_peep"
  content="Makers test peep"

## Response (200 OK)
HTML view with confirmation message

OR

Redirect to get '/'
- User can see their peep with a timestamp AND
- List of test peeps 
```

## Step 3: Test-drive and implement

You'll now test-drive and implement each route. If your application interacts with a
database to store its data, you'll also have to test-drive and implement other layers of
the program (such as Repository classes) as part of your work.

![](/Users/saritaradia/Desktop/Screenshots/Screenshot 2022-10-07 at 18.05.57.png)

