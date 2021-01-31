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

Nouns & Actions
-----
### Nouns  
Message
Date/Time posted (property of Message)

### Actions
post

Objects, Properties & Methods
-------
| Object          | Properties        | Methods         |
|-----------------| ------------------|-----------------|
| Message         | content, date_time_posted  | Post            |


Database Structure
--------
Table: message

|id  | content| posted |
|----|-----|------------|
|serial| varchar(280) | datetime |
