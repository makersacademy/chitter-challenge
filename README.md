Chitter Challenge
=================

([Link to original README](./original-README.md))

## Getting started

_PostgreSQL should be installed_

```sh
git clone git@github.com:dafuloth/chitter-challenge.git
cd chitter-challenge
bundle

ruby app.rb

```

## Database setup

```sql
psql

CREATE DATABASE chitter;

\c chitter
CREATE TABLE peeps (id SERIAL PRIMARY KEY,
                    timestamp timestamptz NOT NULL,
                    peep VARCHAR(140) NOT NULL);

CREATE DATABASE chitter_test;

\c chitter_test
CREATE TABLE peeps (id SERIAL PRIMARY KEY,
                    timestamp timestamptz NOT NULL,
                    peep VARCHAR(140) NOT NULL);

```
Databases can be populated with the test data as follows:

```sql
psql chitter < ./db/migrations/02_peeps_test_data.sql
psql chitter_test < ./db/migrations/02_peeps_test_data.sql

```


## Features

My approach is to tackle the "_seeing peeps_" features first since they do not require signing up or posting (which requires signing up).

### Design choices: The Single-Page Application
Having personally experienced the inadequacies of a web app ([Bookmark Manager](https://github.com/dafuloth/bookmark_manager)) that must transition between multiple views/pages, I am aiming for a [single-page app](https://en.wikipedia.org/wiki/Single-page_application) with this project.

Benefits of a Single-Page App:

- Better user experience, no jarring transitions between pages/views. Simpler navigation. 
- Without having to follow program flow from controller to view, or view to view, the app is easier to debug


### **See all peeps**

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker  
So that I can better appreciate the context of a peep  
I want to see the time at which it was made  

```

![See all peeps in reverse chronological order](./chitter1.svg)

See all peeps in reverse chronological order, and they should show the time they were made. I consider these two features to be related as it would make sense that listing peeps in reverse chronological order would also take into account the time they were posted.
<br><br>



### **Post a peep**

```

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

```


## TO DO

### **Sign up for Chitter**

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

```

### **Others**
```
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

## Links

[Draw.io](https://www.draw.io/) - For drawing diagrams