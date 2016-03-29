Chitter Challenge
=================
[![Build Status](https://travis-ci.org/paulalexrees/chitter-challenge.svg?branch=master)](https://travis-ci.org/paulalexrees/chitter-challenge)

Author: Paul Rees 29/03/16

Here is my contribution to the weekend Chitter Challenge.


**Home**

The Chitter homepage will display a list of the latest peeps from users who have posted them. The text box for writing peeps will not show unless a user is logged in.

**Sign Up**

The Sign Up Page allows a user to register their details:

* Name
* Username
* Email
* Password
* Password confirmation
* Mobile phone number (optional)

Signing up requires a unique username and email address.
Successful sign up takes the user back to the index page and signs them in.

**Sign Out and Sign In**

A signed in user can sign out from the index page, which brings back the *Sign Up* and *Sign In* buttons. Signing in requires your username and password.

**Text Integration**

I used the Twilio gem to receive text messages - if a user has signed up with a mobile phone number (in 01234567890 format), the /sms route should recognise the incoming text message's number via `params[:From]` (having been converted to +441234567890 format) and post the `params[:Body]` as a new peep from that user.

**Incomplete features**

I began implementing deletion of tweets but ran out of time. A trash can icon appears only on tweets belonging to the logged in user but has no functionality.
