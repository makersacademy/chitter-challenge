# Development Notes

The below contains my development notes and course of development. Note these are largely unedited.

Domain model & CRC Cards: https://docs.google.com/spreadsheets/d/1n7Jcf08kXf7UYjEGKVqBzyhoxwa44A7R4Y4w0MMAbaA/edit?usp=sharing
Miro Board:

Plan is to implement the user story one by one and build up the domain model and CRC cards as the user stories are developed - following TDD and avoid implementing any unnecessary requirements.

NOte I have decided to call my app Shouter and you Shout!

## USER STORIES and FEATURES

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

DONE

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
> Peeps should have a time stamp, author, content
> display all peeps in chronological order

DONE

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

>already implemented time
> will now implement a database model

DONE

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

> going to add a sign up to chitter button - DONE
> display a sign up screen - DONE
> if signed in show on main page - DONE (with signout button)
> create a user class and user database - DONE
> update shouts database to user the author id - DONE

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

> Set up a login sheet - done
> create a login method in Users class - DONE - didn't need, just used incorrect_login method to verify credentials and then sets the session up.

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

> set up sign out button to close out session - DONE


As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

>> send an email to look into - NOT YET DONE


* You don't have to be logged in to see the peeps. - DONE
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog). - DONE
* The username and email are unique. - DONE
* Peeps (posts to chitter) have the name of the maker and their user handle. - DONE - only their usual handle (name is not necessary)

>> encrypt passwords and email - encryted passwords - haven't done on email (not needed) - DONE
>> add a random anonymous shouter - DONE - if not logged in you will shout as one of 4 anonymous people
>> create anonymous shouter class - DONE
>>In order to start a conversation as a maker I want to reply to a peep from another maker. - DONE
  > Feature test for reply - DONE
  > Replies box with number on index erb - DONE
  > click on the replies box to see replies and add your reply - DONE
  > Replies page has reply box with original shout and exisiting replies below it. - DONE
  > replies database has link to number of replies - DONE
>> add pictures of people shouting - decided not to add
>> Program is vulnerable to SQL injection - need to write a substitute method (and de substitute with gsub) - ', ", \, NUL or implement an ORM
>> don't allow certain letters in name, username or password, also need to validate email.
>> extract a shout class
>> code review rubric
>> Ensure Travis working
>> ORM?
>> how to get rid of the notice on rspec it drops cascades


* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
---
