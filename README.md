# Chitter

I have built a Twitter clone that allows the users to post messages to a public stream.

To use the app:
-------
1. Connect to ``psql``
2. Create the production and test databases using the psql commands ``CREATE DATABASE chitter;`` and ``CREATE DATABASE chitter_test;``
3. Connect to the production database using the pqsl command ``\c chitter;``
4. Run the queries saved in the files in db/migrate folder: ``01_create_user_table.sql``, ``02_create_message_table.sql``, ``03_create_timestamp_function.sql``, ``04_create_tag_table_sql``.
5. Repeat steps 3-4 for the test database
6. Run ```shotgun``` in the terminal to access the app

Note: Tagging/email: The environment variables for the email address / password have to be set in your local env in order to send emails to tagged users

Completed Features:
-------

```
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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter


As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
Screenshots:
-------
![main](https://github.com/Aracho1/chitter-challenge/blob/master/public/screenshots/main.png)
![sign_up](https://github.com/Aracho1/chitter-challenge/blob/master/public/screenshots/sign_up.png)
![message_board](https://github.com/Aracho1/chitter-challenge/blob/master/public/screenshots/message_board_tags.png)
![edit_message](https://github.com/Aracho1/chitter-challenge/blob/master/public/screenshots/edit_message.png)
