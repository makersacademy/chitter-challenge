# Makers Academy Weekend Challenge 4 - ChitterApp #

This app is a basic concept of a twitter style app wherein users can post peeps and they are shown in a reverse chronological order. I could have gone a lot further than I have done with this project, save for my being time poor over the weekend, however most of the basic functionality has been implemented.

## What I learned ##
- Reinforced learning of the week interacting with SQL database using postgresql.
- Used SQL datatypes to streamline the code and make the retrieval of the peeps in reverse chronological order nice and simple
- Used relational databases so that a table was able to store a foreign key from another table to speed up the efficiency of looking up data.
- Showed basic implementation of CSS (again not likely i'll spend a lot of time on this, i'm not a designer)

## Left to complete ##
- I've not added authentication for users passwords at the moment, would use Bcrypt to do this given time.
- Haven't used an ORM, simply re-purposed our basic one used from the afternoon challenge.
- Haven't implemented the replying to peeps functionality, I don't however see this as being an issue. My thinking here would be that I would store a peepid of replies in a new column called replies under the original post. I could then retrieve this id's as an array for example and within the list element call another .each block to list each of the replies as a sub point of the original. It would be worth adding a boolean value to each row for 'is_reply?' as well so that replied peeps aren't shown on their own in the peeps feed but rather only in the context for which they were meant.
- Didn't implement the users getting an email when tagged functionality. I'd guess that to do so I could use a regexp to check the body of a peep for "@user" and do a lookup for that user's details and pop them an email to notify them that they've been tagged.
- Didn't do a rake setup, or migrate
- Did not test properly at all, in fact the entire project was built using rackup to load the app in the browser, this was a poor design decision and came from a lack of time, though I acknowledge that I likely could have achieved more in less time with better testing.

## Final thoughts and notes on this project ##

I didn't have a lot of time to spare over the weekend to work on this, however I understand that in a few weeks we'll be revisiting the project in javascript. The learning objectives for the week were that we learn what databases are, how to interact with them, their structure and making webapps be able to persist data. I'd definitely shortcut a few things on the project, making the class for Chitter use the singleton method to hold a logged in user for example, however I'm not too concerned about that right now. Fundamentally I understand all the interactions taking place on the stack and I'd be comfortable employing a different framework, using an ORM or adding in gems to handle things like encryption (i've seen Bcrypt before) and emailing users. Given time to work on this project, I'd feel comfortable that I could build out all relevant functionality with some ease, but I suppose given enough time anyone could do anything. Anywho.

# IMPORTANT SETUP INSTRUCTIONS #
$ git clone https://github.com/djvcom/chitter-challenge.git
$ bundle
$ rake setup
$ rake migrate
$ rspec
$ rackup

# LINK TO WORKING WEBAPP (GITHUB.IO?) #

# IMPLEMENT THE KEY FEATURES #
  - Sign up - done
  - Log in - done (no password authentication)
  - Log out - done
  - Peeping - done
  - Listing Peeps - done
  - Display time of peep - done
  - Replying to peeps - *not done*
  - CSS styling - done (not pleasing to look at but is working)
