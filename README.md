Chitter Challenge
=================

<h2>User stories</h2>
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

EXTRA

As a Maker
So that I can post targeted messages
I want to post messages to a particular conversation
(In order to start a conversation as a maker I want to reply to a peep from another maker)

Configured Rake to serve static resources including CSS and images to make it look good.
```

<h4>Initial thoughts</h4>
- Per user requirements
- A user can view all peeps using threads via my infrastructural design choice (listed via Thread.all)
- A user can create many threads (listed via user.get_threads(user_id))
<h5>Definitions</h5>
- A thread is an identifier with "descendent" peeps (thread.get_peeps(thread_id)).
<br>In other words a thread establishes which "conversation" a peep belongs to, running in parallel with database schema
- A peep is a message representing responses to a given thread.<br>
 NB: Publish date enables chronological ordering in reverse for both thread and peeps (youngest to oldest, top to bottom)

<img src="https://i.gyazo.com/f0bb3e2d3f18129066b2578ff7ad6dca.png"></img>

<h2>Database schema</h2>


<img src="https://i.gyazo.com/9e0c4f0960fe6656001ca0066e2a5bae.png"></img>

<h2>Instructions to connect </h2>

- Connect to psql
- Create the database using the psql command CREATE DATABASE chitter;
- Connect to the database using the pqsl command \c chitter
- Run the query saved in db/migrations/create_tables.sql

```CREATE TABLE IF NOT EXISTS "users" (
   "id" SERIAL PRIMARY KEY,
   "name" varchar(60),
   "email_address" varchar(60),
   "password" varchar(140)
 );
 
 CREATE TABLE IF NOT EXISTS "peeps" (
   "id" SERIAL PRIMARY KEY,
   "content" varchar,
   "published" timestamp default (now() at time zone 'utc'),
   "edited" timestamp default (now() at time zone 'utc')
 );
 
 CREATE TABLE IF NOT EXISTS "user_peeps" (
   "id" SERIAL PRIMARY KEY,
   "thread_id" integer,
   "peep_id" integer,
   "user_id" integer
 );
 
 CREATE TABLE IF NOT EXISTS "threads" (
   "id" SERIAL PRIMARY KEY,
   "published" timestamp default (now() at time zone 'utc')
 );
 
 ALTER TABLE "user_peeps" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
 
 ALTER TABLE "user_peeps" ADD FOREIGN KEY ("peep_id") REFERENCES "peeps" ("id");
 
 ALTER TABLE "user_peeps" ADD FOREIGN KEY ("thread_id") REFERENCES "threads" ("id");
```

<h3>Notes on functionality</h3>

- All primary IDs are serialized and unique
- A user can appear many times on user_peeps
- A thread can appear many times on user_peeps
- Functionality is limited if you're not logged in, but you have access to the feed
- Due to design choice, it is relatively simple to implement notification and have a feed showing peeps distinctly relevant to the user
- An individual peep can only appear once on user_peeps as it belongs to a particular thread
- The application is unable to, outside of explicit tagging, be certain which user a response is targeted towards. <br>
The application can only determine the targeted thread.

- A thread is created at the same time as a peep, 
however for ease of use thread creation is also time-stamped, removing the necessity to find the first peep to implicitly determine a threads birth time.

<img src="https://i.gyazo.com/b458a46868161972b5930a6cf28ddca4.png">
<img src="https://i.gyazo.com/4f56fe6f16720df0aecec51ef1ef9be1.png">

<h3>Future work</h3>
- Add a join table for thread and users to present thread owner (OR) add another column to user_peeps representing the owner of a thread (less preferential)
- Add email functionality with notifications
- Profile image upload
- Integrate industry-standard data mapper (e.g. ROM)