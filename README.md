## To run:

```
bundle install
rackup
```

### You will need to set up a postgreSQL database:

#### Test database:
```
CREATE DATABASE chitter_test;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240));
ALTER TABLE peeps  ADD created_at TIMESTAMP;
```

Test database will be sufficient if you uncomment line 8 in controller ('./chitter.rb:8'):

```
# ./chitter.rb:8
# for using test database for the server uncomment line below
ENV['ENVIRONMENT'] = 'test'
```

#### If you wish to use separate databases, you need to add:

```
CREATE DATABASE chitter;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240));
ALTER TABLE peeps  ADD created_at TIMESTAMP;
```

### In browser:

```
http://localhost:9292/
```

Technologies used:

Ruby, Sinatra, PostgreSQL, RSpec, Capybara

## Features:

- posts appear on the main page in reverse chronological order
- visitors can add peeps
- each peep has a timestamp

## Features in development (accessible on user_class branch):

- Visitors can register using their name, username, email and password.
- User can sign in
- Only logged in users can post

User stories:

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

## Demo:

![alt text](https://i.imgur.com/HGrDoNV.png)

![alt text](https://i.imgur.com/PHnNNZL.png)

![alt text](https://i.imgur.com/MxhWO79.png)


#### Features in development:

![alt text](https://i.imgur.com/ZAEKg4P.png)

![alt text](https://i.imgur.com/TbiJam1.png)