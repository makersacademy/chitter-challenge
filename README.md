Chitter Challenge
=================

Quick start
___
Need to add steps here for setting up the database etc.

User Stories
___
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
To sign up, users press the 'Sign up' button on the peeps
(add screenshot). This takes them to a registration page (route /users/new), with a form to fill in. Users enter their name, email and password and press the Sign up button.

This is routed to post /users where a new User is created in the .create method in the User class and the user_id is saved to the session.

The .create method in the User class encrypts the password entered by the user using BCrypt, and inserts into the user table. It returns the user as a class instance.

```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
An existing user can log in by pressing the 'Log in' button on the peeps. This takes them to a log in form (route sessions/new). Users enter their email address and password.

This is routed to post /sessions where the authenticate method is called on the User class to verify if the correct username and password have been entered.

If the email does not exist in the database, or the password doesn't match (unhappy paths) then the user is given the message: 'Please check your email or password.'

The authenticate method queries the database for users with the email address entered. If the email is found in the database then the password entered is checked against the password entered (using BCrypt). If this matches then a user instance is created and returned (happy path).

If a users is authenticated their user id (the primary key from the database) is stored in the sessions hash.

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
To log out of Chitter the user presses the 'Log out' button on the peeps screen.

This routes to /sessions/destroy which clears the user id from the sessions hash and serves a message to the page: "You have logged out."

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
Once the user has logged in, a form is available to them to type messages and press the Peep button.

When they type out a Peep this routes to /peeps/new which calls the .create method on the Peep class. This method takes the peep text from the form and the user id from the session. This method then inserts this into the peeps table in the database, and the database automatically generates an id and timestamp, which is returned.

This method also finds the user using the method .find on the User class in order to return the users name. The .find method queries the user table using a WHERE clause to access the users information then stores this in an instance of a user class.

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
The method .all in the Peeps class queries the database using a left join query to return the peep, date and username and an ORDER BY date desc to achieve reverse chronological order. This is then converted into an array of Peep instances.

The app.rb stores the result of Peep.all in an instance variable so the view can access this. The view then loops around this array, inserting each peep into a html list, displaying the user name (in bold), and date (in format dd mmm yyyy hh:mm) and tweet below.
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
As part of displaying the peeps in reverse chronological order, the date is also accessed from each Peep instance and displayed in the browser
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
Haven't implemented this one yet

Known issues:
---
1. There are currently no checks in place to ensure a user trying to sign up doesn't already exist. Need to add a guard clause for this with a useful message to the user.

Future developments
---
1. Add some more buttons to assist with navigating:
  - On register page add a back button
  - On log in page add a sign up button (or maybe as a link)
2. Allow customers to delete their own peeps
3. Add capability to heart peeps you like
4. Add capability to reply to peeps and start a thread
5. Be able to load pictures / gifs and videos
5. Add CSS
6. Tests could be refactored - currently there's a lot of repetition
