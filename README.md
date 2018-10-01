Chitter Challenge
=================

This is the first 4 "straight up" main tasks for this 'Friday' challenge.

The user stories that I covered are described below and some are also included within the Capybara spec file.


Gems used
---------
Capybara
pg
Shotgun
Sinatra


Additional Notes
----------------

The instructional 'peeps', I have actually called 'chits' for this challenge.

Although my tests are passing with 100% coverage, I could have tested for more of the functionality ie the timestamps on the user 'chits'.

I thought about installing a 'timecop' solution for this so that I can freeze time during testing, and using something like
'it { expect(chit.created_at).to be_kind_of(DateTime) }'
... but in the remaining weekend time I was worried about breaking my code. And I had not reached the exercise on setting up separate methods to accommodate 'CRUD'.

Also, we did not cover the challenges within the weeks pairing exercise on this subject that would have been helpful for the later user stories in this particular "Friday" challenge. Looking back, these would have been very useful for the 'harder' and maybe 'advanced' sections. Of note is User Story 4, where my "sign up" is more of a logging of the name of the user.


User Stories
------------
```
User Story 1
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

User Story 2
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

User Story 3
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

User Story 4
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
