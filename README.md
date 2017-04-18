Chitter Challenge
=================

Challenge:
-------

Write a Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Approach
- First of all after reviewing the user stories I determined a rough user experience and journey.
- From that understanding I designed a class model.
- Which then allowed me to map out the relationships between a user, multiple peeps and other users.
- After which I started to write my first pieces of code following TDD principles.


## How to run
Navigate to: http://immense-everglades-69491.herokuapp.com/peeps


## Tools/Languages

- Ruby v 2.4.0
- RSpec
- Sinatra
- Capybara
- Timecop
- BCrypt
- DataMapper ORM


## Future enhancements...
- Sending user token for password reset journey.
- Replying to peeps.
- Displaying a profile page of only the users peeps.
- Profile pictures.
