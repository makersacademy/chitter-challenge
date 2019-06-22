# Chitter Challenge

For this challenge I will build a small Twitter clone that will allow the users to post messages to a public stream. These messages are known as 'peeps'.

The full instructions I was given for this project can be found in `challenge-instructions.md`.

## Progress



## Set-up

### Download and run Chitter app

In the command line enter the following:

```sh
$ git clone git@github.com:rhysco8/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ rackup
```

<!-- ### Database

1. Connect to psql (`psql` in the command line)
2. Create the database
```
# CREATE DATABASE chitter;
```
3. Connect to the database
```
# \c chitter
```
4. Run the SQL scripts in `db/migrations` folder in the given order
5. Enter `\q` to exit -->

## Approach

I was provided with User stories in 3 categories - 'Straight Up', 'Harder' and 'Advanced'. They are laid out below.
I will implement the 'Straight Up' specifications first before moving onto the 'Harder' and finally the 'Advanced' specifications.
I was also provided with some extra notes on functionality, shown below.

### Straight Up
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
```

To meet the requirements of these user stories I took the following steps:

1. Create a Chitter page which displays all peeps - these won't yet be in reverse chronological order.
2. Allow users to create a peep and have it displayed on Chitter.
3. The peep will store the time it is created.
4. Chitter will display peeps in reverse chronological order.
5. Users can sign up to Chitter (with a name, username, email and password).
6. Peeps will store data on the user that created them.
7. Chitter will display the name and username of the user that created each peep.

### Harder
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

### Advanced
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

### Notes on functionality:

* Makers don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. maker@makersacademy.com, password123, Maker Academy, mkracdmy).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

## Design

### Class-Responsibility-Collaborator cards:

| Class:          | Peep          |
|---------------- |-------------- |
|RESPONSIBILITIES | COLLABORATORS |
| content         | User          |
| created_at      |               |
| which_user?     |               |

| Class:          | User          |
|---------------- |-------------- |
|RESPONSIBILITIES | COLLABORATORS |
| name            |               |
| username        |               |
| email           |               |
| password        |               |

### Database structure

#### Peeps

| id | content | created_at | user_id |
|--- |-------- |----------- |-------- |
|    |         |            |         |

#### User

| id | name | username | email | password |
|--- |----- |----------|------ |--------- |
|    |      |          |       |          | 
