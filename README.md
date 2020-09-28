Chitter Challenge
=================

* To start up:
  - Using PSQL, run the commands in the db folder in the two files 00_users... 01_peeps... . This must be done in numerical order as suggested by the filenames.
  - Use rackup to run the webiste.
  - Users have to sign up before you can peep.
  - After signing up once, in another session you can just sign in.
  - The option to sign out is only displayed when you are signed in.

### Improvements needed
- Tests
  - DRY-er code (moving things to web_helpers)
  - More unit tests for the peep class.

- Application
  - Cleaner UI
  - Alert/failure when sign up details are already in use
  - Tagging in peeps (and an email notification about it)
  - Embedded links in peeps

### Features working well
- Conditional links based on session status
- Encrypted passwords (not using Makers walkthrough)


Features:
-------

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

```
