# Chitter-Challenge

### [Makers Academy](https://www.makersacademy.com) - Week 4 Weekend Challenge

## User Stories
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


# Setup Instructions

To recreate this project, you will need a local postgres database installation and the following databases:

``` 
psql

CREATE DATABASE chitter_challenge;
\c chitter_challenge
CREATE TABLE chitter ( id serial PRIMARY KEY, Peeps VARCHAR(128), TimeStamp TIME);


CREATE DATABASE chitter_challenge_test;
\c chitter_challenge_test
CREATE TABLE chitter ( id serial PRIMARY KEY, Peeps VARCHAR(128), TimeStamp TIME);
```

```SELECT * FROM chitter;```

 id | peeps | timestamp</br>
----+-------+-----------