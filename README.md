# Chitter App

A small Twitter clone that will allow the users to post messages to a public stream.

USER STORIES

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

---
## Built with
- [Ruby](https://www.ruby-lang.org/en/)
- [Rackup](https://github.com/rack/rack)
- [Sinatra](https://github.com/sinatra/sinatra)
- [Sinatra Flash](https://rubygems.org/gems/sinatra-flash/versions/0.3.0)
- [PostgreSQL](https://www.postgresql.org/)
- [TablePlus](https://tableplus.com/)
- [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)
- [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)

---
# Getting Started

## Installation

1. Clone the repo
```
    git clone https://github.com/Riky5/chitter-challenge.git
```
2. Install all the gems
```
    bundle install
```
3. Connect to rackup
```
    rackup
```
4. Open the browser and type in the url
```
    localhost:port_number

    example:

    localhost:9292
```
---
## Database setup
- Start a session with **psql** or **TablePlus**
- Follow the steps provided in the **db/migration** folder. Copy paste the SQL code to setup the database.

---
To run tests
```
  rspec
```

---
# Usage

## Screenshots:

**The landing page.**

_You can sign in with username and password or as a guest. Or register if you don't have an account yet._
![Homepage1](/images/01.png)

**Sign up page.**

_You need to provide name, username, email and password. Or go to the sign in page if you're already registered._
![Sign up](/images/02.png)

**User created.**

_Once submitted all details you should see this page. You can finally go sign in._
![Signed up successfully](/images/03.png)

Example:

_Entering username and password._

![Loggin in](/images/04.png)

**Home page.**

Example:

_Here you can post messages. And see what other users posted._
![Home1](/images/05.png)

![Home2](/images/06.png)

![Home](/images/07.png)

---
### Models that helped with this challenge

MVC
![MVC model](/images/MVC_model.png)
Database
![Database model](/images/database_model.png)

---
NOTES: I wanted to add more functionalities but run out of time. A guest can sign in and also post at the moment.. something I should fix when I have time.