Chitter Challenge
=================

This project responds to the following brief:

```
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
```

## Project Stack
* Sinatra
* Postgres
* HTML
* CSS

Chitter requires a database called chitter, a table called peeps with columns id and peep. The test databases are exactly the same tables, but the database is called chitter_test.

You can see screenshots of these [here](./peeps_table.png) and [here](./users_table.png)


## Things to Improve/Add

Add log-in capability, peeps with specified authors, timestamp and external css. Use .reverse rather than expensive SQL query when reversing chronological order of peeps. Ultimately use joins for 'users' and 'peeps' tables to link users with their peeps.

Minor edge cases (amongst many) - validation of emails, max peep length, single quotation marks cause errors, the text now strays out of the peep box on the /peeps page, which wasn't happening earlier in the app's life. 



