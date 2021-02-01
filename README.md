c h i t t e r
=================

Chitter will transmit your thoughts to the entire planet.

We don't screen or filter your "peeps", no matter how inane, inaccurate or offensive.

After you sign up or log in, you can browse Chitter's history or press "Peep!" to send a message.

Our chronologically sorted log will save your peep for posterity so you can never take back or deny what you said.

Sign out when you're done.

<h3>Set up</h3>

Open terminal and connect to psql

Create a database:

```
CREATE DATABASE chitter

```

Connect to the DATABASE

```
\c chitter
```

Create two tables:

```
CREATE TABLE peeps(id SERIAL PRIMARY KEY, date DATE, time DECIMAL(4,2), message VARCHAR, sender VARCHAR);

CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR, password VARCHAR, email VARCHAR);

```

Open terminal and run:

```
bundle install
```

Launch the server using:

```
rackup -p 4567

```

Open a browser and go to:

```
http://localhost:4567

```

Follow the on-screen prompts.


<h3> Testing set up </h3>

Open terminal and connect to psql

Create a database:

```
CREATE DATABASE chitter_test

```

Connect to the DATABASE

```
\c chitter_test
```

Create two tables:

```
CREATE TABLE peeps(id SERIAL PRIMARY KEY, date DATE, time DECIMAL(4,2), message VARCHAR, sender VARCHAR);

CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR, password VARCHAR, email VARCHAR);

```

<h3>Functions</h3>

**Class - peep**

Methods:

- all
   - generates an array of all peeps from the table
   - sorts peeps into reverse chronological order


- create(message: sender:)
  - creates a new peep
  - generates date and time
  - replaces single apostrophes with double apostrophes (otherwise SQL won't accept them)

**Class - user**

Methods:

- create_user(username:, password:)
  - creates a new user


- check_password(password:)
  - checks password associated with username
  - returns true or false


- find_user(username:)
  - searches peeps table for username:
  - returns true or false

<h3>Routes</h3>

**log in and sign up**

- / (asks user to sign_up or log_in)
  - /sign_up  
    - /chitter (if username not taken, sends user to main app)
    - /username_taken (if username already exists; loops back to sign_up to check name)
  - /log_in
    - /no_user (if user doesn't exist)
    - /check_password (checks if password correct)
      - /chitter (if password is correct)
      - /password_error (enter password again if password is incorrect)

**chitter**
  - /chitter (welcomes user by name; displays peeps)
    - /new_peep (allows user to send a new message; loops back to /chitter)
    - /sign_out (lets user sign out)
