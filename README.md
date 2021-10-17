<div align="center">

### chitter
![](https://img.shields.io/github/last-commit/arthurfincham/chitter-challenge)
![](https://img.shields.io/github/languages/count/arthurfincham/chitter-challenge)
![](https://img.shields.io/github/languages/code-size/arthurfincham/chitter-challenge)

<img src="public/images/chitter_preview.gif" width="600px">

&nbsp;

</div>


#### Reference
- **Chitter** _Twitter clone_
- **Peep** _equivalent of Tweet_
### Assignment
- [x] Write a small Twitter clone that will allow the users to post messages to a public stream.
- [x] See Peeps in reverse chronological order.
- [x] See the time at which Peeps were made.
- [x] Set up user authentication for Chitter.
### My Goals
- [x] Use Boostrap only for front-end (no custom CSS).
- [x] Extract hashtags from the text in each Peep (no seperate tag input).
- [x] Ability to click on tags and only list Peeps with that tag.
- [x] Show the time of a Peep relatively (e.g. 5 mins ago).
- [x] Use an RSS feed to private a news column.

<div align="center" >

<h3>STACK</h3>

|                                                        | Tool                                                 | Use?                                       | Where can I see it?                                                  |
|--------------------------------------------------------|------------------------------------------------------|--------------------------------------------|----------------------------------------------------------------------|
| <img src="public/images/rspec.png" height="40" width="auto">       | [RSpec](https://rspec.info/)                         | Testing tool for Ruby.                     | In the spec file - unit tests for my classes.                              |
| <img src="public/images/capybara.png" height="40" width="auto">    | [Capybara](https://github.com/teamcapybara/capybara) | Acceptance test framework for Ruby.        |  In spec/features - testing for expected features.                   |
| <img src="public/images/ruby.png" height="40" width="auto">        | [Ruby](https://www.ruby-lang.org/en/)                | Programming language.                      | Everywhere!                                                          |
| <img src="public/images/sinatra.png" height="40" width="auto">     | [Sinatra](http://sinatrarb.com/)                     | DSL for quickly making web apps with Ruby. | In the file structure for the project - it is built on Sinatra.      |
| <img src="public/images/bootstrap.png" height="40" width="auto">     | [Bootstrap](https://getbootstrap.com/)                     | Open source tool-kit made by twitter. | All of the design!       |


</div>


## Install

``` bash
% git clone https://github.com/arthurfincham/chitter-challenge
```

## Usage

#### Go to the project directory and install dependencies:

``` ruby
% bundle install
 ```

#### Set up [PostgreSQL](https://www.postgresql.org/download/)

Create a database for development and test
``` SQL
CREATE DATABASE chitter_test;
CREATE DATABASE chitter_development;
```
#### The following SQL commands must be run for **both** databases.
1. Create table for users.
``` SQL
CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR( 60 ), username VARCHAR( 60 ), email VARCHAR( 60 ), password VARCHAR( 120 ));
```
2. Create table for peeps.
``` SQL
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR( 240 ), user_id INTEGER REFERENCES users (id), timestamp TIMESTAMP, likes INTEGER);
```
3. Create table for tags.
``` SQL
CREATE TABLE tags(id SERIAL PRIMARY KEY, text VARCHAR( 60 ));
```
4. Add constaint to ensure that tags are not duplicated.
``` SQL
ALTER TABLE tags ADD CONSTRAINT UC_Tag UNIQUE(text);
```
5. Create table for peep_tags - this joins peeps and tags.
``` SQL
CREATE TABLE peep_tags (id SERIAL PRIMARY KEY, peep_id INTEGER REFERENCES peeps (id), tag_id INTEGER REFERENCES tags (id));
```

#### Run the app with Sinatra
``` ruby
% ruby app.rb
```
and you're off!
