## Project Overview
## Processes & Approach

#### REQUIREMENTS

This project is part of Week 4 of the Makers Academy 12-week software engineering programme. 

The aim of this project is to build a small Twitter clone called Chitter that will allow the users to post messages to a public stream.

#### Features (USER STORIES)

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


With my notes, I will go through the TDD process.

- USER STORY
- FEATURE TEST
- UNIT TEST
- CODE IMPLEMENTATION
- FEATURE TEST


#### TECHNICAL IMPLEMENTATION

I used a test-driven development approach to create the simple web app with a form using the `sinatra` MVC framework.

For each user story, I sketched out the features and then wrote some feature tests to capture the end-to-end user flow. I used Capybara for feature testing the user flow, with extensions for RSpec.



### USER STORY 1
[X] > As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter


##### VIEWS
[X] - Main page (Peeps page)
[X] - New peep

##### CONTROLLER ROUTING / ACTION

[X] - Display a list of peeps

```
GET
URL: /peeps
Controller: peeps
Action: index
```

[X] - Return message box/form for adding a new peep
On Main page (Peeps Page) - clickable link to go to /peeps/new

```
GET
URL: /peeps/new
Controller: peeps
Action: new
```

[X] - Create a new peep

```
POST
URL: /peeps
Controller: peeps
Action: create
```

- Display a specific peep

```
GET
URL: /peeps/1
Controller: peeps
Action: show
```

##### USER JOURNEY
The user will first go to the Main page (Peeps page), they will see a list of peeps from latest to oldest. They will click a button to go to the add new peep form, where they will enter a message and submit the peep.

##### CLASSES/OBJECTS (MODEL)

- New peep (message)
  nvarchar limit? 60?

##### DATABASE MODEL

Notes:
* You don't have to be logged in to see the peeps.


## Test Cases

1. 

---

### USER STORY 2
[X] > As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order


##### VIEWS
- Main page (Peeps page)

##### CONTROLLER ROUTING / ACTION

- See list of peeps from latest to oldest peep

```
GET
URL: /peeps
Controller: peeps
Action: index
```

##### USER JOURNEY
On the Main page (Peeps page), the user will see a list of peeps from latest to oldest.

##### CLASSES/OBJECTS (MODEL)


##### DATABASE MODEL

## Test Cases

1. 

Notes:
* Peeps (posts to chitter) have the name of the maker and their user handle.

----


### USER STORY 3
[X] > As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made


##### VIEWS
- Main page (Peeps page)

##### CONTROLLER ROUTING / ACTION

- See list of peeps from latest to oldest peep

```
GET
URL: /peeps
Controller: peeps
Action: index
```

##### USER JOURNEY
[X] On the Main page (Peeps page), the user will see a list of peeps from latest to oldest, each peep will have a date/time stamp.

##### CLASSES/OBJECTS (MODEL)


##### DATABASE MODEL

See: chitter-challenge/db_table_model.png
[X] - Automatically update the date / time stamp when a new row is inserted into peeps table in db?



## Test Cases

1. 

----


### USER STORY 4
[X] > As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter


##### VIEWS
- Sign up

##### CONTROLLER ROUTING / ACTION

- Sign up page

```
GET
URL: /registration/signup
Controller: registration/signup
Action: signup
```

##### USER JOURNEY
[X] On the Main page (Peeps page), the user will click a sign-up button, taking them to the sign-up route/view. They will see a sign-up form.

The sign-up page will have:

- Full Name
- UserName (Chitter handle)
  Check it is unique
- Email
  Check it is unique
- Password
  For security, need to hash passwords

- [X]Create the users table.
- [X]Feature test for registration.
- [X]User form and route structure.
- [X]Create a User model for registration, and saving the user ID to the session.
- [X]Make the password secure.

##### CLASSES/OBJECTS (MODEL)


##### DATABASE MODEL

Notes: 
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.

## Test Cases

1.


----


### USER STORY 4
[X]> As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter


##### VIEWS
[X]- Log in

##### CONTROLLER ROUTING / ACTION

- Log in page

```
GET
URL: /registration/login
Controller: registration/login
Action: login
```

##### USER JOURNEY
[X]On the Main page (Peeps page), the user will click a sign-up button, taking them to the sign-up route/view. They will see a sign-up form. After login, redirect user to main page (peeps page).


##### CLASSES/OBJECTS (MODEL)

[X]- Possibly set `session[:user_id]` to the `user_id`

##### DATABASE MODEL

## Test Cases

1.

-----

### USER STORY 4
[X]> As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter


##### VIEWS
- Log out

##### CONTROLLER ROUTING / ACTION

- Log out page

```
GET
URL: /registration/logout
Controller: registration/logout
Action: logout
```

##### USER JOURNEY
[X] On the Main page (Peeps page), the user can click a log-out button to log out of their session. After logout, redirect user to main page (peeps page). 


##### CLASSES/OBJECTS (MODEL)

[X]- `session[:user_id]` to the `user_id`, so have to clear session data for the user which has logged out. 

##### DATABASE MODEL

## Test Cases

1.



## Improvements/enhancements:

Next time I come round to looking at this I want to:

- Apply some CSS to improve the look and feel of the Chitter app
- There were requirements for uniqueness and validation of the user input:
  I would like to apply messages to the user if the user input is invalid format or the username, email 
  have already been taken (non-unique)
- I would like to extract the database connection class and wrap the PG functionality within that
- Remove the duplicate functionality of passing in the user_id and username in the 'create' method for a new peep
- Hosting solutions for the app
- Tidy up the SQL scripts
