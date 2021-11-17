<div align="center">

<img src="public/images/logo_blue.png" width="300px">

![](https://img.shields.io/github/last-commit/arthurfincham/chitter-challenge)
![](https://img.shields.io/github/languages/count/arthurfincham/chitter-challenge)
![](https://img.shields.io/github/languages/code-size/arthurfincham/chitter-challenge)



</div>

## Table of Contents
- [Preview](#Preview)
- [Assignment](#Assignment)
- [Features](#Features)
- [Install](#Install)
- [Stack](#Stack)
  * [Project](#Project)
  * [Testing](#Testing)
  * [Gems](#Gems)



<div align="center" >

## Preview

<img src="public/images/app_preview.gif" width="800px">

&nbsp;

</div>

## Assignment

#### Reference
- **Chitter**: _Twitter clone_
- **Peep**: _equivalent of Tweet_

- [x] Write a small Twitter clone that will allow the users to post messages to a public stream.
- [x] See Peeps in reverse chronological order.
- [x] See the time at which Peeps were made.
- [x] Set up user authentication for Chitter.
## Features
- [x] Use Boostrap only for front-end (no custom CSS).
- [x] Extract hashtags from the text in each Peep (no seperate tag input).
- [x] Ability to click on tags and only list Peeps with that tag.
- [x] Show the time of a Peep relatively (e.g. 5 mins ago).
- [x] Use a RSS feed to fill a news column.

## Install

``` bash
% git clone https://github.com/arthurfincham/chitter-challenge
```
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

## Stack

### Project

|                 | Tool                                      | Use?                                       | Where can I see it?                                             |
| :-------------: | ----------------------------------------- | ------------------------------------------ | --------------------------------------------------------------- |
|   <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/1200px-Postgresql_elephant.svg.png" height="auto" width="50">    | [PostgreSQL](https://www.postgresql.org)  | Object-relation database.                  | ```/db/migrations/*``` In the SQL commands below.               |
|    <img src="https://cdn.freebiesupply.com/logos/large/2x/sinatra-logo-png-transparent.png" height="auto" width="50">      | [Sinatra](http://sinatrarb.com/)          | DSL for quickly making web apps with Ruby. | In the file structure for the project - it is built on Sinatra. |
|  :<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Bootstrap_logo.svg/1280px-Bootstrap_logo.svg.png" height="auto" width="50">   | [Bootstrap](https://getbootstrap.com/)    | Open source tool-kit made by twitter.      | All of the design (no custom CSS in this app).                  |
|  <img src="https://www.drupal.org/files/issues/2019-12-27/heroku_logo.png" height="auto" width="50">   | [Heroku](https://www.heroku.com/)    | Cloud platform for deploying web apps.      | Hosting the live preview.         |

### Testing

|             | Tool                                                 | Use?                                | Where can I see it?                                 |
| :---------: | ---------------------------------------------------- | ----------------------------------- | :-------------------------------------------------- |
| <img src="https://rspec.info/images/logo_ogp.png" height="auto" width="50">  | [RSpec](https://rspec.info/)                         | Testing tool for Ruby.              | ```/spec/*``` Unit tests for the app's classes.     |



### Gems

|       | Gem                                                             | Use?                                                                   |
| :---: | --------------------------------------------------------------- | :--------------------------------------------------------------------- |
| :gem: | [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)            | Ruby binding for the OpenBSD bcrypt() password hashing algorithm, allowing you to easily store a secure hash of your users' passwords.                            |
| :gem: | [awesome_print](https://github.com/awesome-print/awesome_print) | One of my favourite gems; pretty prints output from the Rails console. |
| :gem: | [sinatra_partial](https://github.com/yb66/Sinatra-Partial) | Plug in for Sinatra partials as common in Rails projects. |