## User stories provided (for feature testing):



## User stories I have extracted for unit testing:


## Approach:
- Before starting the challenge, I read about the Object Relational Mapper and Travis as they seem like some things I might need.
- I've also done some background reading on storing passwords
- New step in my weekend challenge - CRCs - this builds upon the Nouns and Verbs and my notes are stored XXX
- Follow my weekend challenge notes as a basis (https://github.com/samanthaixer/Notes/blob/master/WeekendChallengeApproach.md)

- Step 1 - created the database and the message table
- Step 2 - TDD'd the creation of a peep (message)
- Step 3 - Built out functionality to view the peeps and order them
- Step 4 - created the user table
- Step 5 - TDD'd the signing up as a user
- Step 6 - built in error handling for duplicate usernames or email addresses
- Step 7 - improved test coverage for previous error handling step
- Step 8 - built in functionality for signing in and out
- Step 9 - build in functionality to display the user for each peep - TODO
- Step 10 - make user interface nicer (images?) - TODO
- Step 11 - update README - TODO
- Step 12 - figure out how to use an ORM Adapter - TODO
- Step 13 - Run rubocop and fix any not related to line length
- Step 14 - check for single responsibility

## Nouns and Verbs




##  - current progress




# Active Record ORM things to note
### single class with pluralised table
- e.g. Book class, books table
- e.g. BookClub class, book_clubs table

### foreign key naming convention
singularised table name id e.g. book_id

### primary key naming convention
by default, Active Record will use id for the primary key
