STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter    (form for the peep)

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order   (all.reverse)

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made    displays time with peeps ( def time in peep class)

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter  (learn how to do this)

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter        (learn how to do this, user authetification?)

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter      (learn how to do this, user authetification?)

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep


```ruby

# Homepage: displays list of peeps in reverse chronological order:

## Request:
GET /
No parameters

## Response (200 OK)
#HTML view with list of peeps in reverse chronological order
# displays whether the user is logged in or not (link to log out if logged in, link to log in if not logged in)

# Homepage: displays list of peeps in reverse chronological order:

## Request:
GET /write
No parameters
#if logged in
## Response (200 OK) - You just peeped!(flash notice?)
# HTML form to create the peep (takes content and timestamp of the entry)
# if not logged in 
## Response (200 OK) - You need to log in to peep!

## Request:
GET /signup
No parameters

## Response (200 OK) - goes back to home poage (flash 'sign up success')
# HTML form to sign up to chitter

## Request:
GET /login
No parameters( username and password?)

## Response (200 OK) -
# HTML form to complete to login to chitter

POST / login

## Response (200 OK) - goes back to home page if success (flash 'sign in success'). Stays on page and displays error message if fail
# recieves email and password - verifies the password - stores a new variable in the session to say the user is logged in
# redirects to home page


## Request:
POST /logout
No parameters

## Response (200 OK) - goes back to home page if success (flash 'log out success')
# Log out button logs user out of chitter


