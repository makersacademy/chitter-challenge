c h i t t e r
=================

Chitter will transmit your thoughts to the entire planet.

We don't screen or filter your "peeps", no matter how inane, inaccurate or offensive.

After you sign up or log in, you can browse the message history or press  "Peep!" to send a message.

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
