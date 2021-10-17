# Chitter Challenge

## Overview

I sketched out a rough domain model on paper and reviewed the task description and review.md file
I proceeded slowly through the user stories. There were many new concepts and technologies introduced in the past week, so much of my time was spent debugging, meaning I didn't get any further than the minimum user stories. Even then I didn't implement a few technologies in the background.

## Instructions

Run app.rb with your chosen web app DSL and local server, eg Sinatra and WEBrick
Navigate to flow/new several times and post a few messages anonymously
Navigate to /users/new to sign up. Enter dummy data
Re-navigate to flow/new, post a message. Messages will be attributed to you

## User stories that are present

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

**Notes - Messages can be posted without logging in.**

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

**Notes - Messages are in reverse chronological order. This was achieved by calling .reverse_each on the object returned from the sql server, which was the simplest way to do it. Ideally, I would have done this with a specific SQL request instead, to practice those skills**

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

**Notes - Messages have a time stamp. It's not particularly readable but is sufficient**

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

**Notes - Messages can be posted anonymously (but I didn't manage to get these messages attributed to 'Anonymous' via the used of default arguments for ruby keyword arguments). Signing up creates a session that means future messages are attributed, and a user is informed of their user id (see top of flow page after signing up). Using user id isn't ideal but is a proof of concept, as both involve a similar underlying exchange of information with the db**

## User stories that are not present

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

**Notes - neither of the above look too difficult, and it would contribute much to the user experience. Would be good to return to**

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

**Notes - I presume this would use an email api. It seems like an interesting challenge to return to**

## Missing technologies

I haven't used exec_params. This was not a core feature, as there is no public access to the server or anything worth stealing at the moment (though passwords might count, as people often re-use passwords).

I haven't implemented a test database. This is relatively straightforward but time consuming as it involves a new class. The test database will also have to be cleared after each call.

I haven't implemented user authentication, ie login and logout. *This feature is the priority for the future, as it has a great impact on useability.*

## Further comments

I would have liked more feature and unit tests, and made use of helpers.