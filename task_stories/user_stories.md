# Problem breakdown

## Straight up

### User story 1 - Post a peep

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```


#### Object Model

Object | Peeps
--------------- | --------------------
Maker (user) | 
Peep | .create


#### Feature breakdown

1. Can enter a peep

2. POST peep


------

### User story 2 - See all peeps in order

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```


#### Object model

Object | Peeps
--------------- | --------------------
Maker (user) | 
Peep | .create
Peep | .all


#### Feature breakdown

1. Can view all peeps

2. Can view all peeps in correct order


------

### User story 3 - See time of peep creation

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
``` 


#### Object model

Object | Peeps
--------------- | --------------------
Maker (user) | 
Peep | .create
Peep | .all


#### Feature breakdown

1. Can view time of peep


------

### User story 4 - Sign-up

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

Notes
- Makers sign up to chitter with their name, a username, email and a password
- The username and email are unique
- Peeps will have the name of the maker and their user handle
```

#### Object model

Object | Peeps
--------------- | --------------------
Maker (user) | sign_up
Peep | .create
Peep | .all


#### Feature breakdown

1. New table -> `user` in chitter db

2. A user `has a` (many) peeps, so user_id should be included in the `peeps` table as a foreign key

3. User sees full list of peeps 

4. User can sign-up using `users/new`

5. Peeps should display the maker's (user's) name and username

```
CRCs
----

                          Peep
----------------------------------------------------------
      Responsibilities      |        Collaborator
                            |
        knows message       |            user
     knows when created     |
         knows user         |
     


                          User
----------------------------------------------------------
      Responsibilities      |        Collaborator
                            |
          knows name        |
          knows email       |
        knows password      |
        knows username      |

TABLES
------

Peeps

|  id   |     peep         |   created_at   |    user_id   |
|-------|------------------|----------------|--------------|
|  001  |  My first peep!  |   #timestamp   |      001     |



Users

|  id   |     name          |   username   |       email                |   password   |   
|-------|-------------------|--------------|----------------------------|--------------|
|  001  |   Claire Nelson   |   cnelson    |  claire@makersacademy.com  |   password1  |

```

------


## Harder

### User story 5 - Log-in

```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

#### Object model

Object | Peeps
--------------- | --------------------
Maker (user) | sign_up
Peep | .create
Peep | .all

------

### User story 6 - Log-out

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

#### Object model

Object | Messages
--------------- | --------------------
Maker (user) | sign_out


## Harder

### User story 7 - Receive email notification

```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```


