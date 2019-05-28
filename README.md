Chitter Challenge
=================

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

-------

Features:

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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

---

![s1](./images/s1.jpg)

---

### User story 1

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

![s2](./images/s2.jpg)

![s3](./images/s3.jpg)

![s4](./images/s4.jpg)

---

### User story 2

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

![s4](./images/s4.jpg)

This require making the databases
* developer environment:
```
CREATE DATABASE chitter;
```
* test environment:
```
CREATE DATABASE chitter_test;
```

And then the first table:
```
CREATE TABLE peep (id SERIAL PRIMARY KEY, message VARCHAR(140));
```

![s5](./images/s5.jpg)

![s6](./images/s6.jpg)

I also decided to add a character min and max during this user story

![s7](./images/s7.jpg)

### User story 3

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

For this I had to alter the table with a new column:

```
ALTER TABLE peep ADD sent_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP;

```

![s7](./images/s7.jpg)

![s8](./images/s8.jpg)

---

### User story 4

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

![s9](./images/s9.jpg)

![s10](./images/s10.jpg)

```
CREATE TABLE account (id SERIAL PRIMARY KEY, handle VARCHAR(20));
```

```
ALTER TABLE peep ADD CONSTRAINT account_id FOREIGN KEY (account_id) REFERENCES account(id);
```

![s11](./images/s11.jpg)

![s12](./images/s12.jpg)

![s13](./images/s13.jpg)
