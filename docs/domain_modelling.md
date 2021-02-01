# Domain Modelling

User Stories
------------
>As a Maker  
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

>As a maker  
So that I can see what others are saying   
I want to see all peeps in reverse chronological order
>

>As a Maker  
So that I can better appreciate the context of a peep  
I want to see the time at which it was made
>

>As a Maker  
So that I can post messages on Chitter as me  
I want to sign up for Chitter
>

Nouns & Actions
-----
### Nouns  
- Message
- Content
- Date/Time posted (property of Message)
- User
- Name (property of user)
- Username (property of user)
- email address (property of user)
- password

### Actions
- post peep
- create user

Objects, Properties & Methods
-------
| Object          | Properties        | Methods         |
|-----------------| ------------------|-----------------|
| Peep         | content, posted_time_stamp  | new_peep       |
| User         | name, username, email_address, password  | create |


Database Structure
--------
Table: peep

|id  | content| posted |
|----|-----|------------|
|serial| varchar(280) | datetime |


Table: peep

|id  | name     | username | email_address | password    |
|----|-----     |------------|-------------|------------|
|serial| varchar(144) | varchar(60) | varchar(255) | varchar(60)
